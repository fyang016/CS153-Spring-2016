
_monkey_dominant:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void dominant_monkey();
void releaseMonkeys();
void printMessage(int, int, int);

int main(int argc, char *argv[])
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 20             	sub    $0x20,%esp
	sem_init(&wait_tree, 3);
       9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
      10:	00 
      11:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
      18:	e8 87 0f 00 00       	call   fa4 <sem_init>
  sem_init(&printer, 1);
      1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      24:	00 
      25:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
      2c:	e8 73 0f 00 00       	call   fa4 <sem_init>
  sem_init(&printer_mutex1, 1);
      31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      38:	00 
      39:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
      40:	e8 5f 0f 00 00       	call   fa4 <sem_init>
  sem_init(&printer_mutex2, 1);
      45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      4c:	00 
      4d:	c7 04 24 20 18 00 00 	movl   $0x1820,(%esp)
      54:	e8 4b 0f 00 00       	call   fa4 <sem_init>
  sem_init(&mutex, 1);
      59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      60:	00 
      61:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
      68:	e8 37 0f 00 00       	call   fa4 <sem_init>
  sem_init_full(&monkey_lock, (number_of_monkeys - 1));
      6d:	a1 9c 16 00 00       	mov    0x169c,%eax
      72:	83 e8 01             	sub    $0x1,%eax
      75:	89 44 24 04          	mov    %eax,0x4(%esp)
      79:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
      80:	e8 44 0f 00 00       	call   fc9 <sem_init_full>
	

  printf(1,"Creating %d Monkeys\n\n", number_of_monkeys);
      85:	a1 9c 16 00 00       	mov    0x169c,%eax
      8a:	89 44 24 08          	mov    %eax,0x8(%esp)
      8e:	c7 44 24 04 d8 10 00 	movl   $0x10d8,0x4(%esp)
      95:	00 
      96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      9d:	e8 c6 08 00 00       	call   968 <printf>

	int i;
	for(i = 0; i < number_of_monkeys; i++){
      a2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
      a9:	00 
      aa:	eb 3a                	jmp    e6 <main+0xe6>
    if(i != dominant_monkey_position) thread_create(monkey, 0);
      ac:	a1 a0 16 00 00       	mov    0x16a0,%eax
      b1:	39 44 24 1c          	cmp    %eax,0x1c(%esp)
      b5:	74 16                	je     cd <main+0xcd>
      b7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      be:	00 
      bf:	c7 04 24 14 01 00 00 	movl   $0x114,(%esp)
      c6:	e8 cc 0c 00 00       	call   d97 <thread_create>
      cb:	eb 14                	jmp    e1 <main+0xe1>
    else thread_create(dominant_monkey, 0); //create dominant monkey
      cd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      d4:	00 
      d5:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
      dc:	e8 b6 0c 00 00       	call   d97 <thread_create>
	

  printf(1,"Creating %d Monkeys\n\n", number_of_monkeys);

	int i;
	for(i = 0; i < number_of_monkeys; i++){
      e1:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
      e6:	a1 9c 16 00 00       	mov    0x169c,%eax
      eb:	39 44 24 1c          	cmp    %eax,0x1c(%esp)
      ef:	7c bb                	jl     ac <main+0xac>
    if(i != dominant_monkey_position) thread_create(monkey, 0);
    else thread_create(dominant_monkey, 0); //create dominant monkey
  }
  while(wait() > 0);
      f1:	90                   	nop
      f2:	e8 d1 06 00 00       	call   7c8 <wait>
      f7:	85 c0                	test   %eax,%eax
      f9:	7f f7                	jg     f2 <main+0xf2>
	printf(1,"All monkeys are full\n");
      fb:	c7 44 24 04 ee 10 00 	movl   $0x10ee,0x4(%esp)
     102:	00 
     103:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     10a:	e8 59 08 00 00       	call   968 <printf>
	exit();
     10f:	e8 ac 06 00 00       	call   7c0 <exit>

00000114 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
     114:	55                   	push   %ebp
     115:	89 e5                	mov    %esp,%ebp
     117:	83 ec 28             	sub    $0x28,%esp

  int pid =  getpid();
     11a:	e8 21 07 00 00       	call   840 <getpid>
     11f:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer_mutex1);
     122:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     129:	e8 c1 0e 00 00       	call   fef <sem_aquire>
  printMessage(pid, 1, 0);
     12e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     135:	00 
     136:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     13d:	00 
     13e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     141:	89 04 24             	mov    %eax,(%esp)
     144:	e8 cb 02 00 00       	call   414 <printMessage>


  sem_signal(&printer_mutex1); 
     149:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     150:	e8 00 0f 00 00       	call   1055 <sem_signal>

  if(dominant_present) sem_aquire(&monkey_lock);
     155:	a1 c4 16 00 00       	mov    0x16c4,%eax
     15a:	85 c0                	test   %eax,%eax
     15c:	74 0c                	je     16a <monkey+0x56>
     15e:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
     165:	e8 85 0e 00 00       	call   fef <sem_aquire>

  sem_aquire(&printer_mutex1);
     16a:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     171:	e8 79 0e 00 00       	call   fef <sem_aquire>
  sem_aquire(&wait_tree);
     176:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     17d:	e8 6d 0e 00 00       	call   fef <sem_aquire>

  sem_aquire(&mutex);
     182:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     189:	e8 61 0e 00 00       	call   fef <sem_aquire>
  monkeys_on_tree++;
     18e:	a1 c0 16 00 00       	mov    0x16c0,%eax
     193:	83 c0 01             	add    $0x1,%eax
     196:	a3 c0 16 00 00       	mov    %eax,0x16c0
  printMessage(pid, 2, 0); 
     19b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     1a2:	00 
     1a3:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     1aa:	00 
     1ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 5e 02 00 00       	call   414 <printMessage>
  sem_signal(&mutex); 
     1b6:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     1bd:	e8 93 0e 00 00       	call   1055 <sem_signal>

  sem_signal(&printer_mutex1); 
     1c2:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     1c9:	e8 87 0e 00 00       	call   1055 <sem_signal>

  sleep(100);   // Get coconut
     1ce:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
     1d5:	e8 76 06 00 00       	call   850 <sleep>


  sem_aquire(&mutex);
     1da:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     1e1:	e8 09 0e 00 00       	call   fef <sem_aquire>
  printMessage(pid, 6, 0); // Got a coconut
     1e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     1ed:	00 
     1ee:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
     1f5:	00 
     1f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1f9:	89 04 24             	mov    %eax,(%esp)
     1fc:	e8 13 02 00 00       	call   414 <printMessage>
  sem_signal(&mutex); 
     201:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     208:	e8 48 0e 00 00       	call   1055 <sem_signal>

  //printMessage(pid, 3, 0); //Climbing down tree

  sem_aquire(&printer_mutex2);
     20d:	c7 04 24 20 18 00 00 	movl   $0x1820,(%esp)
     214:	e8 d6 0d 00 00       	call   fef <sem_aquire>
  //printMessage(pid, 5, 0); // On the ground

  sem_signal(&wait_tree);
     219:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     220:	e8 30 0e 00 00       	call   1055 <sem_signal>


  sem_signal(&printer_mutex2); 
     225:	c7 04 24 20 18 00 00 	movl   $0x1820,(%esp)
     22c:	e8 24 0e 00 00       	call   1055 <sem_signal>

  sem_aquire(&mutex);
     231:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     238:	e8 b2 0d 00 00       	call   fef <sem_aquire>
  monkeys_on_tree--;
     23d:	a1 c0 16 00 00       	mov    0x16c0,%eax
     242:	83 e8 01             	sub    $0x1,%eax
     245:	a3 c0 16 00 00       	mov    %eax,0x16c0
  printMessage(pid, 3, 0); // Eating Banana
     24a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     251:	00 
     252:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
     259:	00 
     25a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25d:	89 04 24             	mov    %eax,(%esp)
     260:	e8 af 01 00 00       	call   414 <printMessage>
  sem_signal(&mutex); 
     265:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     26c:	e8 e4 0d 00 00       	call   1055 <sem_signal>
  

  texit();
     271:	e8 f2 05 00 00       	call   868 <texit>

00000276 <dominant_monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
dominant_monkey(){
     276:	55                   	push   %ebp
     277:	89 e5                	mov    %esp,%ebp
     279:	83 ec 28             	sub    $0x28,%esp

  int pid =  getpid();
     27c:	e8 bf 05 00 00       	call   840 <getpid>
     281:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer);
     284:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
     28b:	e8 5f 0d 00 00       	call   fef <sem_aquire>
  dominant_present = 1; //Make his presence known
     290:	c7 05 c4 16 00 00 01 	movl   $0x1,0x16c4
     297:	00 00 00 
  printf(1,"Dominant monkey present!!!\n");
     29a:	c7 44 24 04 04 11 00 	movl   $0x1104,0x4(%esp)
     2a1:	00 
     2a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2a9:	e8 ba 06 00 00       	call   968 <printf>
  sem_signal(&printer);
     2ae:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
     2b5:	e8 9b 0d 00 00       	call   1055 <sem_signal>

  //while(monkeys_on_tree);
  sem_aquire(&printer_mutex1);
     2ba:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     2c1:	e8 29 0d 00 00       	call   fef <sem_aquire>

  printMessage(pid, 1, 1);
     2c6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     2cd:	00 
     2ce:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     2d5:	00 
     2d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2d9:	89 04 24             	mov    %eax,(%esp)
     2dc:	e8 33 01 00 00       	call   414 <printMessage>
  sem_aquire(&wait_tree);
     2e1:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     2e8:	e8 02 0d 00 00       	call   fef <sem_aquire>

  sem_aquire(&mutex);
     2ed:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     2f4:	e8 f6 0c 00 00       	call   fef <sem_aquire>
  monkeys_on_tree++;
     2f9:	a1 c0 16 00 00       	mov    0x16c0,%eax
     2fe:	83 c0 01             	add    $0x1,%eax
     301:	a3 c0 16 00 00       	mov    %eax,0x16c0
  sem_signal(&mutex); 
     306:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     30d:	e8 43 0d 00 00       	call   1055 <sem_signal>

  printMessage(pid, 2, 1); 
     312:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     319:	00 
     31a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     321:	00 
     322:	8b 45 f4             	mov    -0xc(%ebp),%eax
     325:	89 04 24             	mov    %eax,(%esp)
     328:	e8 e7 00 00 00       	call   414 <printMessage>
  sem_signal(&printer_mutex1); 
     32d:	c7 04 24 a0 17 00 00 	movl   $0x17a0,(%esp)
     334:	e8 1c 0d 00 00       	call   1055 <sem_signal>

  sleep(100);   // Get coconut
     339:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
     340:	e8 0b 05 00 00       	call   850 <sleep>

  sem_aquire(&mutex);
     345:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     34c:	e8 9e 0c 00 00       	call   fef <sem_aquire>
  printMessage(pid, 6, 1); // Got a coconut
     351:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     358:	00 
     359:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
     360:	00 
     361:	8b 45 f4             	mov    -0xc(%ebp),%eax
     364:	89 04 24             	mov    %eax,(%esp)
     367:	e8 a8 00 00 00       	call   414 <printMessage>
  sem_signal(&mutex); 
     36c:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     373:	e8 dd 0c 00 00       	call   1055 <sem_signal>

  //printMessage(pid, 3, 1); //Climbing down tree

  sem_aquire(&printer_mutex2);
     378:	c7 04 24 20 18 00 00 	movl   $0x1820,(%esp)
     37f:	e8 6b 0c 00 00       	call   fef <sem_aquire>
  //printMessage(pid, 5, 1); // On the ground

  sem_signal(&wait_tree);
     384:	c7 04 24 60 17 00 00 	movl   $0x1760,(%esp)
     38b:	e8 c5 0c 00 00       	call   1055 <sem_signal>


  sem_signal(&printer_mutex2); 
     390:	c7 04 24 20 18 00 00 	movl   $0x1820,(%esp)
     397:	e8 b9 0c 00 00       	call   1055 <sem_signal>

  sem_aquire(&mutex);
     39c:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     3a3:	e8 47 0c 00 00       	call   fef <sem_aquire>
  monkeys_on_tree--;
     3a8:	a1 c0 16 00 00       	mov    0x16c0,%eax
     3ad:	83 e8 01             	sub    $0x1,%eax
     3b0:	a3 c0 16 00 00       	mov    %eax,0x16c0
  printMessage(pid, 3, 1); // Eating Banana
     3b5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     3bc:	00 
     3bd:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
     3c4:	00 
     3c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3c8:	89 04 24             	mov    %eax,(%esp)
     3cb:	e8 44 00 00 00       	call   414 <printMessage>
  sem_signal(&mutex); 
     3d0:	c7 04 24 e0 17 00 00 	movl   $0x17e0,(%esp)
     3d7:	e8 79 0c 00 00       	call   1055 <sem_signal>
  
  releaseMonkeys();
     3dc:	e8 05 00 00 00       	call   3e6 <releaseMonkeys>

  texit();
     3e1:	e8 82 04 00 00       	call   868 <texit>

000003e6 <releaseMonkeys>:
}

void releaseMonkeys(){
     3e6:	55                   	push   %ebp
     3e7:	89 e5                	mov    %esp,%ebp
     3e9:	83 ec 28             	sub    $0x28,%esp
  int i;
  for(i = 0; i < number_of_monkeys - 1; i++){
     3ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     3f3:	eb 10                	jmp    405 <releaseMonkeys+0x1f>
    sem_signal(&monkey_lock);
     3f5:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
     3fc:	e8 54 0c 00 00       	call   1055 <sem_signal>
  texit();
}

void releaseMonkeys(){
  int i;
  for(i = 0; i < number_of_monkeys - 1; i++){
     401:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     405:	a1 9c 16 00 00       	mov    0x169c,%eax
     40a:	83 e8 01             	sub    $0x1,%eax
     40d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     410:	7f e3                	jg     3f5 <releaseMonkeys+0xf>
    sem_signal(&monkey_lock);
  }
}
     412:	c9                   	leave  
     413:	c3                   	ret    

00000414 <printMessage>:

void printMessage(int pid, int state, int dominance){
     414:	55                   	push   %ebp
     415:	89 e5                	mov    %esp,%ebp
     417:	83 ec 18             	sub    $0x18,%esp
  sem_aquire(&printer);
     41a:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
     421:	e8 c9 0b 00 00       	call   fef <sem_aquire>
  if(!dominance)  printf(1, "Monkey    (%d)",pid);
     426:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     42a:	75 1d                	jne    449 <printMessage+0x35>
     42c:	8b 45 08             	mov    0x8(%ebp),%eax
     42f:	89 44 24 08          	mov    %eax,0x8(%esp)
     433:	c7 44 24 04 20 11 00 	movl   $0x1120,0x4(%esp)
     43a:	00 
     43b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     442:	e8 21 05 00 00       	call   968 <printf>
     447:	eb 1b                	jmp    464 <printMessage+0x50>
  else            printf(1, "Dominance (%d)",pid);
     449:	8b 45 08             	mov    0x8(%ebp),%eax
     44c:	89 44 24 08          	mov    %eax,0x8(%esp)
     450:	c7 44 24 04 2f 11 00 	movl   $0x112f,0x4(%esp)
     457:	00 
     458:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     45f:	e8 04 05 00 00       	call   968 <printf>

  //printf(1, " - %d", state); 
  switch(state){
     464:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
     468:	0f 87 bf 00 00 00    	ja     52d <printMessage+0x119>
     46e:	8b 45 0c             	mov    0xc(%ebp),%eax
     471:	c1 e0 02             	shl    $0x2,%eax
     474:	05 d0 11 00 00       	add    $0x11d0,%eax
     479:	8b 00                	mov    (%eax),%eax
     47b:	ff e0                	jmp    *%eax
    case(1):
      printf(1, " Waiting  to  climb", state); 
     47d:	8b 45 0c             	mov    0xc(%ebp),%eax
     480:	89 44 24 08          	mov    %eax,0x8(%esp)
     484:	c7 44 24 04 3e 11 00 	movl   $0x113e,0x4(%esp)
     48b:	00 
     48c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     493:	e8 d0 04 00 00       	call   968 <printf>
      break;
     498:	e9 90 00 00 00       	jmp    52d <printMessage+0x119>
    case(2):
      printf(1, " Climbing  up  tree", state); 
     49d:	8b 45 0c             	mov    0xc(%ebp),%eax
     4a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     4a4:	c7 44 24 04 52 11 00 	movl   $0x1152,0x4(%esp)
     4ab:	00 
     4ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4b3:	e8 b0 04 00 00       	call   968 <printf>
      break;
     4b8:	eb 73                	jmp    52d <printMessage+0x119>
    case(3):
      printf(1, " Climbing down tree", state); 
     4ba:	8b 45 0c             	mov    0xc(%ebp),%eax
     4bd:	89 44 24 08          	mov    %eax,0x8(%esp)
     4c1:	c7 44 24 04 66 11 00 	movl   $0x1166,0x4(%esp)
     4c8:	00 
     4c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4d0:	e8 93 04 00 00       	call   968 <printf>
      break;
     4d5:	eb 56                	jmp    52d <printMessage+0x119>
    case(4):
      printf(1, " Eating the  banana", state); 
     4d7:	8b 45 0c             	mov    0xc(%ebp),%eax
     4da:	89 44 24 08          	mov    %eax,0x8(%esp)
     4de:	c7 44 24 04 7a 11 00 	movl   $0x117a,0x4(%esp)
     4e5:	00 
     4e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4ed:	e8 76 04 00 00       	call   968 <printf>
      break;
     4f2:	eb 39                	jmp    52d <printMessage+0x119>
    case(5):
      printf(1, " On the ground safe", state); 
     4f4:	8b 45 0c             	mov    0xc(%ebp),%eax
     4f7:	89 44 24 08          	mov    %eax,0x8(%esp)
     4fb:	c7 44 24 04 8e 11 00 	movl   $0x118e,0x4(%esp)
     502:	00 
     503:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     50a:	e8 59 04 00 00       	call   968 <printf>
      break;
     50f:	eb 1c                	jmp    52d <printMessage+0x119>
    case(6):
      printf(1, " Alright a  coconut", state); 
     511:	8b 45 0c             	mov    0xc(%ebp),%eax
     514:	89 44 24 08          	mov    %eax,0x8(%esp)
     518:	c7 44 24 04 a2 11 00 	movl   $0x11a2,0x4(%esp)
     51f:	00 
     520:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     527:	e8 3c 04 00 00       	call   968 <printf>
      break;
     52c:	90                   	nop
  }

  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree); 
     52d:	a1 c0 16 00 00       	mov    0x16c0,%eax
     532:	89 44 24 08          	mov    %eax,0x8(%esp)
     536:	c7 44 24 04 b6 11 00 	movl   $0x11b6,0x4(%esp)
     53d:	00 
     53e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     545:	e8 1e 04 00 00       	call   968 <printf>
  sem_signal(&printer);
     54a:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
     551:	e8 ff 0a 00 00       	call   1055 <sem_signal>
  
     556:	c9                   	leave  
     557:	c3                   	ret    

00000558 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     558:	55                   	push   %ebp
     559:	89 e5                	mov    %esp,%ebp
     55b:	57                   	push   %edi
     55c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     55d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     560:	8b 55 10             	mov    0x10(%ebp),%edx
     563:	8b 45 0c             	mov    0xc(%ebp),%eax
     566:	89 cb                	mov    %ecx,%ebx
     568:	89 df                	mov    %ebx,%edi
     56a:	89 d1                	mov    %edx,%ecx
     56c:	fc                   	cld    
     56d:	f3 aa                	rep stos %al,%es:(%edi)
     56f:	89 ca                	mov    %ecx,%edx
     571:	89 fb                	mov    %edi,%ebx
     573:	89 5d 08             	mov    %ebx,0x8(%ebp)
     576:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     579:	5b                   	pop    %ebx
     57a:	5f                   	pop    %edi
     57b:	5d                   	pop    %ebp
     57c:	c3                   	ret    

0000057d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     57d:	55                   	push   %ebp
     57e:	89 e5                	mov    %esp,%ebp
     580:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     583:	8b 45 08             	mov    0x8(%ebp),%eax
     586:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     589:	90                   	nop
     58a:	8b 45 08             	mov    0x8(%ebp),%eax
     58d:	8d 50 01             	lea    0x1(%eax),%edx
     590:	89 55 08             	mov    %edx,0x8(%ebp)
     593:	8b 55 0c             	mov    0xc(%ebp),%edx
     596:	8d 4a 01             	lea    0x1(%edx),%ecx
     599:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     59c:	0f b6 12             	movzbl (%edx),%edx
     59f:	88 10                	mov    %dl,(%eax)
     5a1:	0f b6 00             	movzbl (%eax),%eax
     5a4:	84 c0                	test   %al,%al
     5a6:	75 e2                	jne    58a <strcpy+0xd>
    ;
  return os;
     5a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     5ab:	c9                   	leave  
     5ac:	c3                   	ret    

000005ad <strcmp>:

int
strcmp(const char *p, const char *q)
{
     5ad:	55                   	push   %ebp
     5ae:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     5b0:	eb 08                	jmp    5ba <strcmp+0xd>
    p++, q++;
     5b2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     5b6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     5ba:	8b 45 08             	mov    0x8(%ebp),%eax
     5bd:	0f b6 00             	movzbl (%eax),%eax
     5c0:	84 c0                	test   %al,%al
     5c2:	74 10                	je     5d4 <strcmp+0x27>
     5c4:	8b 45 08             	mov    0x8(%ebp),%eax
     5c7:	0f b6 10             	movzbl (%eax),%edx
     5ca:	8b 45 0c             	mov    0xc(%ebp),%eax
     5cd:	0f b6 00             	movzbl (%eax),%eax
     5d0:	38 c2                	cmp    %al,%dl
     5d2:	74 de                	je     5b2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     5d4:	8b 45 08             	mov    0x8(%ebp),%eax
     5d7:	0f b6 00             	movzbl (%eax),%eax
     5da:	0f b6 d0             	movzbl %al,%edx
     5dd:	8b 45 0c             	mov    0xc(%ebp),%eax
     5e0:	0f b6 00             	movzbl (%eax),%eax
     5e3:	0f b6 c0             	movzbl %al,%eax
     5e6:	29 c2                	sub    %eax,%edx
     5e8:	89 d0                	mov    %edx,%eax
}
     5ea:	5d                   	pop    %ebp
     5eb:	c3                   	ret    

000005ec <strlen>:

uint
strlen(char *s)
{
     5ec:	55                   	push   %ebp
     5ed:	89 e5                	mov    %esp,%ebp
     5ef:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     5f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     5f9:	eb 04                	jmp    5ff <strlen+0x13>
     5fb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     5ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
     602:	8b 45 08             	mov    0x8(%ebp),%eax
     605:	01 d0                	add    %edx,%eax
     607:	0f b6 00             	movzbl (%eax),%eax
     60a:	84 c0                	test   %al,%al
     60c:	75 ed                	jne    5fb <strlen+0xf>
    ;
  return n;
     60e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     611:	c9                   	leave  
     612:	c3                   	ret    

00000613 <memset>:

void*
memset(void *dst, int c, uint n)
{
     613:	55                   	push   %ebp
     614:	89 e5                	mov    %esp,%ebp
     616:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     619:	8b 45 10             	mov    0x10(%ebp),%eax
     61c:	89 44 24 08          	mov    %eax,0x8(%esp)
     620:	8b 45 0c             	mov    0xc(%ebp),%eax
     623:	89 44 24 04          	mov    %eax,0x4(%esp)
     627:	8b 45 08             	mov    0x8(%ebp),%eax
     62a:	89 04 24             	mov    %eax,(%esp)
     62d:	e8 26 ff ff ff       	call   558 <stosb>
  return dst;
     632:	8b 45 08             	mov    0x8(%ebp),%eax
}
     635:	c9                   	leave  
     636:	c3                   	ret    

00000637 <strchr>:

char*
strchr(const char *s, char c)
{
     637:	55                   	push   %ebp
     638:	89 e5                	mov    %esp,%ebp
     63a:	83 ec 04             	sub    $0x4,%esp
     63d:	8b 45 0c             	mov    0xc(%ebp),%eax
     640:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     643:	eb 14                	jmp    659 <strchr+0x22>
    if(*s == c)
     645:	8b 45 08             	mov    0x8(%ebp),%eax
     648:	0f b6 00             	movzbl (%eax),%eax
     64b:	3a 45 fc             	cmp    -0x4(%ebp),%al
     64e:	75 05                	jne    655 <strchr+0x1e>
      return (char*)s;
     650:	8b 45 08             	mov    0x8(%ebp),%eax
     653:	eb 13                	jmp    668 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     655:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     659:	8b 45 08             	mov    0x8(%ebp),%eax
     65c:	0f b6 00             	movzbl (%eax),%eax
     65f:	84 c0                	test   %al,%al
     661:	75 e2                	jne    645 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     663:	b8 00 00 00 00       	mov    $0x0,%eax
}
     668:	c9                   	leave  
     669:	c3                   	ret    

0000066a <gets>:

char*
gets(char *buf, int max)
{
     66a:	55                   	push   %ebp
     66b:	89 e5                	mov    %esp,%ebp
     66d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     670:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     677:	eb 4c                	jmp    6c5 <gets+0x5b>
    cc = read(0, &c, 1);
     679:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     680:	00 
     681:	8d 45 ef             	lea    -0x11(%ebp),%eax
     684:	89 44 24 04          	mov    %eax,0x4(%esp)
     688:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     68f:	e8 44 01 00 00       	call   7d8 <read>
     694:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     697:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     69b:	7f 02                	jg     69f <gets+0x35>
      break;
     69d:	eb 31                	jmp    6d0 <gets+0x66>
    buf[i++] = c;
     69f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6a2:	8d 50 01             	lea    0x1(%eax),%edx
     6a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
     6a8:	89 c2                	mov    %eax,%edx
     6aa:	8b 45 08             	mov    0x8(%ebp),%eax
     6ad:	01 c2                	add    %eax,%edx
     6af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     6b3:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     6b5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     6b9:	3c 0a                	cmp    $0xa,%al
     6bb:	74 13                	je     6d0 <gets+0x66>
     6bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     6c1:	3c 0d                	cmp    $0xd,%al
     6c3:	74 0b                	je     6d0 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c8:	83 c0 01             	add    $0x1,%eax
     6cb:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6ce:	7c a9                	jl     679 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     6d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6d3:	8b 45 08             	mov    0x8(%ebp),%eax
     6d6:	01 d0                	add    %edx,%eax
     6d8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     6db:	8b 45 08             	mov    0x8(%ebp),%eax
}
     6de:	c9                   	leave  
     6df:	c3                   	ret    

000006e0 <stat>:

int
stat(char *n, struct stat *st)
{
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     6e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     6ed:	00 
     6ee:	8b 45 08             	mov    0x8(%ebp),%eax
     6f1:	89 04 24             	mov    %eax,(%esp)
     6f4:	e8 07 01 00 00       	call   800 <open>
     6f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     6fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     700:	79 07                	jns    709 <stat+0x29>
    return -1;
     702:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     707:	eb 23                	jmp    72c <stat+0x4c>
  r = fstat(fd, st);
     709:	8b 45 0c             	mov    0xc(%ebp),%eax
     70c:	89 44 24 04          	mov    %eax,0x4(%esp)
     710:	8b 45 f4             	mov    -0xc(%ebp),%eax
     713:	89 04 24             	mov    %eax,(%esp)
     716:	e8 fd 00 00 00       	call   818 <fstat>
     71b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     71e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     721:	89 04 24             	mov    %eax,(%esp)
     724:	e8 bf 00 00 00       	call   7e8 <close>
  return r;
     729:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     72c:	c9                   	leave  
     72d:	c3                   	ret    

0000072e <atoi>:

int
atoi(const char *s)
{
     72e:	55                   	push   %ebp
     72f:	89 e5                	mov    %esp,%ebp
     731:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     734:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     73b:	eb 25                	jmp    762 <atoi+0x34>
    n = n*10 + *s++ - '0';
     73d:	8b 55 fc             	mov    -0x4(%ebp),%edx
     740:	89 d0                	mov    %edx,%eax
     742:	c1 e0 02             	shl    $0x2,%eax
     745:	01 d0                	add    %edx,%eax
     747:	01 c0                	add    %eax,%eax
     749:	89 c1                	mov    %eax,%ecx
     74b:	8b 45 08             	mov    0x8(%ebp),%eax
     74e:	8d 50 01             	lea    0x1(%eax),%edx
     751:	89 55 08             	mov    %edx,0x8(%ebp)
     754:	0f b6 00             	movzbl (%eax),%eax
     757:	0f be c0             	movsbl %al,%eax
     75a:	01 c8                	add    %ecx,%eax
     75c:	83 e8 30             	sub    $0x30,%eax
     75f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     762:	8b 45 08             	mov    0x8(%ebp),%eax
     765:	0f b6 00             	movzbl (%eax),%eax
     768:	3c 2f                	cmp    $0x2f,%al
     76a:	7e 0a                	jle    776 <atoi+0x48>
     76c:	8b 45 08             	mov    0x8(%ebp),%eax
     76f:	0f b6 00             	movzbl (%eax),%eax
     772:	3c 39                	cmp    $0x39,%al
     774:	7e c7                	jle    73d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     776:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     779:	c9                   	leave  
     77a:	c3                   	ret    

0000077b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     77b:	55                   	push   %ebp
     77c:	89 e5                	mov    %esp,%ebp
     77e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     781:	8b 45 08             	mov    0x8(%ebp),%eax
     784:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     787:	8b 45 0c             	mov    0xc(%ebp),%eax
     78a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     78d:	eb 17                	jmp    7a6 <memmove+0x2b>
    *dst++ = *src++;
     78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     792:	8d 50 01             	lea    0x1(%eax),%edx
     795:	89 55 fc             	mov    %edx,-0x4(%ebp)
     798:	8b 55 f8             	mov    -0x8(%ebp),%edx
     79b:	8d 4a 01             	lea    0x1(%edx),%ecx
     79e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     7a1:	0f b6 12             	movzbl (%edx),%edx
     7a4:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     7a6:	8b 45 10             	mov    0x10(%ebp),%eax
     7a9:	8d 50 ff             	lea    -0x1(%eax),%edx
     7ac:	89 55 10             	mov    %edx,0x10(%ebp)
     7af:	85 c0                	test   %eax,%eax
     7b1:	7f dc                	jg     78f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     7b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
     7b6:	c9                   	leave  
     7b7:	c3                   	ret    

000007b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     7b8:	b8 01 00 00 00       	mov    $0x1,%eax
     7bd:	cd 40                	int    $0x40
     7bf:	c3                   	ret    

000007c0 <exit>:
SYSCALL(exit)
     7c0:	b8 02 00 00 00       	mov    $0x2,%eax
     7c5:	cd 40                	int    $0x40
     7c7:	c3                   	ret    

000007c8 <wait>:
SYSCALL(wait)
     7c8:	b8 03 00 00 00       	mov    $0x3,%eax
     7cd:	cd 40                	int    $0x40
     7cf:	c3                   	ret    

000007d0 <pipe>:
SYSCALL(pipe)
     7d0:	b8 04 00 00 00       	mov    $0x4,%eax
     7d5:	cd 40                	int    $0x40
     7d7:	c3                   	ret    

000007d8 <read>:
SYSCALL(read)
     7d8:	b8 05 00 00 00       	mov    $0x5,%eax
     7dd:	cd 40                	int    $0x40
     7df:	c3                   	ret    

000007e0 <write>:
SYSCALL(write)
     7e0:	b8 10 00 00 00       	mov    $0x10,%eax
     7e5:	cd 40                	int    $0x40
     7e7:	c3                   	ret    

000007e8 <close>:
SYSCALL(close)
     7e8:	b8 15 00 00 00       	mov    $0x15,%eax
     7ed:	cd 40                	int    $0x40
     7ef:	c3                   	ret    

000007f0 <kill>:
SYSCALL(kill)
     7f0:	b8 06 00 00 00       	mov    $0x6,%eax
     7f5:	cd 40                	int    $0x40
     7f7:	c3                   	ret    

000007f8 <exec>:
SYSCALL(exec)
     7f8:	b8 07 00 00 00       	mov    $0x7,%eax
     7fd:	cd 40                	int    $0x40
     7ff:	c3                   	ret    

00000800 <open>:
SYSCALL(open)
     800:	b8 0f 00 00 00       	mov    $0xf,%eax
     805:	cd 40                	int    $0x40
     807:	c3                   	ret    

00000808 <mknod>:
SYSCALL(mknod)
     808:	b8 11 00 00 00       	mov    $0x11,%eax
     80d:	cd 40                	int    $0x40
     80f:	c3                   	ret    

00000810 <unlink>:
SYSCALL(unlink)
     810:	b8 12 00 00 00       	mov    $0x12,%eax
     815:	cd 40                	int    $0x40
     817:	c3                   	ret    

00000818 <fstat>:
SYSCALL(fstat)
     818:	b8 08 00 00 00       	mov    $0x8,%eax
     81d:	cd 40                	int    $0x40
     81f:	c3                   	ret    

00000820 <link>:
SYSCALL(link)
     820:	b8 13 00 00 00       	mov    $0x13,%eax
     825:	cd 40                	int    $0x40
     827:	c3                   	ret    

00000828 <mkdir>:
SYSCALL(mkdir)
     828:	b8 14 00 00 00       	mov    $0x14,%eax
     82d:	cd 40                	int    $0x40
     82f:	c3                   	ret    

00000830 <chdir>:
SYSCALL(chdir)
     830:	b8 09 00 00 00       	mov    $0x9,%eax
     835:	cd 40                	int    $0x40
     837:	c3                   	ret    

00000838 <dup>:
SYSCALL(dup)
     838:	b8 0a 00 00 00       	mov    $0xa,%eax
     83d:	cd 40                	int    $0x40
     83f:	c3                   	ret    

00000840 <getpid>:
SYSCALL(getpid)
     840:	b8 0b 00 00 00       	mov    $0xb,%eax
     845:	cd 40                	int    $0x40
     847:	c3                   	ret    

00000848 <sbrk>:
SYSCALL(sbrk)
     848:	b8 0c 00 00 00       	mov    $0xc,%eax
     84d:	cd 40                	int    $0x40
     84f:	c3                   	ret    

00000850 <sleep>:
SYSCALL(sleep)
     850:	b8 0d 00 00 00       	mov    $0xd,%eax
     855:	cd 40                	int    $0x40
     857:	c3                   	ret    

00000858 <uptime>:
SYSCALL(uptime)
     858:	b8 0e 00 00 00       	mov    $0xe,%eax
     85d:	cd 40                	int    $0x40
     85f:	c3                   	ret    

00000860 <clone>:
SYSCALL(clone)
     860:	b8 16 00 00 00       	mov    $0x16,%eax
     865:	cd 40                	int    $0x40
     867:	c3                   	ret    

00000868 <texit>:
SYSCALL(texit)
     868:	b8 17 00 00 00       	mov    $0x17,%eax
     86d:	cd 40                	int    $0x40
     86f:	c3                   	ret    

00000870 <tsleep>:
SYSCALL(tsleep)
     870:	b8 18 00 00 00       	mov    $0x18,%eax
     875:	cd 40                	int    $0x40
     877:	c3                   	ret    

00000878 <twakeup>:
SYSCALL(twakeup)
     878:	b8 19 00 00 00       	mov    $0x19,%eax
     87d:	cd 40                	int    $0x40
     87f:	c3                   	ret    

00000880 <test>:
SYSCALL(test)
     880:	b8 1a 00 00 00       	mov    $0x1a,%eax
     885:	cd 40                	int    $0x40
     887:	c3                   	ret    

00000888 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     888:	55                   	push   %ebp
     889:	89 e5                	mov    %esp,%ebp
     88b:	83 ec 18             	sub    $0x18,%esp
     88e:	8b 45 0c             	mov    0xc(%ebp),%eax
     891:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     894:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     89b:	00 
     89c:	8d 45 f4             	lea    -0xc(%ebp),%eax
     89f:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a3:	8b 45 08             	mov    0x8(%ebp),%eax
     8a6:	89 04 24             	mov    %eax,(%esp)
     8a9:	e8 32 ff ff ff       	call   7e0 <write>
}
     8ae:	c9                   	leave  
     8af:	c3                   	ret    

000008b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	56                   	push   %esi
     8b4:	53                   	push   %ebx
     8b5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     8b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     8bf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     8c3:	74 17                	je     8dc <printint+0x2c>
     8c5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     8c9:	79 11                	jns    8dc <printint+0x2c>
    neg = 1;
     8cb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     8d2:	8b 45 0c             	mov    0xc(%ebp),%eax
     8d5:	f7 d8                	neg    %eax
     8d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
     8da:	eb 06                	jmp    8e2 <printint+0x32>
  } else {
    x = xx;
     8dc:	8b 45 0c             	mov    0xc(%ebp),%eax
     8df:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     8e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     8e9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     8ec:	8d 41 01             	lea    0x1(%ecx),%eax
     8ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
     8f2:	8b 5d 10             	mov    0x10(%ebp),%ebx
     8f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
     8f8:	ba 00 00 00 00       	mov    $0x0,%edx
     8fd:	f7 f3                	div    %ebx
     8ff:	89 d0                	mov    %edx,%eax
     901:	0f b6 80 a4 16 00 00 	movzbl 0x16a4(%eax),%eax
     908:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     90c:	8b 75 10             	mov    0x10(%ebp),%esi
     90f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     912:	ba 00 00 00 00       	mov    $0x0,%edx
     917:	f7 f6                	div    %esi
     919:	89 45 ec             	mov    %eax,-0x14(%ebp)
     91c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     920:	75 c7                	jne    8e9 <printint+0x39>
  if(neg)
     922:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     926:	74 10                	je     938 <printint+0x88>
    buf[i++] = '-';
     928:	8b 45 f4             	mov    -0xc(%ebp),%eax
     92b:	8d 50 01             	lea    0x1(%eax),%edx
     92e:	89 55 f4             	mov    %edx,-0xc(%ebp)
     931:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     936:	eb 1f                	jmp    957 <printint+0xa7>
     938:	eb 1d                	jmp    957 <printint+0xa7>
    putc(fd, buf[i]);
     93a:	8d 55 dc             	lea    -0x24(%ebp),%edx
     93d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     940:	01 d0                	add    %edx,%eax
     942:	0f b6 00             	movzbl (%eax),%eax
     945:	0f be c0             	movsbl %al,%eax
     948:	89 44 24 04          	mov    %eax,0x4(%esp)
     94c:	8b 45 08             	mov    0x8(%ebp),%eax
     94f:	89 04 24             	mov    %eax,(%esp)
     952:	e8 31 ff ff ff       	call   888 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     957:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     95b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     95f:	79 d9                	jns    93a <printint+0x8a>
    putc(fd, buf[i]);
}
     961:	83 c4 30             	add    $0x30,%esp
     964:	5b                   	pop    %ebx
     965:	5e                   	pop    %esi
     966:	5d                   	pop    %ebp
     967:	c3                   	ret    

00000968 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     968:	55                   	push   %ebp
     969:	89 e5                	mov    %esp,%ebp
     96b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     96e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     975:	8d 45 0c             	lea    0xc(%ebp),%eax
     978:	83 c0 04             	add    $0x4,%eax
     97b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     97e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     985:	e9 7c 01 00 00       	jmp    b06 <printf+0x19e>
    c = fmt[i] & 0xff;
     98a:	8b 55 0c             	mov    0xc(%ebp),%edx
     98d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     990:	01 d0                	add    %edx,%eax
     992:	0f b6 00             	movzbl (%eax),%eax
     995:	0f be c0             	movsbl %al,%eax
     998:	25 ff 00 00 00       	and    $0xff,%eax
     99d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     9a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     9a4:	75 2c                	jne    9d2 <printf+0x6a>
      if(c == '%'){
     9a6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     9aa:	75 0c                	jne    9b8 <printf+0x50>
        state = '%';
     9ac:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     9b3:	e9 4a 01 00 00       	jmp    b02 <printf+0x19a>
      } else {
        putc(fd, c);
     9b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9bb:	0f be c0             	movsbl %al,%eax
     9be:	89 44 24 04          	mov    %eax,0x4(%esp)
     9c2:	8b 45 08             	mov    0x8(%ebp),%eax
     9c5:	89 04 24             	mov    %eax,(%esp)
     9c8:	e8 bb fe ff ff       	call   888 <putc>
     9cd:	e9 30 01 00 00       	jmp    b02 <printf+0x19a>
      }
    } else if(state == '%'){
     9d2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     9d6:	0f 85 26 01 00 00    	jne    b02 <printf+0x19a>
      if(c == 'd'){
     9dc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     9e0:	75 2d                	jne    a0f <printf+0xa7>
        printint(fd, *ap, 10, 1);
     9e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9e5:	8b 00                	mov    (%eax),%eax
     9e7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     9ee:	00 
     9ef:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     9f6:	00 
     9f7:	89 44 24 04          	mov    %eax,0x4(%esp)
     9fb:	8b 45 08             	mov    0x8(%ebp),%eax
     9fe:	89 04 24             	mov    %eax,(%esp)
     a01:	e8 aa fe ff ff       	call   8b0 <printint>
        ap++;
     a06:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     a0a:	e9 ec 00 00 00       	jmp    afb <printf+0x193>
      } else if(c == 'x' || c == 'p'){
     a0f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     a13:	74 06                	je     a1b <printf+0xb3>
     a15:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     a19:	75 2d                	jne    a48 <printf+0xe0>
        printint(fd, *ap, 16, 0);
     a1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a1e:	8b 00                	mov    (%eax),%eax
     a20:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a27:	00 
     a28:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     a2f:	00 
     a30:	89 44 24 04          	mov    %eax,0x4(%esp)
     a34:	8b 45 08             	mov    0x8(%ebp),%eax
     a37:	89 04 24             	mov    %eax,(%esp)
     a3a:	e8 71 fe ff ff       	call   8b0 <printint>
        ap++;
     a3f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     a43:	e9 b3 00 00 00       	jmp    afb <printf+0x193>
      } else if(c == 's'){
     a48:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     a4c:	75 45                	jne    a93 <printf+0x12b>
        s = (char*)*ap;
     a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a51:	8b 00                	mov    (%eax),%eax
     a53:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     a56:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     a5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     a5e:	75 09                	jne    a69 <printf+0x101>
          s = "(null)";
     a60:	c7 45 f4 ec 11 00 00 	movl   $0x11ec,-0xc(%ebp)
        while(*s != 0){
     a67:	eb 1e                	jmp    a87 <printf+0x11f>
     a69:	eb 1c                	jmp    a87 <printf+0x11f>
          putc(fd, *s);
     a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a6e:	0f b6 00             	movzbl (%eax),%eax
     a71:	0f be c0             	movsbl %al,%eax
     a74:	89 44 24 04          	mov    %eax,0x4(%esp)
     a78:	8b 45 08             	mov    0x8(%ebp),%eax
     a7b:	89 04 24             	mov    %eax,(%esp)
     a7e:	e8 05 fe ff ff       	call   888 <putc>
          s++;
     a83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a8a:	0f b6 00             	movzbl (%eax),%eax
     a8d:	84 c0                	test   %al,%al
     a8f:	75 da                	jne    a6b <printf+0x103>
     a91:	eb 68                	jmp    afb <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     a93:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     a97:	75 1d                	jne    ab6 <printf+0x14e>
        putc(fd, *ap);
     a99:	8b 45 e8             	mov    -0x18(%ebp),%eax
     a9c:	8b 00                	mov    (%eax),%eax
     a9e:	0f be c0             	movsbl %al,%eax
     aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa5:	8b 45 08             	mov    0x8(%ebp),%eax
     aa8:	89 04 24             	mov    %eax,(%esp)
     aab:	e8 d8 fd ff ff       	call   888 <putc>
        ap++;
     ab0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     ab4:	eb 45                	jmp    afb <printf+0x193>
      } else if(c == '%'){
     ab6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     aba:	75 17                	jne    ad3 <printf+0x16b>
        putc(fd, c);
     abc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     abf:	0f be c0             	movsbl %al,%eax
     ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ac6:	8b 45 08             	mov    0x8(%ebp),%eax
     ac9:	89 04 24             	mov    %eax,(%esp)
     acc:	e8 b7 fd ff ff       	call   888 <putc>
     ad1:	eb 28                	jmp    afb <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ad3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
     ada:	00 
     adb:	8b 45 08             	mov    0x8(%ebp),%eax
     ade:	89 04 24             	mov    %eax,(%esp)
     ae1:	e8 a2 fd ff ff       	call   888 <putc>
        putc(fd, c);
     ae6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ae9:	0f be c0             	movsbl %al,%eax
     aec:	89 44 24 04          	mov    %eax,0x4(%esp)
     af0:	8b 45 08             	mov    0x8(%ebp),%eax
     af3:	89 04 24             	mov    %eax,(%esp)
     af6:	e8 8d fd ff ff       	call   888 <putc>
      }
      state = 0;
     afb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     b02:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b06:	8b 55 0c             	mov    0xc(%ebp),%edx
     b09:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b0c:	01 d0                	add    %edx,%eax
     b0e:	0f b6 00             	movzbl (%eax),%eax
     b11:	84 c0                	test   %al,%al
     b13:	0f 85 71 fe ff ff    	jne    98a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     b19:	c9                   	leave  
     b1a:	c3                   	ret    

00000b1b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b1b:	55                   	push   %ebp
     b1c:	89 e5                	mov    %esp,%ebp
     b1e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b21:	8b 45 08             	mov    0x8(%ebp),%eax
     b24:	83 e8 08             	sub    $0x8,%eax
     b27:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b2a:	a1 d0 16 00 00       	mov    0x16d0,%eax
     b2f:	89 45 fc             	mov    %eax,-0x4(%ebp)
     b32:	eb 24                	jmp    b58 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b34:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b37:	8b 00                	mov    (%eax),%eax
     b39:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     b3c:	77 12                	ja     b50 <free+0x35>
     b3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b41:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     b44:	77 24                	ja     b6a <free+0x4f>
     b46:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b49:	8b 00                	mov    (%eax),%eax
     b4b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     b4e:	77 1a                	ja     b6a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b50:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b53:	8b 00                	mov    (%eax),%eax
     b55:	89 45 fc             	mov    %eax,-0x4(%ebp)
     b58:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b5b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     b5e:	76 d4                	jbe    b34 <free+0x19>
     b60:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b63:	8b 00                	mov    (%eax),%eax
     b65:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     b68:	76 ca                	jbe    b34 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     b6a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b6d:	8b 40 04             	mov    0x4(%eax),%eax
     b70:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     b77:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b7a:	01 c2                	add    %eax,%edx
     b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b7f:	8b 00                	mov    (%eax),%eax
     b81:	39 c2                	cmp    %eax,%edx
     b83:	75 24                	jne    ba9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     b85:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b88:	8b 50 04             	mov    0x4(%eax),%edx
     b8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b8e:	8b 00                	mov    (%eax),%eax
     b90:	8b 40 04             	mov    0x4(%eax),%eax
     b93:	01 c2                	add    %eax,%edx
     b95:	8b 45 f8             	mov    -0x8(%ebp),%eax
     b98:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     b9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     b9e:	8b 00                	mov    (%eax),%eax
     ba0:	8b 10                	mov    (%eax),%edx
     ba2:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ba5:	89 10                	mov    %edx,(%eax)
     ba7:	eb 0a                	jmp    bb3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     ba9:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bac:	8b 10                	mov    (%eax),%edx
     bae:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bb1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     bb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bb6:	8b 40 04             	mov    0x4(%eax),%eax
     bb9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     bc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bc3:	01 d0                	add    %edx,%eax
     bc5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     bc8:	75 20                	jne    bea <free+0xcf>
    p->s.size += bp->s.size;
     bca:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bcd:	8b 50 04             	mov    0x4(%eax),%edx
     bd0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     bd3:	8b 40 04             	mov    0x4(%eax),%eax
     bd6:	01 c2                	add    %eax,%edx
     bd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bdb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     bde:	8b 45 f8             	mov    -0x8(%ebp),%eax
     be1:	8b 10                	mov    (%eax),%edx
     be3:	8b 45 fc             	mov    -0x4(%ebp),%eax
     be6:	89 10                	mov    %edx,(%eax)
     be8:	eb 08                	jmp    bf2 <free+0xd7>
  } else
    p->s.ptr = bp;
     bea:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bed:	8b 55 f8             	mov    -0x8(%ebp),%edx
     bf0:	89 10                	mov    %edx,(%eax)
  freep = p;
     bf2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     bf5:	a3 d0 16 00 00       	mov    %eax,0x16d0
}
     bfa:	c9                   	leave  
     bfb:	c3                   	ret    

00000bfc <morecore>:

static Header*
morecore(uint nu)
{
     bfc:	55                   	push   %ebp
     bfd:	89 e5                	mov    %esp,%ebp
     bff:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     c02:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     c09:	77 07                	ja     c12 <morecore+0x16>
    nu = 4096;
     c0b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     c12:	8b 45 08             	mov    0x8(%ebp),%eax
     c15:	c1 e0 03             	shl    $0x3,%eax
     c18:	89 04 24             	mov    %eax,(%esp)
     c1b:	e8 28 fc ff ff       	call   848 <sbrk>
     c20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     c23:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     c27:	75 07                	jne    c30 <morecore+0x34>
    return 0;
     c29:	b8 00 00 00 00       	mov    $0x0,%eax
     c2e:	eb 22                	jmp    c52 <morecore+0x56>
  hp = (Header*)p;
     c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c33:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     c36:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c39:	8b 55 08             	mov    0x8(%ebp),%edx
     c3c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     c3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c42:	83 c0 08             	add    $0x8,%eax
     c45:	89 04 24             	mov    %eax,(%esp)
     c48:	e8 ce fe ff ff       	call   b1b <free>
  return freep;
     c4d:	a1 d0 16 00 00       	mov    0x16d0,%eax
}
     c52:	c9                   	leave  
     c53:	c3                   	ret    

00000c54 <malloc>:

void*
malloc(uint nbytes)
{
     c54:	55                   	push   %ebp
     c55:	89 e5                	mov    %esp,%ebp
     c57:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c5a:	8b 45 08             	mov    0x8(%ebp),%eax
     c5d:	83 c0 07             	add    $0x7,%eax
     c60:	c1 e8 03             	shr    $0x3,%eax
     c63:	83 c0 01             	add    $0x1,%eax
     c66:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     c69:	a1 d0 16 00 00       	mov    0x16d0,%eax
     c6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
     c71:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c75:	75 23                	jne    c9a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     c77:	c7 45 f0 c8 16 00 00 	movl   $0x16c8,-0x10(%ebp)
     c7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c81:	a3 d0 16 00 00       	mov    %eax,0x16d0
     c86:	a1 d0 16 00 00       	mov    0x16d0,%eax
     c8b:	a3 c8 16 00 00       	mov    %eax,0x16c8
    base.s.size = 0;
     c90:	c7 05 cc 16 00 00 00 	movl   $0x0,0x16cc
     c97:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     c9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c9d:	8b 00                	mov    (%eax),%eax
     c9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca5:	8b 40 04             	mov    0x4(%eax),%eax
     ca8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     cab:	72 4d                	jb     cfa <malloc+0xa6>
      if(p->s.size == nunits)
     cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cb0:	8b 40 04             	mov    0x4(%eax),%eax
     cb3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     cb6:	75 0c                	jne    cc4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     cb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cbb:	8b 10                	mov    (%eax),%edx
     cbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cc0:	89 10                	mov    %edx,(%eax)
     cc2:	eb 26                	jmp    cea <malloc+0x96>
      else {
        p->s.size -= nunits;
     cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc7:	8b 40 04             	mov    0x4(%eax),%eax
     cca:	2b 45 ec             	sub    -0x14(%ebp),%eax
     ccd:	89 c2                	mov    %eax,%edx
     ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd8:	8b 40 04             	mov    0x4(%eax),%eax
     cdb:	c1 e0 03             	shl    $0x3,%eax
     cde:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     ce1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce4:	8b 55 ec             	mov    -0x14(%ebp),%edx
     ce7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     cea:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ced:	a3 d0 16 00 00       	mov    %eax,0x16d0
      return (void*)(p + 1);
     cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cf5:	83 c0 08             	add    $0x8,%eax
     cf8:	eb 38                	jmp    d32 <malloc+0xde>
    }
    if(p == freep)
     cfa:	a1 d0 16 00 00       	mov    0x16d0,%eax
     cff:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     d02:	75 1b                	jne    d1f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
     d04:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d07:	89 04 24             	mov    %eax,(%esp)
     d0a:	e8 ed fe ff ff       	call   bfc <morecore>
     d0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
     d12:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d16:	75 07                	jne    d1f <malloc+0xcb>
        return 0;
     d18:	b8 00 00 00 00       	mov    $0x0,%eax
     d1d:	eb 13                	jmp    d32 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d22:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d28:	8b 00                	mov    (%eax),%eax
     d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     d2d:	e9 70 ff ff ff       	jmp    ca2 <malloc+0x4e>
}
     d32:	c9                   	leave  
     d33:	c3                   	ret    

00000d34 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
     d34:	55                   	push   %ebp
     d35:	89 e5                	mov    %esp,%ebp
     d37:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
     d3a:	8b 55 08             	mov    0x8(%ebp),%edx
     d3d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d40:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d43:	f0 87 02             	lock xchg %eax,(%edx)
     d46:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
     d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d4c:	c9                   	leave  
     d4d:	c3                   	ret    

00000d4e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
     d4e:	55                   	push   %ebp
     d4f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
     d51:	8b 45 08             	mov    0x8(%ebp),%eax
     d54:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     d5a:	5d                   	pop    %ebp
     d5b:	c3                   	ret    

00000d5c <lock_acquire>:
void lock_acquire(lock_t *lock){
     d5c:	55                   	push   %ebp
     d5d:	89 e5                	mov    %esp,%ebp
     d5f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
     d62:	90                   	nop
     d63:	8b 45 08             	mov    0x8(%ebp),%eax
     d66:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     d6d:	00 
     d6e:	89 04 24             	mov    %eax,(%esp)
     d71:	e8 be ff ff ff       	call   d34 <xchg>
     d76:	85 c0                	test   %eax,%eax
     d78:	75 e9                	jne    d63 <lock_acquire+0x7>
}
     d7a:	c9                   	leave  
     d7b:	c3                   	ret    

00000d7c <lock_release>:
void lock_release(lock_t *lock){
     d7c:	55                   	push   %ebp
     d7d:	89 e5                	mov    %esp,%ebp
     d7f:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
     d82:	8b 45 08             	mov    0x8(%ebp),%eax
     d85:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d8c:	00 
     d8d:	89 04 24             	mov    %eax,(%esp)
     d90:	e8 9f ff ff ff       	call   d34 <xchg>
}
     d95:	c9                   	leave  
     d96:	c3                   	ret    

00000d97 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
     d97:	55                   	push   %ebp
     d98:	89 e5                	mov    %esp,%ebp
     d9a:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
     d9d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
     da4:	e8 ab fe ff ff       	call   c54 <malloc>
     da9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
     dac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     daf:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
     db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     db5:	25 ff 0f 00 00       	and    $0xfff,%eax
     dba:	85 c0                	test   %eax,%eax
     dbc:	74 14                	je     dd2 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
     dbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc1:	25 ff 0f 00 00       	and    $0xfff,%eax
     dc6:	89 c2                	mov    %eax,%edx
     dc8:	b8 00 10 00 00       	mov    $0x1000,%eax
     dcd:	29 d0                	sub    %edx,%eax
     dcf:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
     dd2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     dd6:	75 1b                	jne    df3 <thread_create+0x5c>

        printf(1,"malloc fail \n");
     dd8:	c7 44 24 04 f3 11 00 	movl   $0x11f3,0x4(%esp)
     ddf:	00 
     de0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     de7:	e8 7c fb ff ff       	call   968 <printf>
        return 0;
     dec:	b8 00 00 00 00       	mov    $0x0,%eax
     df1:	eb 6f                	jmp    e62 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
     df3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     df6:	8b 55 08             	mov    0x8(%ebp),%edx
     df9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dfc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     e00:	89 54 24 08          	mov    %edx,0x8(%esp)
     e04:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
     e0b:	00 
     e0c:	89 04 24             	mov    %eax,(%esp)
     e0f:	e8 4c fa ff ff       	call   860 <clone>
     e14:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
     e17:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e1b:	79 1b                	jns    e38 <thread_create+0xa1>
        printf(1,"clone fails\n");
     e1d:	c7 44 24 04 01 12 00 	movl   $0x1201,0x4(%esp)
     e24:	00 
     e25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e2c:	e8 37 fb ff ff       	call   968 <printf>
        return 0;
     e31:	b8 00 00 00 00       	mov    $0x0,%eax
     e36:	eb 2a                	jmp    e62 <thread_create+0xcb>
    }
    if(tid > 0){
     e38:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e3c:	7e 05                	jle    e43 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
     e3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e41:	eb 1f                	jmp    e62 <thread_create+0xcb>
    }
    if(tid == 0){
     e43:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e47:	75 14                	jne    e5d <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
     e49:	c7 44 24 04 0e 12 00 	movl   $0x120e,0x4(%esp)
     e50:	00 
     e51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e58:	e8 0b fb ff ff       	call   968 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
     e5d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e62:	c9                   	leave  
     e63:	c3                   	ret    

00000e64 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
     e64:	55                   	push   %ebp
     e65:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
     e67:	a1 b8 16 00 00       	mov    0x16b8,%eax
     e6c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
     e72:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
     e77:	a3 b8 16 00 00       	mov    %eax,0x16b8
    return (int)(rands % max);
     e7c:	a1 b8 16 00 00       	mov    0x16b8,%eax
     e81:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e84:	ba 00 00 00 00       	mov    $0x0,%edx
     e89:	f7 f1                	div    %ecx
     e8b:	89 d0                	mov    %edx,%eax
     e8d:	5d                   	pop    %ebp
     e8e:	c3                   	ret    

00000e8f <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
     e8f:	55                   	push   %ebp
     e90:	89 e5                	mov    %esp,%ebp
    q->size = 0;
     e92:	8b 45 08             	mov    0x8(%ebp),%eax
     e95:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
     e9b:	8b 45 08             	mov    0x8(%ebp),%eax
     e9e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
     ea5:	8b 45 08             	mov    0x8(%ebp),%eax
     ea8:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
     eaf:	5d                   	pop    %ebp
     eb0:	c3                   	ret    

00000eb1 <add_q>:

void add_q(struct queue *q, int v){
     eb1:	55                   	push   %ebp
     eb2:	89 e5                	mov    %esp,%ebp
     eb4:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
     eb7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     ebe:	e8 91 fd ff ff       	call   c54 <malloc>
     ec3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
     ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
     ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ed3:	8b 55 0c             	mov    0xc(%ebp),%edx
     ed6:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
     ed8:	8b 45 08             	mov    0x8(%ebp),%eax
     edb:	8b 40 04             	mov    0x4(%eax),%eax
     ede:	85 c0                	test   %eax,%eax
     ee0:	75 0b                	jne    eed <add_q+0x3c>
        q->head = n;
     ee2:	8b 45 08             	mov    0x8(%ebp),%eax
     ee5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ee8:	89 50 04             	mov    %edx,0x4(%eax)
     eeb:	eb 0c                	jmp    ef9 <add_q+0x48>
    }else{
        q->tail->next = n;
     eed:	8b 45 08             	mov    0x8(%ebp),%eax
     ef0:	8b 40 08             	mov    0x8(%eax),%eax
     ef3:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ef6:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
     ef9:	8b 45 08             	mov    0x8(%ebp),%eax
     efc:	8b 55 f4             	mov    -0xc(%ebp),%edx
     eff:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
     f02:	8b 45 08             	mov    0x8(%ebp),%eax
     f05:	8b 00                	mov    (%eax),%eax
     f07:	8d 50 01             	lea    0x1(%eax),%edx
     f0a:	8b 45 08             	mov    0x8(%ebp),%eax
     f0d:	89 10                	mov    %edx,(%eax)
}
     f0f:	c9                   	leave  
     f10:	c3                   	ret    

00000f11 <empty_q>:

int empty_q(struct queue *q){
     f11:	55                   	push   %ebp
     f12:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
     f14:	8b 45 08             	mov    0x8(%ebp),%eax
     f17:	8b 00                	mov    (%eax),%eax
     f19:	85 c0                	test   %eax,%eax
     f1b:	75 07                	jne    f24 <empty_q+0x13>
        return 1;
     f1d:	b8 01 00 00 00       	mov    $0x1,%eax
     f22:	eb 05                	jmp    f29 <empty_q+0x18>
    else
        return 0;
     f24:	b8 00 00 00 00       	mov    $0x0,%eax
} 
     f29:	5d                   	pop    %ebp
     f2a:	c3                   	ret    

00000f2b <pop_q>:
int pop_q(struct queue *q){
     f2b:	55                   	push   %ebp
     f2c:	89 e5                	mov    %esp,%ebp
     f2e:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
     f31:	8b 45 08             	mov    0x8(%ebp),%eax
     f34:	89 04 24             	mov    %eax,(%esp)
     f37:	e8 d5 ff ff ff       	call   f11 <empty_q>
     f3c:	85 c0                	test   %eax,%eax
     f3e:	75 5d                	jne    f9d <pop_q+0x72>
       val = q->head->value; 
     f40:	8b 45 08             	mov    0x8(%ebp),%eax
     f43:	8b 40 04             	mov    0x4(%eax),%eax
     f46:	8b 00                	mov    (%eax),%eax
     f48:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
     f4b:	8b 45 08             	mov    0x8(%ebp),%eax
     f4e:	8b 40 04             	mov    0x4(%eax),%eax
     f51:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
     f54:	8b 45 08             	mov    0x8(%ebp),%eax
     f57:	8b 40 04             	mov    0x4(%eax),%eax
     f5a:	8b 50 04             	mov    0x4(%eax),%edx
     f5d:	8b 45 08             	mov    0x8(%ebp),%eax
     f60:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
     f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f66:	89 04 24             	mov    %eax,(%esp)
     f69:	e8 ad fb ff ff       	call   b1b <free>
       q->size--;
     f6e:	8b 45 08             	mov    0x8(%ebp),%eax
     f71:	8b 00                	mov    (%eax),%eax
     f73:	8d 50 ff             	lea    -0x1(%eax),%edx
     f76:	8b 45 08             	mov    0x8(%ebp),%eax
     f79:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
     f7b:	8b 45 08             	mov    0x8(%ebp),%eax
     f7e:	8b 00                	mov    (%eax),%eax
     f80:	85 c0                	test   %eax,%eax
     f82:	75 14                	jne    f98 <pop_q+0x6d>
            q->head = 0;
     f84:	8b 45 08             	mov    0x8(%ebp),%eax
     f87:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
     f8e:	8b 45 08             	mov    0x8(%ebp),%eax
     f91:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
     f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f9b:	eb 05                	jmp    fa2 <pop_q+0x77>
    }
    return -1;
     f9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     fa2:	c9                   	leave  
     fa3:	c3                   	ret    

00000fa4 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
     fa4:	55                   	push   %ebp
     fa5:	89 e5                	mov    %esp,%ebp
     fa7:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
     faa:	8b 45 08             	mov    0x8(%ebp),%eax
     fad:	8b 55 0c             	mov    0xc(%ebp),%edx
     fb0:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
     fb3:	8b 45 08             	mov    0x8(%ebp),%eax
     fb6:	8b 55 0c             	mov    0xc(%ebp),%edx
     fb9:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
     fbc:	8b 45 08             	mov    0x8(%ebp),%eax
     fbf:	89 04 24             	mov    %eax,(%esp)
     fc2:	e8 87 fd ff ff       	call   d4e <lock_init>
}
     fc7:	c9                   	leave  
     fc8:	c3                   	ret    

00000fc9 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
     fc9:	55                   	push   %ebp
     fca:	89 e5                	mov    %esp,%ebp
     fcc:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
     fcf:	8b 45 08             	mov    0x8(%ebp),%eax
     fd2:	8b 55 0c             	mov    0xc(%ebp),%edx
     fd5:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
     fd8:	8b 45 08             	mov    0x8(%ebp),%eax
     fdb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
     fe2:	8b 45 08             	mov    0x8(%ebp),%eax
     fe5:	89 04 24             	mov    %eax,(%esp)
     fe8:	e8 61 fd ff ff       	call   d4e <lock_init>
}
     fed:	c9                   	leave  
     fee:	c3                   	ret    

00000fef <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
     fef:	55                   	push   %ebp
     ff0:	89 e5                	mov    %esp,%ebp
     ff2:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
     ff5:	8b 45 08             	mov    0x8(%ebp),%eax
     ff8:	89 04 24             	mov    %eax,(%esp)
     ffb:	e8 5c fd ff ff       	call   d5c <lock_acquire>
	if(s->count  == 0){
    1000:	8b 45 08             	mov    0x8(%ebp),%eax
    1003:	8b 40 04             	mov    0x4(%eax),%eax
    1006:	85 c0                	test   %eax,%eax
    1008:	75 2f                	jne    1039 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
    100a:	e8 31 f8 ff ff       	call   840 <getpid>
    100f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
    1012:	8b 45 08             	mov    0x8(%ebp),%eax
    1015:	8d 50 0c             	lea    0xc(%eax),%edx
    1018:	8b 45 f4             	mov    -0xc(%ebp),%eax
    101b:	89 44 24 04          	mov    %eax,0x4(%esp)
    101f:	89 14 24             	mov    %edx,(%esp)
    1022:	e8 8a fe ff ff       	call   eb1 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
    1027:	8b 45 08             	mov    0x8(%ebp),%eax
    102a:	89 04 24             	mov    %eax,(%esp)
    102d:	e8 4a fd ff ff       	call   d7c <lock_release>
		tsleep(); 
    1032:	e8 39 f8 ff ff       	call   870 <tsleep>
    1037:	eb 1a                	jmp    1053 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
    1039:	8b 45 08             	mov    0x8(%ebp),%eax
    103c:	8b 40 04             	mov    0x4(%eax),%eax
    103f:	8d 50 ff             	lea    -0x1(%eax),%edx
    1042:	8b 45 08             	mov    0x8(%ebp),%eax
    1045:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
    1048:	8b 45 08             	mov    0x8(%ebp),%eax
    104b:	89 04 24             	mov    %eax,(%esp)
    104e:	e8 29 fd ff ff       	call   d7c <lock_release>
	}
}
    1053:	c9                   	leave  
    1054:	c3                   	ret    

00001055 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
    1055:	55                   	push   %ebp
    1056:	89 e5                	mov    %esp,%ebp
    1058:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
    105b:	8b 45 08             	mov    0x8(%ebp),%eax
    105e:	89 04 24             	mov    %eax,(%esp)
    1061:	e8 f6 fc ff ff       	call   d5c <lock_acquire>
	if(s->count < s->size){
    1066:	8b 45 08             	mov    0x8(%ebp),%eax
    1069:	8b 50 04             	mov    0x4(%eax),%edx
    106c:	8b 45 08             	mov    0x8(%ebp),%eax
    106f:	8b 40 08             	mov    0x8(%eax),%eax
    1072:	39 c2                	cmp    %eax,%edx
    1074:	7d 0f                	jge    1085 <sem_signal+0x30>
		s->count++;	
    1076:	8b 45 08             	mov    0x8(%ebp),%eax
    1079:	8b 40 04             	mov    0x4(%eax),%eax
    107c:	8d 50 01             	lea    0x1(%eax),%edx
    107f:	8b 45 08             	mov    0x8(%ebp),%eax
    1082:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
    1085:	8b 45 08             	mov    0x8(%ebp),%eax
    1088:	83 c0 0c             	add    $0xc,%eax
    108b:	89 04 24             	mov    %eax,(%esp)
    108e:	e8 98 fe ff ff       	call   f2b <pop_q>
    1093:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
    1096:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    109a:	74 2e                	je     10ca <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
    109c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109f:	89 04 24             	mov    %eax,(%esp)
    10a2:	e8 d1 f7 ff ff       	call   878 <twakeup>
		s->count--;
    10a7:	8b 45 08             	mov    0x8(%ebp),%eax
    10aa:	8b 40 04             	mov    0x4(%eax),%eax
    10ad:	8d 50 ff             	lea    -0x1(%eax),%edx
    10b0:	8b 45 08             	mov    0x8(%ebp),%eax
    10b3:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
    10b6:	8b 45 08             	mov    0x8(%ebp),%eax
    10b9:	8b 40 04             	mov    0x4(%eax),%eax
    10bc:	85 c0                	test   %eax,%eax
    10be:	79 0a                	jns    10ca <sem_signal+0x75>
    10c0:	8b 45 08             	mov    0x8(%ebp),%eax
    10c3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
    10ca:	8b 45 08             	mov    0x8(%ebp),%eax
    10cd:	89 04 24             	mov    %eax,(%esp)
    10d0:	e8 a7 fc ff ff       	call   d7c <lock_release>

    10d5:	c9                   	leave  
    10d6:	c3                   	ret    
