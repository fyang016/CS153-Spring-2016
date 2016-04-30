
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 0c                	jne    18 <runcmd+0x18>
    exit(0);
       c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      13:	e8 88 0f 00 00       	call   fa0 <exit>
  
  switch(cmd->type){
      18:	8b 45 08             	mov    0x8(%ebp),%eax
      1b:	8b 00                	mov    (%eax),%eax
      1d:	83 f8 05             	cmp    $0x5,%eax
      20:	77 09                	ja     2b <runcmd+0x2b>
      22:	8b 04 85 24 15 00 00 	mov    0x1524(,%eax,4),%eax
      29:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      2b:	c7 04 24 f8 14 00 00 	movl   $0x14f8,(%esp)
      32:	e8 61 03 00 00       	call   398 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      37:	8b 45 08             	mov    0x8(%ebp),%eax
      3a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(ecmd->argv[0] == 0)
      3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      40:	8b 40 04             	mov    0x4(%eax),%eax
      43:	85 c0                	test   %eax,%eax
      45:	75 0c                	jne    53 <runcmd+0x53>
      exit(0);
      47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      4e:	e8 4d 0f 00 00       	call   fa0 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      53:	8b 45 e8             	mov    -0x18(%ebp),%eax
      56:	8d 50 04             	lea    0x4(%eax),%edx
      59:	8b 45 e8             	mov    -0x18(%ebp),%eax
      5c:	8b 40 04             	mov    0x4(%eax),%eax
      5f:	89 54 24 04          	mov    %edx,0x4(%esp)
      63:	89 04 24             	mov    %eax,(%esp)
      66:	e8 75 0f 00 00       	call   fe0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
      6e:	8b 40 04             	mov    0x4(%eax),%eax
      71:	89 44 24 08          	mov    %eax,0x8(%esp)
      75:	c7 44 24 04 ff 14 00 	movl   $0x14ff,0x4(%esp)
      7c:	00 
      7d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      84:	e8 a8 10 00 00       	call   1131 <printf>
    break;
      89:	e9 9f 01 00 00       	jmp    22d <runcmd+0x22d>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      8e:	8b 45 08             	mov    0x8(%ebp),%eax
      91:	89 45 f4             	mov    %eax,-0xc(%ebp)
    close(rcmd->fd);
      94:	8b 45 f4             	mov    -0xc(%ebp),%eax
      97:	8b 40 14             	mov    0x14(%eax),%eax
      9a:	89 04 24             	mov    %eax,(%esp)
      9d:	e8 2e 0f 00 00       	call   fd0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
      a5:	8b 50 10             	mov    0x10(%eax),%edx
      a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ab:	8b 40 08             	mov    0x8(%eax),%eax
      ae:	89 54 24 04          	mov    %edx,0x4(%esp)
      b2:	89 04 24             	mov    %eax,(%esp)
      b5:	e8 2e 0f 00 00       	call   fe8 <open>
      ba:	85 c0                	test   %eax,%eax
      bc:	79 2a                	jns    e8 <runcmd+0xe8>
      printf(2, "open %s failed\n", rcmd->file);
      be:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c1:	8b 40 08             	mov    0x8(%eax),%eax
      c4:	89 44 24 08          	mov    %eax,0x8(%esp)
      c8:	c7 44 24 04 0f 15 00 	movl   $0x150f,0x4(%esp)
      cf:	00 
      d0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      d7:	e8 55 10 00 00       	call   1131 <printf>
      exit(1);
      dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      e3:	e8 b8 0e 00 00       	call   fa0 <exit>
    }
    runcmd(rcmd->cmd);
      e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
      eb:	8b 40 04             	mov    0x4(%eax),%eax
      ee:	89 04 24             	mov    %eax,(%esp)
      f1:	e8 0a ff ff ff       	call   0 <runcmd>
    break;
      f6:	e9 32 01 00 00       	jmp    22d <runcmd+0x22d>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      fb:	8b 45 08             	mov    0x8(%ebp),%eax
      fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
     101:	e8 bf 02 00 00       	call   3c5 <fork1>
     106:	85 c0                	test   %eax,%eax
     108:	75 0e                	jne    118 <runcmd+0x118>
      runcmd(lcmd->left);
     10a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10d:	8b 40 04             	mov    0x4(%eax),%eax
     110:	89 04 24             	mov    %eax,(%esp)
     113:	e8 e8 fe ff ff       	call   0 <runcmd>
    wait(0);
     118:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     11f:	e8 84 0e 00 00       	call   fa8 <wait>
    runcmd(lcmd->right);
     124:	8b 45 ec             	mov    -0x14(%ebp),%eax
     127:	8b 40 08             	mov    0x8(%eax),%eax
     12a:	89 04 24             	mov    %eax,(%esp)
     12d:	e8 ce fe ff ff       	call   0 <runcmd>
    break;
     132:	e9 f6 00 00 00       	jmp    22d <runcmd+0x22d>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     137:	8b 45 08             	mov    0x8(%ebp),%eax
     13a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pipe(p) < 0)
     13d:	8d 45 dc             	lea    -0x24(%ebp),%eax
     140:	89 04 24             	mov    %eax,(%esp)
     143:	e8 70 0e 00 00       	call   fb8 <pipe>
     148:	85 c0                	test   %eax,%eax
     14a:	79 0c                	jns    158 <runcmd+0x158>
      panic("pipe");
     14c:	c7 04 24 1f 15 00 00 	movl   $0x151f,(%esp)
     153:	e8 40 02 00 00       	call   398 <panic>
    if(fork1() == 0){
     158:	e8 68 02 00 00       	call   3c5 <fork1>
     15d:	85 c0                	test   %eax,%eax
     15f:	75 3b                	jne    19c <runcmd+0x19c>
      close(1);
     161:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     168:	e8 63 0e 00 00       	call   fd0 <close>
      dup(p[1]);
     16d:	8b 45 e0             	mov    -0x20(%ebp),%eax
     170:	89 04 24             	mov    %eax,(%esp)
     173:	e8 a8 0e 00 00       	call   1020 <dup>
      close(p[0]);
     178:	8b 45 dc             	mov    -0x24(%ebp),%eax
     17b:	89 04 24             	mov    %eax,(%esp)
     17e:	e8 4d 0e 00 00       	call   fd0 <close>
      close(p[1]);
     183:	8b 45 e0             	mov    -0x20(%ebp),%eax
     186:	89 04 24             	mov    %eax,(%esp)
     189:	e8 42 0e 00 00       	call   fd0 <close>
      runcmd(pcmd->left);
     18e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     191:	8b 40 04             	mov    0x4(%eax),%eax
     194:	89 04 24             	mov    %eax,(%esp)
     197:	e8 64 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     19c:	e8 24 02 00 00       	call   3c5 <fork1>
     1a1:	85 c0                	test   %eax,%eax
     1a3:	75 3b                	jne    1e0 <runcmd+0x1e0>
      close(0);
     1a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ac:	e8 1f 0e 00 00       	call   fd0 <close>
      dup(p[0]);
     1b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1b4:	89 04 24             	mov    %eax,(%esp)
     1b7:	e8 64 0e 00 00       	call   1020 <dup>
      close(p[0]);
     1bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1bf:	89 04 24             	mov    %eax,(%esp)
     1c2:	e8 09 0e 00 00       	call   fd0 <close>
      close(p[1]);
     1c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ca:	89 04 24             	mov    %eax,(%esp)
     1cd:	e8 fe 0d 00 00       	call   fd0 <close>
      runcmd(pcmd->right);
     1d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1d5:	8b 40 08             	mov    0x8(%eax),%eax
     1d8:	89 04 24             	mov    %eax,(%esp)
     1db:	e8 20 fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1e3:	89 04 24             	mov    %eax,(%esp)
     1e6:	e8 e5 0d 00 00       	call   fd0 <close>
    close(p[1]);
     1eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ee:	89 04 24             	mov    %eax,(%esp)
     1f1:	e8 da 0d 00 00       	call   fd0 <close>
    wait(0);
     1f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1fd:	e8 a6 0d 00 00       	call   fa8 <wait>
    wait(0);
     202:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     209:	e8 9a 0d 00 00       	call   fa8 <wait>
    break;
     20e:	eb 1d                	jmp    22d <runcmd+0x22d>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     210:	8b 45 08             	mov    0x8(%ebp),%eax
     213:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     216:	e8 aa 01 00 00       	call   3c5 <fork1>
     21b:	85 c0                	test   %eax,%eax
     21d:	75 0e                	jne    22d <runcmd+0x22d>
      runcmd(bcmd->cmd);
     21f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     222:	8b 40 04             	mov    0x4(%eax),%eax
     225:	89 04 24             	mov    %eax,(%esp)
     228:	e8 d3 fd ff ff       	call   0 <runcmd>
    break;
  }
  exit(0);
     22d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     234:	e8 67 0d 00 00       	call   fa0 <exit>

00000239 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     239:	55                   	push   %ebp
     23a:	89 e5                	mov    %esp,%ebp
     23c:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     23f:	c7 44 24 04 3c 15 00 	movl   $0x153c,0x4(%esp)
     246:	00 
     247:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     24e:	e8 de 0e 00 00       	call   1131 <printf>
  memset(buf, 0, nbuf);
     253:	8b 45 0c             	mov    0xc(%ebp),%eax
     256:	89 44 24 08          	mov    %eax,0x8(%esp)
     25a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     261:	00 
     262:	8b 45 08             	mov    0x8(%ebp),%eax
     265:	89 04 24             	mov    %eax,(%esp)
     268:	e8 8d 0b 00 00       	call   dfa <memset>
  gets(buf, nbuf);
     26d:	8b 45 0c             	mov    0xc(%ebp),%eax
     270:	89 44 24 04          	mov    %eax,0x4(%esp)
     274:	8b 45 08             	mov    0x8(%ebp),%eax
     277:	89 04 24             	mov    %eax,(%esp)
     27a:	e8 d2 0b 00 00       	call   e51 <gets>
  if(buf[0] == 0) // EOF
     27f:	8b 45 08             	mov    0x8(%ebp),%eax
     282:	0f b6 00             	movzbl (%eax),%eax
     285:	84 c0                	test   %al,%al
     287:	75 07                	jne    290 <getcmd+0x57>
    return -1;
     289:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     28e:	eb 05                	jmp    295 <getcmd+0x5c>
  return 0;
     290:	b8 00 00 00 00       	mov    $0x0,%eax
}
     295:	c9                   	leave  
     296:	c3                   	ret    

00000297 <main>:

int
main(void)
{
     297:	55                   	push   %ebp
     298:	89 e5                	mov    %esp,%ebp
     29a:	83 e4 f0             	and    $0xfffffff0,%esp
     29d:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2a0:	eb 19                	jmp    2bb <main+0x24>
    if(fd >= 3){
     2a2:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     2a7:	7e 12                	jle    2bb <main+0x24>
      close(fd);
     2a9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     2ad:	89 04 24             	mov    %eax,(%esp)
     2b0:	e8 1b 0d 00 00       	call   fd0 <close>
      break;
     2b5:	90                   	nop
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2b6:	e9 b5 00 00 00       	jmp    370 <main+0xd9>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2bb:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     2c2:	00 
     2c3:	c7 04 24 3f 15 00 00 	movl   $0x153f,(%esp)
     2ca:	e8 19 0d 00 00       	call   fe8 <open>
     2cf:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2d3:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2d8:	79 c8                	jns    2a2 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2da:	e9 91 00 00 00       	jmp    370 <main+0xd9>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2df:	0f b6 05 20 16 00 00 	movzbl 0x1620,%eax
     2e6:	3c 63                	cmp    $0x63,%al
     2e8:	75 5a                	jne    344 <main+0xad>
     2ea:	0f b6 05 21 16 00 00 	movzbl 0x1621,%eax
     2f1:	3c 64                	cmp    $0x64,%al
     2f3:	75 4f                	jne    344 <main+0xad>
     2f5:	0f b6 05 22 16 00 00 	movzbl 0x1622,%eax
     2fc:	3c 20                	cmp    $0x20,%al
     2fe:	75 44                	jne    344 <main+0xad>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     300:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
     307:	e8 c9 0a 00 00       	call   dd5 <strlen>
     30c:	83 e8 01             	sub    $0x1,%eax
     30f:	c6 80 20 16 00 00 00 	movb   $0x0,0x1620(%eax)
      if(chdir(buf+3) < 0)
     316:	c7 04 24 23 16 00 00 	movl   $0x1623,(%esp)
     31d:	e8 f6 0c 00 00       	call   1018 <chdir>
     322:	85 c0                	test   %eax,%eax
     324:	79 49                	jns    36f <main+0xd8>
        printf(2, "cannot cd %s\n", buf+3);
     326:	c7 44 24 08 23 16 00 	movl   $0x1623,0x8(%esp)
     32d:	00 
     32e:	c7 44 24 04 47 15 00 	movl   $0x1547,0x4(%esp)
     335:	00 
     336:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     33d:	e8 ef 0d 00 00       	call   1131 <printf>
      continue;
     342:	eb 2c                	jmp    370 <main+0xd9>
    }
    if(fork1() == 0)
     344:	e8 7c 00 00 00       	call   3c5 <fork1>
     349:	85 c0                	test   %eax,%eax
     34b:	75 14                	jne    361 <main+0xca>
      runcmd(parsecmd(buf));
     34d:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
     354:	e8 db 03 00 00       	call   734 <parsecmd>
     359:	89 04 24             	mov    %eax,(%esp)
     35c:	e8 9f fc ff ff       	call   0 <runcmd>
    wait(0);
     361:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     368:	e8 3b 0c 00 00       	call   fa8 <wait>
     36d:	eb 01                	jmp    370 <main+0xd9>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
     36f:	90                   	nop
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     370:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     377:	00 
     378:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
     37f:	e8 b5 fe ff ff       	call   239 <getcmd>
     384:	85 c0                	test   %eax,%eax
     386:	0f 89 53 ff ff ff    	jns    2df <main+0x48>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(0);
  }
  exit(0);
     38c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     393:	e8 08 0c 00 00       	call   fa0 <exit>

00000398 <panic>:
}

void
panic(char *s)
{
     398:	55                   	push   %ebp
     399:	89 e5                	mov    %esp,%ebp
     39b:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     39e:	8b 45 08             	mov    0x8(%ebp),%eax
     3a1:	89 44 24 08          	mov    %eax,0x8(%esp)
     3a5:	c7 44 24 04 55 15 00 	movl   $0x1555,0x4(%esp)
     3ac:	00 
     3ad:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     3b4:	e8 78 0d 00 00       	call   1131 <printf>
  exit(0);
     3b9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3c0:	e8 db 0b 00 00       	call   fa0 <exit>

000003c5 <fork1>:
}

int
fork1(void)
{
     3c5:	55                   	push   %ebp
     3c6:	89 e5                	mov    %esp,%ebp
     3c8:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
     3cb:	e8 c8 0b 00 00       	call   f98 <fork>
     3d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     3d3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     3d7:	75 0c                	jne    3e5 <fork1+0x20>
    panic("fork");
     3d9:	c7 04 24 59 15 00 00 	movl   $0x1559,(%esp)
     3e0:	e8 b3 ff ff ff       	call   398 <panic>
  return pid;
     3e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3e8:	c9                   	leave  
     3e9:	c3                   	ret    

000003ea <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3ea:	55                   	push   %ebp
     3eb:	89 e5                	mov    %esp,%ebp
     3ed:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f0:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3f7:	e8 1b 10 00 00       	call   1417 <malloc>
     3fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3ff:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     406:	00 
     407:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     40e:	00 
     40f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     412:	89 04 24             	mov    %eax,(%esp)
     415:	e8 e0 09 00 00       	call   dfa <memset>
  cmd->type = EXEC;
     41a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     423:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     426:	c9                   	leave  
     427:	c3                   	ret    

00000428 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     428:	55                   	push   %ebp
     429:	89 e5                	mov    %esp,%ebp
     42b:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     42e:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     435:	e8 dd 0f 00 00       	call   1417 <malloc>
     43a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     43d:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     444:	00 
     445:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     44c:	00 
     44d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     450:	89 04 24             	mov    %eax,(%esp)
     453:	e8 a2 09 00 00       	call   dfa <memset>
  cmd->type = REDIR;
     458:	8b 45 f4             	mov    -0xc(%ebp),%eax
     45b:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     461:	8b 45 f4             	mov    -0xc(%ebp),%eax
     464:	8b 55 08             	mov    0x8(%ebp),%edx
     467:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     46d:	8b 55 0c             	mov    0xc(%ebp),%edx
     470:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     473:	8b 45 f4             	mov    -0xc(%ebp),%eax
     476:	8b 55 10             	mov    0x10(%ebp),%edx
     479:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     47c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47f:	8b 55 14             	mov    0x14(%ebp),%edx
     482:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     485:	8b 45 f4             	mov    -0xc(%ebp),%eax
     488:	8b 55 18             	mov    0x18(%ebp),%edx
     48b:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     48e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     491:	c9                   	leave  
     492:	c3                   	ret    

00000493 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     493:	55                   	push   %ebp
     494:	89 e5                	mov    %esp,%ebp
     496:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     499:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4a0:	e8 72 0f 00 00       	call   1417 <malloc>
     4a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4a8:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4af:	00 
     4b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4b7:	00 
     4b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4bb:	89 04 24             	mov    %eax,(%esp)
     4be:	e8 37 09 00 00       	call   dfa <memset>
  cmd->type = PIPE;
     4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c6:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     4cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4cf:	8b 55 08             	mov    0x8(%ebp),%edx
     4d2:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d8:	8b 55 0c             	mov    0xc(%ebp),%edx
     4db:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4de:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4e1:	c9                   	leave  
     4e2:	c3                   	ret    

000004e3 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4e3:	55                   	push   %ebp
     4e4:	89 e5                	mov    %esp,%ebp
     4e6:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4e9:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4f0:	e8 22 0f 00 00       	call   1417 <malloc>
     4f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4f8:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4ff:	00 
     500:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     507:	00 
     508:	8b 45 f4             	mov    -0xc(%ebp),%eax
     50b:	89 04 24             	mov    %eax,(%esp)
     50e:	e8 e7 08 00 00       	call   dfa <memset>
  cmd->type = LIST;
     513:	8b 45 f4             	mov    -0xc(%ebp),%eax
     516:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     51c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51f:	8b 55 08             	mov    0x8(%ebp),%edx
     522:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     525:	8b 45 f4             	mov    -0xc(%ebp),%eax
     528:	8b 55 0c             	mov    0xc(%ebp),%edx
     52b:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     52e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     531:	c9                   	leave  
     532:	c3                   	ret    

00000533 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     533:	55                   	push   %ebp
     534:	89 e5                	mov    %esp,%ebp
     536:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     539:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     540:	e8 d2 0e 00 00       	call   1417 <malloc>
     545:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     548:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     54f:	00 
     550:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     557:	00 
     558:	8b 45 f4             	mov    -0xc(%ebp),%eax
     55b:	89 04 24             	mov    %eax,(%esp)
     55e:	e8 97 08 00 00       	call   dfa <memset>
  cmd->type = BACK;
     563:	8b 45 f4             	mov    -0xc(%ebp),%eax
     566:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     56c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     56f:	8b 55 08             	mov    0x8(%ebp),%edx
     572:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     575:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     578:	c9                   	leave  
     579:	c3                   	ret    

0000057a <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     57a:	55                   	push   %ebp
     57b:	89 e5                	mov    %esp,%ebp
     57d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     580:	8b 45 08             	mov    0x8(%ebp),%eax
     583:	8b 00                	mov    (%eax),%eax
     585:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(s < es && strchr(whitespace, *s))
     588:	eb 04                	jmp    58e <gettoken+0x14>
    s++;
     58a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     58e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     591:	3b 45 0c             	cmp    0xc(%ebp),%eax
     594:	73 1d                	jae    5b3 <gettoken+0x39>
     596:	8b 45 f0             	mov    -0x10(%ebp),%eax
     599:	0f b6 00             	movzbl (%eax),%eax
     59c:	0f be c0             	movsbl %al,%eax
     59f:	89 44 24 04          	mov    %eax,0x4(%esp)
     5a3:	c7 04 24 f0 15 00 00 	movl   $0x15f0,(%esp)
     5aa:	e8 6f 08 00 00       	call   e1e <strchr>
     5af:	85 c0                	test   %eax,%eax
     5b1:	75 d7                	jne    58a <gettoken+0x10>
    s++;
  if(q)
     5b3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     5b7:	74 08                	je     5c1 <gettoken+0x47>
    *q = s;
     5b9:	8b 45 10             	mov    0x10(%ebp),%eax
     5bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
     5bf:	89 10                	mov    %edx,(%eax)
  ret = *s;
     5c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5c4:	0f b6 00             	movzbl (%eax),%eax
     5c7:	0f be c0             	movsbl %al,%eax
     5ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  switch(*s){
     5cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5d0:	0f b6 00             	movzbl (%eax),%eax
     5d3:	0f be c0             	movsbl %al,%eax
     5d6:	83 f8 3c             	cmp    $0x3c,%eax
     5d9:	7f 1e                	jg     5f9 <gettoken+0x7f>
     5db:	83 f8 3b             	cmp    $0x3b,%eax
     5de:	7d 23                	jge    603 <gettoken+0x89>
     5e0:	83 f8 29             	cmp    $0x29,%eax
     5e3:	7f 3f                	jg     624 <gettoken+0xaa>
     5e5:	83 f8 28             	cmp    $0x28,%eax
     5e8:	7d 19                	jge    603 <gettoken+0x89>
     5ea:	85 c0                	test   %eax,%eax
     5ec:	0f 84 83 00 00 00    	je     675 <gettoken+0xfb>
     5f2:	83 f8 26             	cmp    $0x26,%eax
     5f5:	74 0c                	je     603 <gettoken+0x89>
     5f7:	eb 2b                	jmp    624 <gettoken+0xaa>
     5f9:	83 f8 3e             	cmp    $0x3e,%eax
     5fc:	74 0b                	je     609 <gettoken+0x8f>
     5fe:	83 f8 7c             	cmp    $0x7c,%eax
     601:	75 21                	jne    624 <gettoken+0xaa>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     603:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
     607:	eb 70                	jmp    679 <gettoken+0xff>
  case '>':
    s++;
     609:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(*s == '>'){
     60d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     610:	0f b6 00             	movzbl (%eax),%eax
     613:	3c 3e                	cmp    $0x3e,%al
     615:	75 61                	jne    678 <gettoken+0xfe>
      ret = '+';
     617:	c7 45 f4 2b 00 00 00 	movl   $0x2b,-0xc(%ebp)
      s++;
     61e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    break;
     622:	eb 55                	jmp    679 <gettoken+0xff>
  default:
    ret = 'a';
     624:	c7 45 f4 61 00 00 00 	movl   $0x61,-0xc(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     62b:	eb 04                	jmp    631 <gettoken+0xb7>
      s++;
     62d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     631:	8b 45 f0             	mov    -0x10(%ebp),%eax
     634:	3b 45 0c             	cmp    0xc(%ebp),%eax
     637:	73 40                	jae    679 <gettoken+0xff>
     639:	8b 45 f0             	mov    -0x10(%ebp),%eax
     63c:	0f b6 00             	movzbl (%eax),%eax
     63f:	0f be c0             	movsbl %al,%eax
     642:	89 44 24 04          	mov    %eax,0x4(%esp)
     646:	c7 04 24 f0 15 00 00 	movl   $0x15f0,(%esp)
     64d:	e8 cc 07 00 00       	call   e1e <strchr>
     652:	85 c0                	test   %eax,%eax
     654:	75 23                	jne    679 <gettoken+0xff>
     656:	8b 45 f0             	mov    -0x10(%ebp),%eax
     659:	0f b6 00             	movzbl (%eax),%eax
     65c:	0f be c0             	movsbl %al,%eax
     65f:	89 44 24 04          	mov    %eax,0x4(%esp)
     663:	c7 04 24 f6 15 00 00 	movl   $0x15f6,(%esp)
     66a:	e8 af 07 00 00       	call   e1e <strchr>
     66f:	85 c0                	test   %eax,%eax
     671:	74 ba                	je     62d <gettoken+0xb3>
     673:	eb 04                	jmp    679 <gettoken+0xff>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     675:	90                   	nop
     676:	eb 01                	jmp    679 <gettoken+0xff>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
     678:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     679:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     67d:	74 0e                	je     68d <gettoken+0x113>
    *eq = s;
     67f:	8b 45 14             	mov    0x14(%ebp),%eax
     682:	8b 55 f0             	mov    -0x10(%ebp),%edx
     685:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     687:	eb 04                	jmp    68d <gettoken+0x113>
    s++;
     689:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     68d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     690:	3b 45 0c             	cmp    0xc(%ebp),%eax
     693:	73 1d                	jae    6b2 <gettoken+0x138>
     695:	8b 45 f0             	mov    -0x10(%ebp),%eax
     698:	0f b6 00             	movzbl (%eax),%eax
     69b:	0f be c0             	movsbl %al,%eax
     69e:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a2:	c7 04 24 f0 15 00 00 	movl   $0x15f0,(%esp)
     6a9:	e8 70 07 00 00       	call   e1e <strchr>
     6ae:	85 c0                	test   %eax,%eax
     6b0:	75 d7                	jne    689 <gettoken+0x10f>
    s++;
  *ps = s;
     6b2:	8b 45 08             	mov    0x8(%ebp),%eax
     6b5:	8b 55 f0             	mov    -0x10(%ebp),%edx
     6b8:	89 10                	mov    %edx,(%eax)
  return ret;
     6ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     6bd:	c9                   	leave  
     6be:	c3                   	ret    

000006bf <peek>:

int
peek(char **ps, char *es, char *toks)
{
     6bf:	55                   	push   %ebp
     6c0:	89 e5                	mov    %esp,%ebp
     6c2:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     6c5:	8b 45 08             	mov    0x8(%ebp),%eax
     6c8:	8b 00                	mov    (%eax),%eax
     6ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     6cd:	eb 04                	jmp    6d3 <peek+0x14>
    s++;
     6cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     6d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6d9:	73 1d                	jae    6f8 <peek+0x39>
     6db:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6de:	0f b6 00             	movzbl (%eax),%eax
     6e1:	0f be c0             	movsbl %al,%eax
     6e4:	89 44 24 04          	mov    %eax,0x4(%esp)
     6e8:	c7 04 24 f0 15 00 00 	movl   $0x15f0,(%esp)
     6ef:	e8 2a 07 00 00       	call   e1e <strchr>
     6f4:	85 c0                	test   %eax,%eax
     6f6:	75 d7                	jne    6cf <peek+0x10>
    s++;
  *ps = s;
     6f8:	8b 45 08             	mov    0x8(%ebp),%eax
     6fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6fe:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     700:	8b 45 f4             	mov    -0xc(%ebp),%eax
     703:	0f b6 00             	movzbl (%eax),%eax
     706:	84 c0                	test   %al,%al
     708:	74 23                	je     72d <peek+0x6e>
     70a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     70d:	0f b6 00             	movzbl (%eax),%eax
     710:	0f be c0             	movsbl %al,%eax
     713:	89 44 24 04          	mov    %eax,0x4(%esp)
     717:	8b 45 10             	mov    0x10(%ebp),%eax
     71a:	89 04 24             	mov    %eax,(%esp)
     71d:	e8 fc 06 00 00       	call   e1e <strchr>
     722:	85 c0                	test   %eax,%eax
     724:	74 07                	je     72d <peek+0x6e>
     726:	b8 01 00 00 00       	mov    $0x1,%eax
     72b:	eb 05                	jmp    732 <peek+0x73>
     72d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     732:	c9                   	leave  
     733:	c3                   	ret    

00000734 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     734:	55                   	push   %ebp
     735:	89 e5                	mov    %esp,%ebp
     737:	53                   	push   %ebx
     738:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     73e:	8b 45 08             	mov    0x8(%ebp),%eax
     741:	89 04 24             	mov    %eax,(%esp)
     744:	e8 8c 06 00 00       	call   dd5 <strlen>
     749:	8d 04 03             	lea    (%ebx,%eax,1),%eax
     74c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = parseline(&s, es);
     74f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     752:	89 44 24 04          	mov    %eax,0x4(%esp)
     756:	8d 45 08             	lea    0x8(%ebp),%eax
     759:	89 04 24             	mov    %eax,(%esp)
     75c:	e8 60 00 00 00       	call   7c1 <parseline>
     761:	89 45 f4             	mov    %eax,-0xc(%ebp)
  peek(&s, es, "");
     764:	c7 44 24 08 5e 15 00 	movl   $0x155e,0x8(%esp)
     76b:	00 
     76c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     76f:	89 44 24 04          	mov    %eax,0x4(%esp)
     773:	8d 45 08             	lea    0x8(%ebp),%eax
     776:	89 04 24             	mov    %eax,(%esp)
     779:	e8 41 ff ff ff       	call   6bf <peek>
  if(s != es){
     77e:	8b 45 08             	mov    0x8(%ebp),%eax
     781:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     784:	74 27                	je     7ad <parsecmd+0x79>
    printf(2, "leftovers: %s\n", s);
     786:	8b 45 08             	mov    0x8(%ebp),%eax
     789:	89 44 24 08          	mov    %eax,0x8(%esp)
     78d:	c7 44 24 04 5f 15 00 	movl   $0x155f,0x4(%esp)
     794:	00 
     795:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     79c:	e8 90 09 00 00       	call   1131 <printf>
    panic("syntax");
     7a1:	c7 04 24 6e 15 00 00 	movl   $0x156e,(%esp)
     7a8:	e8 eb fb ff ff       	call   398 <panic>
  }
  nulterminate(cmd);
     7ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7b0:	89 04 24             	mov    %eax,(%esp)
     7b3:	e8 a4 04 00 00       	call   c5c <nulterminate>
  return cmd;
     7b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     7bb:	83 c4 24             	add    $0x24,%esp
     7be:	5b                   	pop    %ebx
     7bf:	5d                   	pop    %ebp
     7c0:	c3                   	ret    

000007c1 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     7c1:	55                   	push   %ebp
     7c2:	89 e5                	mov    %esp,%ebp
     7c4:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     7c7:	8b 45 0c             	mov    0xc(%ebp),%eax
     7ca:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ce:	8b 45 08             	mov    0x8(%ebp),%eax
     7d1:	89 04 24             	mov    %eax,(%esp)
     7d4:	e8 bc 00 00 00       	call   895 <parsepipe>
     7d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7dc:	eb 30                	jmp    80e <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     7de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7e5:	00 
     7e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7ed:	00 
     7ee:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f5:	8b 45 08             	mov    0x8(%ebp),%eax
     7f8:	89 04 24             	mov    %eax,(%esp)
     7fb:	e8 7a fd ff ff       	call   57a <gettoken>
    cmd = backcmd(cmd);
     800:	8b 45 f4             	mov    -0xc(%ebp),%eax
     803:	89 04 24             	mov    %eax,(%esp)
     806:	e8 28 fd ff ff       	call   533 <backcmd>
     80b:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     80e:	c7 44 24 08 75 15 00 	movl   $0x1575,0x8(%esp)
     815:	00 
     816:	8b 45 0c             	mov    0xc(%ebp),%eax
     819:	89 44 24 04          	mov    %eax,0x4(%esp)
     81d:	8b 45 08             	mov    0x8(%ebp),%eax
     820:	89 04 24             	mov    %eax,(%esp)
     823:	e8 97 fe ff ff       	call   6bf <peek>
     828:	85 c0                	test   %eax,%eax
     82a:	75 b2                	jne    7de <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     82c:	c7 44 24 08 77 15 00 	movl   $0x1577,0x8(%esp)
     833:	00 
     834:	8b 45 0c             	mov    0xc(%ebp),%eax
     837:	89 44 24 04          	mov    %eax,0x4(%esp)
     83b:	8b 45 08             	mov    0x8(%ebp),%eax
     83e:	89 04 24             	mov    %eax,(%esp)
     841:	e8 79 fe ff ff       	call   6bf <peek>
     846:	85 c0                	test   %eax,%eax
     848:	74 46                	je     890 <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     84a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     851:	00 
     852:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     859:	00 
     85a:	8b 45 0c             	mov    0xc(%ebp),%eax
     85d:	89 44 24 04          	mov    %eax,0x4(%esp)
     861:	8b 45 08             	mov    0x8(%ebp),%eax
     864:	89 04 24             	mov    %eax,(%esp)
     867:	e8 0e fd ff ff       	call   57a <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     86c:	8b 45 0c             	mov    0xc(%ebp),%eax
     86f:	89 44 24 04          	mov    %eax,0x4(%esp)
     873:	8b 45 08             	mov    0x8(%ebp),%eax
     876:	89 04 24             	mov    %eax,(%esp)
     879:	e8 43 ff ff ff       	call   7c1 <parseline>
     87e:	89 44 24 04          	mov    %eax,0x4(%esp)
     882:	8b 45 f4             	mov    -0xc(%ebp),%eax
     885:	89 04 24             	mov    %eax,(%esp)
     888:	e8 56 fc ff ff       	call   4e3 <listcmd>
     88d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     890:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     893:	c9                   	leave  
     894:	c3                   	ret    

00000895 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     895:	55                   	push   %ebp
     896:	89 e5                	mov    %esp,%ebp
     898:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     89b:	8b 45 0c             	mov    0xc(%ebp),%eax
     89e:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a2:	8b 45 08             	mov    0x8(%ebp),%eax
     8a5:	89 04 24             	mov    %eax,(%esp)
     8a8:	e8 67 02 00 00       	call   b14 <parseexec>
     8ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     8b0:	c7 44 24 08 79 15 00 	movl   $0x1579,0x8(%esp)
     8b7:	00 
     8b8:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bb:	89 44 24 04          	mov    %eax,0x4(%esp)
     8bf:	8b 45 08             	mov    0x8(%ebp),%eax
     8c2:	89 04 24             	mov    %eax,(%esp)
     8c5:	e8 f5 fd ff ff       	call   6bf <peek>
     8ca:	85 c0                	test   %eax,%eax
     8cc:	74 46                	je     914 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     8ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8d5:	00 
     8d6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8dd:	00 
     8de:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e1:	89 44 24 04          	mov    %eax,0x4(%esp)
     8e5:	8b 45 08             	mov    0x8(%ebp),%eax
     8e8:	89 04 24             	mov    %eax,(%esp)
     8eb:	e8 8a fc ff ff       	call   57a <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8f0:	8b 45 0c             	mov    0xc(%ebp),%eax
     8f3:	89 44 24 04          	mov    %eax,0x4(%esp)
     8f7:	8b 45 08             	mov    0x8(%ebp),%eax
     8fa:	89 04 24             	mov    %eax,(%esp)
     8fd:	e8 93 ff ff ff       	call   895 <parsepipe>
     902:	89 44 24 04          	mov    %eax,0x4(%esp)
     906:	8b 45 f4             	mov    -0xc(%ebp),%eax
     909:	89 04 24             	mov    %eax,(%esp)
     90c:	e8 82 fb ff ff       	call   493 <pipecmd>
     911:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     914:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     917:	c9                   	leave  
     918:	c3                   	ret    

00000919 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     919:	55                   	push   %ebp
     91a:	89 e5                	mov    %esp,%ebp
     91c:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     91f:	e9 f5 00 00 00       	jmp    a19 <parseredirs+0x100>
    tok = gettoken(ps, es, 0, 0);
     924:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     92b:	00 
     92c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     933:	00 
     934:	8b 45 10             	mov    0x10(%ebp),%eax
     937:	89 44 24 04          	mov    %eax,0x4(%esp)
     93b:	8b 45 0c             	mov    0xc(%ebp),%eax
     93e:	89 04 24             	mov    %eax,(%esp)
     941:	e8 34 fc ff ff       	call   57a <gettoken>
     946:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     949:	8d 45 ec             	lea    -0x14(%ebp),%eax
     94c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     950:	8d 45 f0             	lea    -0x10(%ebp),%eax
     953:	89 44 24 08          	mov    %eax,0x8(%esp)
     957:	8b 45 10             	mov    0x10(%ebp),%eax
     95a:	89 44 24 04          	mov    %eax,0x4(%esp)
     95e:	8b 45 0c             	mov    0xc(%ebp),%eax
     961:	89 04 24             	mov    %eax,(%esp)
     964:	e8 11 fc ff ff       	call   57a <gettoken>
     969:	83 f8 61             	cmp    $0x61,%eax
     96c:	74 0c                	je     97a <parseredirs+0x61>
      panic("missing file for redirection");
     96e:	c7 04 24 7b 15 00 00 	movl   $0x157b,(%esp)
     975:	e8 1e fa ff ff       	call   398 <panic>
    switch(tok){
     97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     97d:	83 f8 3c             	cmp    $0x3c,%eax
     980:	74 0f                	je     991 <parseredirs+0x78>
     982:	83 f8 3e             	cmp    $0x3e,%eax
     985:	74 38                	je     9bf <parseredirs+0xa6>
     987:	83 f8 2b             	cmp    $0x2b,%eax
     98a:	74 61                	je     9ed <parseredirs+0xd4>
     98c:	e9 88 00 00 00       	jmp    a19 <parseredirs+0x100>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     991:	8b 55 ec             	mov    -0x14(%ebp),%edx
     994:	8b 45 f0             	mov    -0x10(%ebp),%eax
     997:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     99e:	00 
     99f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9a6:	00 
     9a7:	89 54 24 08          	mov    %edx,0x8(%esp)
     9ab:	89 44 24 04          	mov    %eax,0x4(%esp)
     9af:	8b 45 08             	mov    0x8(%ebp),%eax
     9b2:	89 04 24             	mov    %eax,(%esp)
     9b5:	e8 6e fa ff ff       	call   428 <redircmd>
     9ba:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9bd:	eb 5a                	jmp    a19 <parseredirs+0x100>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9c5:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9cc:	00 
     9cd:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9d4:	00 
     9d5:	89 54 24 08          	mov    %edx,0x8(%esp)
     9d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     9dd:	8b 45 08             	mov    0x8(%ebp),%eax
     9e0:	89 04 24             	mov    %eax,(%esp)
     9e3:	e8 40 fa ff ff       	call   428 <redircmd>
     9e8:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9eb:	eb 2c                	jmp    a19 <parseredirs+0x100>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9ed:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9f3:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9fa:	00 
     9fb:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     a02:	00 
     a03:	89 54 24 08          	mov    %edx,0x8(%esp)
     a07:	89 44 24 04          	mov    %eax,0x4(%esp)
     a0b:	8b 45 08             	mov    0x8(%ebp),%eax
     a0e:	89 04 24             	mov    %eax,(%esp)
     a11:	e8 12 fa ff ff       	call   428 <redircmd>
     a16:	89 45 08             	mov    %eax,0x8(%ebp)
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     a19:	c7 44 24 08 98 15 00 	movl   $0x1598,0x8(%esp)
     a20:	00 
     a21:	8b 45 10             	mov    0x10(%ebp),%eax
     a24:	89 44 24 04          	mov    %eax,0x4(%esp)
     a28:	8b 45 0c             	mov    0xc(%ebp),%eax
     a2b:	89 04 24             	mov    %eax,(%esp)
     a2e:	e8 8c fc ff ff       	call   6bf <peek>
     a33:	85 c0                	test   %eax,%eax
     a35:	0f 85 e9 fe ff ff    	jne    924 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     a3b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     a3e:	c9                   	leave  
     a3f:	c3                   	ret    

00000a40 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a46:	c7 44 24 08 9b 15 00 	movl   $0x159b,0x8(%esp)
     a4d:	00 
     a4e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a51:	89 44 24 04          	mov    %eax,0x4(%esp)
     a55:	8b 45 08             	mov    0x8(%ebp),%eax
     a58:	89 04 24             	mov    %eax,(%esp)
     a5b:	e8 5f fc ff ff       	call   6bf <peek>
     a60:	85 c0                	test   %eax,%eax
     a62:	75 0c                	jne    a70 <parseblock+0x30>
    panic("parseblock");
     a64:	c7 04 24 9d 15 00 00 	movl   $0x159d,(%esp)
     a6b:	e8 28 f9 ff ff       	call   398 <panic>
  gettoken(ps, es, 0, 0);
     a70:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a77:	00 
     a78:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a7f:	00 
     a80:	8b 45 0c             	mov    0xc(%ebp),%eax
     a83:	89 44 24 04          	mov    %eax,0x4(%esp)
     a87:	8b 45 08             	mov    0x8(%ebp),%eax
     a8a:	89 04 24             	mov    %eax,(%esp)
     a8d:	e8 e8 fa ff ff       	call   57a <gettoken>
  cmd = parseline(ps, es);
     a92:	8b 45 0c             	mov    0xc(%ebp),%eax
     a95:	89 44 24 04          	mov    %eax,0x4(%esp)
     a99:	8b 45 08             	mov    0x8(%ebp),%eax
     a9c:	89 04 24             	mov    %eax,(%esp)
     a9f:	e8 1d fd ff ff       	call   7c1 <parseline>
     aa4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     aa7:	c7 44 24 08 a8 15 00 	movl   $0x15a8,0x8(%esp)
     aae:	00 
     aaf:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ab6:	8b 45 08             	mov    0x8(%ebp),%eax
     ab9:	89 04 24             	mov    %eax,(%esp)
     abc:	e8 fe fb ff ff       	call   6bf <peek>
     ac1:	85 c0                	test   %eax,%eax
     ac3:	75 0c                	jne    ad1 <parseblock+0x91>
    panic("syntax - missing )");
     ac5:	c7 04 24 aa 15 00 00 	movl   $0x15aa,(%esp)
     acc:	e8 c7 f8 ff ff       	call   398 <panic>
  gettoken(ps, es, 0, 0);
     ad1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     ad8:	00 
     ad9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     ae0:	00 
     ae1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ae4:	89 44 24 04          	mov    %eax,0x4(%esp)
     ae8:	8b 45 08             	mov    0x8(%ebp),%eax
     aeb:	89 04 24             	mov    %eax,(%esp)
     aee:	e8 87 fa ff ff       	call   57a <gettoken>
  cmd = parseredirs(cmd, ps, es);
     af3:	8b 45 0c             	mov    0xc(%ebp),%eax
     af6:	89 44 24 08          	mov    %eax,0x8(%esp)
     afa:	8b 45 08             	mov    0x8(%ebp),%eax
     afd:	89 44 24 04          	mov    %eax,0x4(%esp)
     b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b04:	89 04 24             	mov    %eax,(%esp)
     b07:	e8 0d fe ff ff       	call   919 <parseredirs>
     b0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     b12:	c9                   	leave  
     b13:	c3                   	ret    

00000b14 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     b14:	55                   	push   %ebp
     b15:	89 e5                	mov    %esp,%ebp
     b17:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     b1a:	c7 44 24 08 9b 15 00 	movl   $0x159b,0x8(%esp)
     b21:	00 
     b22:	8b 45 0c             	mov    0xc(%ebp),%eax
     b25:	89 44 24 04          	mov    %eax,0x4(%esp)
     b29:	8b 45 08             	mov    0x8(%ebp),%eax
     b2c:	89 04 24             	mov    %eax,(%esp)
     b2f:	e8 8b fb ff ff       	call   6bf <peek>
     b34:	85 c0                	test   %eax,%eax
     b36:	74 17                	je     b4f <parseexec+0x3b>
    return parseblock(ps, es);
     b38:	8b 45 0c             	mov    0xc(%ebp),%eax
     b3b:	89 44 24 04          	mov    %eax,0x4(%esp)
     b3f:	8b 45 08             	mov    0x8(%ebp),%eax
     b42:	89 04 24             	mov    %eax,(%esp)
     b45:	e8 f6 fe ff ff       	call   a40 <parseblock>
     b4a:	e9 0b 01 00 00       	jmp    c5a <parseexec+0x146>

  ret = execcmd();
     b4f:	e8 96 f8 ff ff       	call   3ea <execcmd>
     b54:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = (struct execcmd*)ret;
     b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b5a:	89 45 f0             	mov    %eax,-0x10(%ebp)

  argc = 0;
     b5d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ret = parseredirs(ret, ps, es);
     b64:	8b 45 0c             	mov    0xc(%ebp),%eax
     b67:	89 44 24 08          	mov    %eax,0x8(%esp)
     b6b:	8b 45 08             	mov    0x8(%ebp),%eax
     b6e:	89 44 24 04          	mov    %eax,0x4(%esp)
     b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b75:	89 04 24             	mov    %eax,(%esp)
     b78:	e8 9c fd ff ff       	call   919 <parseredirs>
     b7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(!peek(ps, es, "|)&;")){
     b80:	e9 8e 00 00 00       	jmp    c13 <parseexec+0xff>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b85:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b88:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b8c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b8f:	89 44 24 08          	mov    %eax,0x8(%esp)
     b93:	8b 45 0c             	mov    0xc(%ebp),%eax
     b96:	89 44 24 04          	mov    %eax,0x4(%esp)
     b9a:	8b 45 08             	mov    0x8(%ebp),%eax
     b9d:	89 04 24             	mov    %eax,(%esp)
     ba0:	e8 d5 f9 ff ff       	call   57a <gettoken>
     ba5:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ba8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bac:	0f 84 85 00 00 00    	je     c37 <parseexec+0x123>
      break;
    if(tok != 'a')
     bb2:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     bb6:	74 0c                	je     bc4 <parseexec+0xb0>
      panic("syntax");
     bb8:	c7 04 24 6e 15 00 00 	movl   $0x156e,(%esp)
     bbf:	e8 d4 f7 ff ff       	call   398 <panic>
    cmd->argv[argc] = q;
     bc4:	8b 55 ec             	mov    -0x14(%ebp),%edx
     bc7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bcd:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     bd1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
     bd4:	8b 55 e0             	mov    -0x20(%ebp),%edx
     bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bda:	83 c1 08             	add    $0x8,%ecx
     bdd:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     be1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    if(argc >= MAXARGS)
     be5:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
     be9:	7e 0c                	jle    bf7 <parseexec+0xe3>
      panic("too many args");
     beb:	c7 04 24 bd 15 00 00 	movl   $0x15bd,(%esp)
     bf2:	e8 a1 f7 ff ff       	call   398 <panic>
    ret = parseredirs(ret, ps, es);
     bf7:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfa:	89 44 24 08          	mov    %eax,0x8(%esp)
     bfe:	8b 45 08             	mov    0x8(%ebp),%eax
     c01:	89 44 24 04          	mov    %eax,0x4(%esp)
     c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c08:	89 04 24             	mov    %eax,(%esp)
     c0b:	e8 09 fd ff ff       	call   919 <parseredirs>
     c10:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     c13:	c7 44 24 08 cb 15 00 	movl   $0x15cb,0x8(%esp)
     c1a:	00 
     c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
     c1e:	89 44 24 04          	mov    %eax,0x4(%esp)
     c22:	8b 45 08             	mov    0x8(%ebp),%eax
     c25:	89 04 24             	mov    %eax,(%esp)
     c28:	e8 92 fa ff ff       	call   6bf <peek>
     c2d:	85 c0                	test   %eax,%eax
     c2f:	0f 84 50 ff ff ff    	je     b85 <parseexec+0x71>
     c35:	eb 01                	jmp    c38 <parseexec+0x124>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
     c37:	90                   	nop
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     c38:	8b 55 ec             	mov    -0x14(%ebp),%edx
     c3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c3e:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c45:	00 
  cmd->eargv[argc] = 0;
     c46:	8b 55 ec             	mov    -0x14(%ebp),%edx
     c49:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c4c:	83 c2 08             	add    $0x8,%edx
     c4f:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c56:	00 
  return ret;
     c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     c5a:	c9                   	leave  
     c5b:	c3                   	ret    

00000c5c <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c5c:	55                   	push   %ebp
     c5d:	89 e5                	mov    %esp,%ebp
     c5f:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c62:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c66:	75 0a                	jne    c72 <nulterminate+0x16>
    return 0;
     c68:	b8 00 00 00 00       	mov    $0x0,%eax
     c6d:	e9 c8 00 00 00       	jmp    d3a <nulterminate+0xde>
  
  switch(cmd->type){
     c72:	8b 45 08             	mov    0x8(%ebp),%eax
     c75:	8b 00                	mov    (%eax),%eax
     c77:	83 f8 05             	cmp    $0x5,%eax
     c7a:	0f 87 b7 00 00 00    	ja     d37 <nulterminate+0xdb>
     c80:	8b 04 85 d0 15 00 00 	mov    0x15d0(,%eax,4),%eax
     c87:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c89:	8b 45 08             	mov    0x8(%ebp),%eax
     c8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c8f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
     c96:	eb 14                	jmp    cac <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c98:	8b 55 e0             	mov    -0x20(%ebp),%edx
     c9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c9e:	83 c2 08             	add    $0x8,%edx
     ca1:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     ca5:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ca8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
     cac:	8b 55 e0             	mov    -0x20(%ebp),%edx
     caf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cb2:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     cb6:	85 c0                	test   %eax,%eax
     cb8:	75 de                	jne    c98 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     cba:	eb 7b                	jmp    d37 <nulterminate+0xdb>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     cbc:	8b 45 08             	mov    0x8(%ebp),%eax
     cbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    nulterminate(rcmd->cmd);
     cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc5:	8b 40 04             	mov    0x4(%eax),%eax
     cc8:	89 04 24             	mov    %eax,(%esp)
     ccb:	e8 8c ff ff ff       	call   c5c <nulterminate>
    *rcmd->efile = 0;
     cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd3:	8b 40 0c             	mov    0xc(%eax),%eax
     cd6:	c6 00 00             	movb   $0x0,(%eax)
    break;
     cd9:	eb 5c                	jmp    d37 <nulterminate+0xdb>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     cdb:	8b 45 08             	mov    0x8(%ebp),%eax
     cde:	89 45 f0             	mov    %eax,-0x10(%ebp)
    nulterminate(pcmd->left);
     ce1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ce4:	8b 40 04             	mov    0x4(%eax),%eax
     ce7:	89 04 24             	mov    %eax,(%esp)
     cea:	e8 6d ff ff ff       	call   c5c <nulterminate>
    nulterminate(pcmd->right);
     cef:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cf2:	8b 40 08             	mov    0x8(%eax),%eax
     cf5:	89 04 24             	mov    %eax,(%esp)
     cf8:	e8 5f ff ff ff       	call   c5c <nulterminate>
    break;
     cfd:	eb 38                	jmp    d37 <nulterminate+0xdb>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     cff:	8b 45 08             	mov    0x8(%ebp),%eax
     d02:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(lcmd->left);
     d05:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d08:	8b 40 04             	mov    0x4(%eax),%eax
     d0b:	89 04 24             	mov    %eax,(%esp)
     d0e:	e8 49 ff ff ff       	call   c5c <nulterminate>
    nulterminate(lcmd->right);
     d13:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d16:	8b 40 08             	mov    0x8(%eax),%eax
     d19:	89 04 24             	mov    %eax,(%esp)
     d1c:	e8 3b ff ff ff       	call   c5c <nulterminate>
    break;
     d21:	eb 14                	jmp    d37 <nulterminate+0xdb>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     d23:	8b 45 08             	mov    0x8(%ebp),%eax
     d26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(bcmd->cmd);
     d29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d2c:	8b 40 04             	mov    0x4(%eax),%eax
     d2f:	89 04 24             	mov    %eax,(%esp)
     d32:	e8 25 ff ff ff       	call   c5c <nulterminate>
    break;
  }
  return cmd;
     d37:	8b 45 08             	mov    0x8(%ebp),%eax
}
     d3a:	c9                   	leave  
     d3b:	c3                   	ret    

00000d3c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     d3c:	55                   	push   %ebp
     d3d:	89 e5                	mov    %esp,%ebp
     d3f:	57                   	push   %edi
     d40:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     d41:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d44:	8b 55 10             	mov    0x10(%ebp),%edx
     d47:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4a:	89 cb                	mov    %ecx,%ebx
     d4c:	89 df                	mov    %ebx,%edi
     d4e:	89 d1                	mov    %edx,%ecx
     d50:	fc                   	cld    
     d51:	f3 aa                	rep stos %al,%es:(%edi)
     d53:	89 ca                	mov    %ecx,%edx
     d55:	89 fb                	mov    %edi,%ebx
     d57:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d5a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d5d:	5b                   	pop    %ebx
     d5e:	5f                   	pop    %edi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    

00000d61 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     d61:	55                   	push   %ebp
     d62:	89 e5                	mov    %esp,%ebp
     d64:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d67:	8b 45 08             	mov    0x8(%ebp),%eax
     d6a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d70:	0f b6 10             	movzbl (%eax),%edx
     d73:	8b 45 08             	mov    0x8(%ebp),%eax
     d76:	88 10                	mov    %dl,(%eax)
     d78:	8b 45 08             	mov    0x8(%ebp),%eax
     d7b:	0f b6 00             	movzbl (%eax),%eax
     d7e:	84 c0                	test   %al,%al
     d80:	0f 95 c0             	setne  %al
     d83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d87:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
     d8b:	84 c0                	test   %al,%al
     d8d:	75 de                	jne    d6d <strcpy+0xc>
    ;
  return os;
     d8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d92:	c9                   	leave  
     d93:	c3                   	ret    

00000d94 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d94:	55                   	push   %ebp
     d95:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d97:	eb 08                	jmp    da1 <strcmp+0xd>
    p++, q++;
     d99:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d9d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     da1:	8b 45 08             	mov    0x8(%ebp),%eax
     da4:	0f b6 00             	movzbl (%eax),%eax
     da7:	84 c0                	test   %al,%al
     da9:	74 10                	je     dbb <strcmp+0x27>
     dab:	8b 45 08             	mov    0x8(%ebp),%eax
     dae:	0f b6 10             	movzbl (%eax),%edx
     db1:	8b 45 0c             	mov    0xc(%ebp),%eax
     db4:	0f b6 00             	movzbl (%eax),%eax
     db7:	38 c2                	cmp    %al,%dl
     db9:	74 de                	je     d99 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     dbb:	8b 45 08             	mov    0x8(%ebp),%eax
     dbe:	0f b6 00             	movzbl (%eax),%eax
     dc1:	0f b6 d0             	movzbl %al,%edx
     dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc7:	0f b6 00             	movzbl (%eax),%eax
     dca:	0f b6 c0             	movzbl %al,%eax
     dcd:	89 d1                	mov    %edx,%ecx
     dcf:	29 c1                	sub    %eax,%ecx
     dd1:	89 c8                	mov    %ecx,%eax
}
     dd3:	5d                   	pop    %ebp
     dd4:	c3                   	ret    

00000dd5 <strlen>:

uint
strlen(char *s)
{
     dd5:	55                   	push   %ebp
     dd6:	89 e5                	mov    %esp,%ebp
     dd8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     ddb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     de2:	eb 04                	jmp    de8 <strlen+0x13>
     de4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     de8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     deb:	03 45 08             	add    0x8(%ebp),%eax
     dee:	0f b6 00             	movzbl (%eax),%eax
     df1:	84 c0                	test   %al,%al
     df3:	75 ef                	jne    de4 <strlen+0xf>
    ;
  return n;
     df5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     df8:	c9                   	leave  
     df9:	c3                   	ret    

00000dfa <memset>:

void*
memset(void *dst, int c, uint n)
{
     dfa:	55                   	push   %ebp
     dfb:	89 e5                	mov    %esp,%ebp
     dfd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     e00:	8b 45 10             	mov    0x10(%ebp),%eax
     e03:	89 44 24 08          	mov    %eax,0x8(%esp)
     e07:	8b 45 0c             	mov    0xc(%ebp),%eax
     e0a:	89 44 24 04          	mov    %eax,0x4(%esp)
     e0e:	8b 45 08             	mov    0x8(%ebp),%eax
     e11:	89 04 24             	mov    %eax,(%esp)
     e14:	e8 23 ff ff ff       	call   d3c <stosb>
  return dst;
     e19:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e1c:	c9                   	leave  
     e1d:	c3                   	ret    

00000e1e <strchr>:

char*
strchr(const char *s, char c)
{
     e1e:	55                   	push   %ebp
     e1f:	89 e5                	mov    %esp,%ebp
     e21:	83 ec 04             	sub    $0x4,%esp
     e24:	8b 45 0c             	mov    0xc(%ebp),%eax
     e27:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     e2a:	eb 14                	jmp    e40 <strchr+0x22>
    if(*s == c)
     e2c:	8b 45 08             	mov    0x8(%ebp),%eax
     e2f:	0f b6 00             	movzbl (%eax),%eax
     e32:	3a 45 fc             	cmp    -0x4(%ebp),%al
     e35:	75 05                	jne    e3c <strchr+0x1e>
      return (char*)s;
     e37:	8b 45 08             	mov    0x8(%ebp),%eax
     e3a:	eb 13                	jmp    e4f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     e3c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e40:	8b 45 08             	mov    0x8(%ebp),%eax
     e43:	0f b6 00             	movzbl (%eax),%eax
     e46:	84 c0                	test   %al,%al
     e48:	75 e2                	jne    e2c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     e4a:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e4f:	c9                   	leave  
     e50:	c3                   	ret    

00000e51 <gets>:

char*
gets(char *buf, int max)
{
     e51:	55                   	push   %ebp
     e52:	89 e5                	mov    %esp,%ebp
     e54:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e57:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     e5e:	eb 44                	jmp    ea4 <gets+0x53>
    cc = read(0, &c, 1);
     e60:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e67:	00 
     e68:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e6b:	89 44 24 04          	mov    %eax,0x4(%esp)
     e6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e76:	e8 45 01 00 00       	call   fc0 <read>
     e7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
     e7e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e82:	7e 2d                	jle    eb1 <gets+0x60>
      break;
    buf[i++] = c;
     e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e87:	03 45 08             	add    0x8(%ebp),%eax
     e8a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
     e8e:	88 10                	mov    %dl,(%eax)
     e90:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
     e94:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e98:	3c 0a                	cmp    $0xa,%al
     e9a:	74 16                	je     eb2 <gets+0x61>
     e9c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     ea0:	3c 0d                	cmp    $0xd,%al
     ea2:	74 0e                	je     eb2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ea4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ea7:	83 c0 01             	add    $0x1,%eax
     eaa:	3b 45 0c             	cmp    0xc(%ebp),%eax
     ead:	7c b1                	jl     e60 <gets+0xf>
     eaf:	eb 01                	jmp    eb2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     eb1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     eb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eb5:	03 45 08             	add    0x8(%ebp),%eax
     eb8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     ebb:	8b 45 08             	mov    0x8(%ebp),%eax
}
     ebe:	c9                   	leave  
     ebf:	c3                   	ret    

00000ec0 <stat>:

int
stat(char *n, struct stat *st)
{
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ec6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ecd:	00 
     ece:	8b 45 08             	mov    0x8(%ebp),%eax
     ed1:	89 04 24             	mov    %eax,(%esp)
     ed4:	e8 0f 01 00 00       	call   fe8 <open>
     ed9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
     edc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ee0:	79 07                	jns    ee9 <stat+0x29>
    return -1;
     ee2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     ee7:	eb 23                	jmp    f0c <stat+0x4c>
  r = fstat(fd, st);
     ee9:	8b 45 0c             	mov    0xc(%ebp),%eax
     eec:	89 44 24 04          	mov    %eax,0x4(%esp)
     ef0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ef3:	89 04 24             	mov    %eax,(%esp)
     ef6:	e8 05 01 00 00       	call   1000 <fstat>
     efb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
     efe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f01:	89 04 24             	mov    %eax,(%esp)
     f04:	e8 c7 00 00 00       	call   fd0 <close>
  return r;
     f09:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     f0c:	c9                   	leave  
     f0d:	c3                   	ret    

00000f0e <atoi>:

int
atoi(const char *s)
{
     f0e:	55                   	push   %ebp
     f0f:	89 e5                	mov    %esp,%ebp
     f11:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     f14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     f1b:	eb 24                	jmp    f41 <atoi+0x33>
    n = n*10 + *s++ - '0';
     f1d:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f20:	89 d0                	mov    %edx,%eax
     f22:	c1 e0 02             	shl    $0x2,%eax
     f25:	01 d0                	add    %edx,%eax
     f27:	01 c0                	add    %eax,%eax
     f29:	89 c2                	mov    %eax,%edx
     f2b:	8b 45 08             	mov    0x8(%ebp),%eax
     f2e:	0f b6 00             	movzbl (%eax),%eax
     f31:	0f be c0             	movsbl %al,%eax
     f34:	8d 04 02             	lea    (%edx,%eax,1),%eax
     f37:	83 e8 30             	sub    $0x30,%eax
     f3a:	89 45 fc             	mov    %eax,-0x4(%ebp)
     f3d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f41:	8b 45 08             	mov    0x8(%ebp),%eax
     f44:	0f b6 00             	movzbl (%eax),%eax
     f47:	3c 2f                	cmp    $0x2f,%al
     f49:	7e 0a                	jle    f55 <atoi+0x47>
     f4b:	8b 45 08             	mov    0x8(%ebp),%eax
     f4e:	0f b6 00             	movzbl (%eax),%eax
     f51:	3c 39                	cmp    $0x39,%al
     f53:	7e c8                	jle    f1d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     f55:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f58:	c9                   	leave  
     f59:	c3                   	ret    

00000f5a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     f5a:	55                   	push   %ebp
     f5b:	89 e5                	mov    %esp,%ebp
     f5d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     f60:	8b 45 08             	mov    0x8(%ebp),%eax
     f63:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
     f66:	8b 45 0c             	mov    0xc(%ebp),%eax
     f69:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
     f6c:	eb 13                	jmp    f81 <memmove+0x27>
    *dst++ = *src++;
     f6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f71:	0f b6 10             	movzbl (%eax),%edx
     f74:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f77:	88 10                	mov    %dl,(%eax)
     f79:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     f7d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f81:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f85:	0f 9f c0             	setg   %al
     f88:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f8c:	84 c0                	test   %al,%al
     f8e:	75 de                	jne    f6e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     f90:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f93:	c9                   	leave  
     f94:	c3                   	ret    
     f95:	90                   	nop
     f96:	90                   	nop
     f97:	90                   	nop

00000f98 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f98:	b8 01 00 00 00       	mov    $0x1,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <exit>:
SYSCALL(exit)
     fa0:	b8 02 00 00 00       	mov    $0x2,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <wait>:
SYSCALL(wait)
     fa8:	b8 03 00 00 00       	mov    $0x3,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <waitpid>:
SYSCALL(waitpid)
     fb0:	b8 17 00 00 00       	mov    $0x17,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <pipe>:
SYSCALL(pipe)
     fb8:	b8 04 00 00 00       	mov    $0x4,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <read>:
SYSCALL(read)
     fc0:	b8 05 00 00 00       	mov    $0x5,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <write>:
SYSCALL(write)
     fc8:	b8 10 00 00 00       	mov    $0x10,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <close>:
SYSCALL(close)
     fd0:	b8 15 00 00 00       	mov    $0x15,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <kill>:
SYSCALL(kill)
     fd8:	b8 06 00 00 00       	mov    $0x6,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <exec>:
SYSCALL(exec)
     fe0:	b8 07 00 00 00       	mov    $0x7,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <open>:
SYSCALL(open)
     fe8:	b8 0f 00 00 00       	mov    $0xf,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <mknod>:
SYSCALL(mknod)
     ff0:	b8 11 00 00 00       	mov    $0x11,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <unlink>:
SYSCALL(unlink)
     ff8:	b8 12 00 00 00       	mov    $0x12,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <fstat>:
SYSCALL(fstat)
    1000:	b8 08 00 00 00       	mov    $0x8,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <link>:
SYSCALL(link)
    1008:	b8 13 00 00 00       	mov    $0x13,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	ret    

00001010 <mkdir>:
SYSCALL(mkdir)
    1010:	b8 14 00 00 00       	mov    $0x14,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	ret    

00001018 <chdir>:
SYSCALL(chdir)
    1018:	b8 09 00 00 00       	mov    $0x9,%eax
    101d:	cd 40                	int    $0x40
    101f:	c3                   	ret    

00001020 <dup>:
SYSCALL(dup)
    1020:	b8 0a 00 00 00       	mov    $0xa,%eax
    1025:	cd 40                	int    $0x40
    1027:	c3                   	ret    

00001028 <getpid>:
SYSCALL(getpid)
    1028:	b8 0b 00 00 00       	mov    $0xb,%eax
    102d:	cd 40                	int    $0x40
    102f:	c3                   	ret    

00001030 <sbrk>:
SYSCALL(sbrk)
    1030:	b8 0c 00 00 00       	mov    $0xc,%eax
    1035:	cd 40                	int    $0x40
    1037:	c3                   	ret    

00001038 <sleep>:
SYSCALL(sleep)
    1038:	b8 0d 00 00 00       	mov    $0xd,%eax
    103d:	cd 40                	int    $0x40
    103f:	c3                   	ret    

00001040 <uptime>:
SYSCALL(uptime)
    1040:	b8 0e 00 00 00       	mov    $0xe,%eax
    1045:	cd 40                	int    $0x40
    1047:	c3                   	ret    

00001048 <count>:
SYSCALL(count)
    1048:	b8 16 00 00 00       	mov    $0x16,%eax
    104d:	cd 40                	int    $0x40
    104f:	c3                   	ret    

00001050 <change_priority>:
SYSCALL(change_priority)
    1050:	b8 18 00 00 00       	mov    $0x18,%eax
    1055:	cd 40                	int    $0x40
    1057:	c3                   	ret    

00001058 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1058:	55                   	push   %ebp
    1059:	89 e5                	mov    %esp,%ebp
    105b:	83 ec 28             	sub    $0x28,%esp
    105e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1061:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1064:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    106b:	00 
    106c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    106f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1073:	8b 45 08             	mov    0x8(%ebp),%eax
    1076:	89 04 24             	mov    %eax,(%esp)
    1079:	e8 4a ff ff ff       	call   fc8 <write>
}
    107e:	c9                   	leave  
    107f:	c3                   	ret    

00001080 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1087:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    108e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1092:	74 17                	je     10ab <printint+0x2b>
    1094:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1098:	79 11                	jns    10ab <printint+0x2b>
    neg = 1;
    109a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    10a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    10a4:	f7 d8                	neg    %eax
    10a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    10a9:	eb 06                	jmp    10b1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    10ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    10b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    10b8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    10bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    10be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c1:	ba 00 00 00 00       	mov    $0x0,%edx
    10c6:	f7 f3                	div    %ebx
    10c8:	89 d0                	mov    %edx,%eax
    10ca:	0f b6 80 00 16 00 00 	movzbl 0x1600(%eax),%eax
    10d1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    10d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    10d9:	8b 45 10             	mov    0x10(%ebp),%eax
    10dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    10df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e2:	ba 00 00 00 00       	mov    $0x0,%edx
    10e7:	f7 75 d4             	divl   -0x2c(%ebp)
    10ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10f1:	75 c5                	jne    10b8 <printint+0x38>
  if(neg)
    10f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10f7:	74 28                	je     1121 <printint+0xa1>
    buf[i++] = '-';
    10f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10fc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1101:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1105:	eb 1a                	jmp    1121 <printint+0xa1>
    putc(fd, buf[i]);
    1107:	8b 45 ec             	mov    -0x14(%ebp),%eax
    110a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    110f:	0f be c0             	movsbl %al,%eax
    1112:	89 44 24 04          	mov    %eax,0x4(%esp)
    1116:	8b 45 08             	mov    0x8(%ebp),%eax
    1119:	89 04 24             	mov    %eax,(%esp)
    111c:	e8 37 ff ff ff       	call   1058 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1121:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1125:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1129:	79 dc                	jns    1107 <printint+0x87>
    putc(fd, buf[i]);
}
    112b:	83 c4 44             	add    $0x44,%esp
    112e:	5b                   	pop    %ebx
    112f:	5d                   	pop    %ebp
    1130:	c3                   	ret    

00001131 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1131:	55                   	push   %ebp
    1132:	89 e5                	mov    %esp,%ebp
    1134:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1137:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    113e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1141:	83 c0 04             	add    $0x4,%eax
    1144:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1147:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    114e:	e9 7e 01 00 00       	jmp    12d1 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1153:	8b 55 0c             	mov    0xc(%ebp),%edx
    1156:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1159:	8d 04 02             	lea    (%edx,%eax,1),%eax
    115c:	0f b6 00             	movzbl (%eax),%eax
    115f:	0f be c0             	movsbl %al,%eax
    1162:	25 ff 00 00 00       	and    $0xff,%eax
    1167:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    116a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    116e:	75 2c                	jne    119c <printf+0x6b>
      if(c == '%'){
    1170:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1174:	75 0c                	jne    1182 <printf+0x51>
        state = '%';
    1176:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    117d:	e9 4b 01 00 00       	jmp    12cd <printf+0x19c>
      } else {
        putc(fd, c);
    1182:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1185:	0f be c0             	movsbl %al,%eax
    1188:	89 44 24 04          	mov    %eax,0x4(%esp)
    118c:	8b 45 08             	mov    0x8(%ebp),%eax
    118f:	89 04 24             	mov    %eax,(%esp)
    1192:	e8 c1 fe ff ff       	call   1058 <putc>
    1197:	e9 31 01 00 00       	jmp    12cd <printf+0x19c>
      }
    } else if(state == '%'){
    119c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    11a0:	0f 85 27 01 00 00    	jne    12cd <printf+0x19c>
      if(c == 'd'){
    11a6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    11aa:	75 2d                	jne    11d9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    11ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11af:	8b 00                	mov    (%eax),%eax
    11b1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    11b8:	00 
    11b9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    11c0:	00 
    11c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c5:	8b 45 08             	mov    0x8(%ebp),%eax
    11c8:	89 04 24             	mov    %eax,(%esp)
    11cb:	e8 b0 fe ff ff       	call   1080 <printint>
        ap++;
    11d0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    11d4:	e9 ed 00 00 00       	jmp    12c6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    11d9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    11dd:	74 06                	je     11e5 <printf+0xb4>
    11df:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    11e3:	75 2d                	jne    1212 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    11e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e8:	8b 00                	mov    (%eax),%eax
    11ea:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    11f1:	00 
    11f2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    11f9:	00 
    11fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    11fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1201:	89 04 24             	mov    %eax,(%esp)
    1204:	e8 77 fe ff ff       	call   1080 <printint>
        ap++;
    1209:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    120d:	e9 b4 00 00 00       	jmp    12c6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1212:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1216:	75 46                	jne    125e <printf+0x12d>
        s = (char*)*ap;
    1218:	8b 45 f4             	mov    -0xc(%ebp),%eax
    121b:	8b 00                	mov    (%eax),%eax
    121d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1220:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1224:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1228:	75 27                	jne    1251 <printf+0x120>
          s = "(null)";
    122a:	c7 45 e4 e8 15 00 00 	movl   $0x15e8,-0x1c(%ebp)
        while(*s != 0){
    1231:	eb 1f                	jmp    1252 <printf+0x121>
          putc(fd, *s);
    1233:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1236:	0f b6 00             	movzbl (%eax),%eax
    1239:	0f be c0             	movsbl %al,%eax
    123c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1240:	8b 45 08             	mov    0x8(%ebp),%eax
    1243:	89 04 24             	mov    %eax,(%esp)
    1246:	e8 0d fe ff ff       	call   1058 <putc>
          s++;
    124b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    124f:	eb 01                	jmp    1252 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1251:	90                   	nop
    1252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1255:	0f b6 00             	movzbl (%eax),%eax
    1258:	84 c0                	test   %al,%al
    125a:	75 d7                	jne    1233 <printf+0x102>
    125c:	eb 68                	jmp    12c6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    125e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1262:	75 1d                	jne    1281 <printf+0x150>
        putc(fd, *ap);
    1264:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1267:	8b 00                	mov    (%eax),%eax
    1269:	0f be c0             	movsbl %al,%eax
    126c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1270:	8b 45 08             	mov    0x8(%ebp),%eax
    1273:	89 04 24             	mov    %eax,(%esp)
    1276:	e8 dd fd ff ff       	call   1058 <putc>
        ap++;
    127b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    127f:	eb 45                	jmp    12c6 <printf+0x195>
      } else if(c == '%'){
    1281:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1285:	75 17                	jne    129e <printf+0x16d>
        putc(fd, c);
    1287:	8b 45 e8             	mov    -0x18(%ebp),%eax
    128a:	0f be c0             	movsbl %al,%eax
    128d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1291:	8b 45 08             	mov    0x8(%ebp),%eax
    1294:	89 04 24             	mov    %eax,(%esp)
    1297:	e8 bc fd ff ff       	call   1058 <putc>
    129c:	eb 28                	jmp    12c6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    129e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    12a5:	00 
    12a6:	8b 45 08             	mov    0x8(%ebp),%eax
    12a9:	89 04 24             	mov    %eax,(%esp)
    12ac:	e8 a7 fd ff ff       	call   1058 <putc>
        putc(fd, c);
    12b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12b4:	0f be c0             	movsbl %al,%eax
    12b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12bb:	8b 45 08             	mov    0x8(%ebp),%eax
    12be:	89 04 24             	mov    %eax,(%esp)
    12c1:	e8 92 fd ff ff       	call   1058 <putc>
      }
      state = 0;
    12c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    12cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    12d1:	8b 55 0c             	mov    0xc(%ebp),%edx
    12d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12d7:	8d 04 02             	lea    (%edx,%eax,1),%eax
    12da:	0f b6 00             	movzbl (%eax),%eax
    12dd:	84 c0                	test   %al,%al
    12df:	0f 85 6e fe ff ff    	jne    1153 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    12e5:	c9                   	leave  
    12e6:	c3                   	ret    
    12e7:	90                   	nop

000012e8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12e8:	55                   	push   %ebp
    12e9:	89 e5                	mov    %esp,%ebp
    12eb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    12ee:	8b 45 08             	mov    0x8(%ebp),%eax
    12f1:	83 e8 08             	sub    $0x8,%eax
    12f4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12f7:	a1 8c 16 00 00       	mov    0x168c,%eax
    12fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12ff:	eb 24                	jmp    1325 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1301:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1304:	8b 00                	mov    (%eax),%eax
    1306:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1309:	77 12                	ja     131d <free+0x35>
    130b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    130e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1311:	77 24                	ja     1337 <free+0x4f>
    1313:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1316:	8b 00                	mov    (%eax),%eax
    1318:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    131b:	77 1a                	ja     1337 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    131d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1320:	8b 00                	mov    (%eax),%eax
    1322:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1325:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1328:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    132b:	76 d4                	jbe    1301 <free+0x19>
    132d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1330:	8b 00                	mov    (%eax),%eax
    1332:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1335:	76 ca                	jbe    1301 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1337:	8b 45 f8             	mov    -0x8(%ebp),%eax
    133a:	8b 40 04             	mov    0x4(%eax),%eax
    133d:	c1 e0 03             	shl    $0x3,%eax
    1340:	89 c2                	mov    %eax,%edx
    1342:	03 55 f8             	add    -0x8(%ebp),%edx
    1345:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1348:	8b 00                	mov    (%eax),%eax
    134a:	39 c2                	cmp    %eax,%edx
    134c:	75 24                	jne    1372 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    134e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1351:	8b 50 04             	mov    0x4(%eax),%edx
    1354:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1357:	8b 00                	mov    (%eax),%eax
    1359:	8b 40 04             	mov    0x4(%eax),%eax
    135c:	01 c2                	add    %eax,%edx
    135e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1361:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1364:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1367:	8b 00                	mov    (%eax),%eax
    1369:	8b 10                	mov    (%eax),%edx
    136b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    136e:	89 10                	mov    %edx,(%eax)
    1370:	eb 0a                	jmp    137c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1372:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1375:	8b 10                	mov    (%eax),%edx
    1377:	8b 45 f8             	mov    -0x8(%ebp),%eax
    137a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    137c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    137f:	8b 40 04             	mov    0x4(%eax),%eax
    1382:	c1 e0 03             	shl    $0x3,%eax
    1385:	03 45 fc             	add    -0x4(%ebp),%eax
    1388:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    138b:	75 20                	jne    13ad <free+0xc5>
    p->s.size += bp->s.size;
    138d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1390:	8b 50 04             	mov    0x4(%eax),%edx
    1393:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1396:	8b 40 04             	mov    0x4(%eax),%eax
    1399:	01 c2                	add    %eax,%edx
    139b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    139e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13a4:	8b 10                	mov    (%eax),%edx
    13a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13a9:	89 10                	mov    %edx,(%eax)
    13ab:	eb 08                	jmp    13b5 <free+0xcd>
  } else
    p->s.ptr = bp;
    13ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    13b3:	89 10                	mov    %edx,(%eax)
  freep = p;
    13b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13b8:	a3 8c 16 00 00       	mov    %eax,0x168c
}
    13bd:	c9                   	leave  
    13be:	c3                   	ret    

000013bf <morecore>:

static Header*
morecore(uint nu)
{
    13bf:	55                   	push   %ebp
    13c0:	89 e5                	mov    %esp,%ebp
    13c2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    13c5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    13cc:	77 07                	ja     13d5 <morecore+0x16>
    nu = 4096;
    13ce:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    13d5:	8b 45 08             	mov    0x8(%ebp),%eax
    13d8:	c1 e0 03             	shl    $0x3,%eax
    13db:	89 04 24             	mov    %eax,(%esp)
    13de:	e8 4d fc ff ff       	call   1030 <sbrk>
    13e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    13e6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    13ea:	75 07                	jne    13f3 <morecore+0x34>
    return 0;
    13ec:	b8 00 00 00 00       	mov    $0x0,%eax
    13f1:	eb 22                	jmp    1415 <morecore+0x56>
  hp = (Header*)p;
    13f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    13f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13fc:	8b 55 08             	mov    0x8(%ebp),%edx
    13ff:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1402:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1405:	83 c0 08             	add    $0x8,%eax
    1408:	89 04 24             	mov    %eax,(%esp)
    140b:	e8 d8 fe ff ff       	call   12e8 <free>
  return freep;
    1410:	a1 8c 16 00 00       	mov    0x168c,%eax
}
    1415:	c9                   	leave  
    1416:	c3                   	ret    

00001417 <malloc>:

void*
malloc(uint nbytes)
{
    1417:	55                   	push   %ebp
    1418:	89 e5                	mov    %esp,%ebp
    141a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    141d:	8b 45 08             	mov    0x8(%ebp),%eax
    1420:	83 c0 07             	add    $0x7,%eax
    1423:	c1 e8 03             	shr    $0x3,%eax
    1426:	83 c0 01             	add    $0x1,%eax
    1429:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    142c:	a1 8c 16 00 00       	mov    0x168c,%eax
    1431:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1434:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1438:	75 23                	jne    145d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    143a:	c7 45 f0 84 16 00 00 	movl   $0x1684,-0x10(%ebp)
    1441:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1444:	a3 8c 16 00 00       	mov    %eax,0x168c
    1449:	a1 8c 16 00 00       	mov    0x168c,%eax
    144e:	a3 84 16 00 00       	mov    %eax,0x1684
    base.s.size = 0;
    1453:	c7 05 88 16 00 00 00 	movl   $0x0,0x1688
    145a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    145d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1460:	8b 00                	mov    (%eax),%eax
    1462:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1465:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1468:	8b 40 04             	mov    0x4(%eax),%eax
    146b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    146e:	72 4d                	jb     14bd <malloc+0xa6>
      if(p->s.size == nunits)
    1470:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1473:	8b 40 04             	mov    0x4(%eax),%eax
    1476:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1479:	75 0c                	jne    1487 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    147b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    147e:	8b 10                	mov    (%eax),%edx
    1480:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1483:	89 10                	mov    %edx,(%eax)
    1485:	eb 26                	jmp    14ad <malloc+0x96>
      else {
        p->s.size -= nunits;
    1487:	8b 45 ec             	mov    -0x14(%ebp),%eax
    148a:	8b 40 04             	mov    0x4(%eax),%eax
    148d:	89 c2                	mov    %eax,%edx
    148f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1492:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1495:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1498:	8b 45 ec             	mov    -0x14(%ebp),%eax
    149b:	8b 40 04             	mov    0x4(%eax),%eax
    149e:	c1 e0 03             	shl    $0x3,%eax
    14a1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    14a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    14aa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    14ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14b0:	a3 8c 16 00 00       	mov    %eax,0x168c
      return (void*)(p + 1);
    14b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14b8:	83 c0 08             	add    $0x8,%eax
    14bb:	eb 38                	jmp    14f5 <malloc+0xde>
    }
    if(p == freep)
    14bd:	a1 8c 16 00 00       	mov    0x168c,%eax
    14c2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    14c5:	75 1b                	jne    14e2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    14c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ca:	89 04 24             	mov    %eax,(%esp)
    14cd:	e8 ed fe ff ff       	call   13bf <morecore>
    14d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    14d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14d9:	75 07                	jne    14e2 <malloc+0xcb>
        return 0;
    14db:	b8 00 00 00 00       	mov    $0x0,%eax
    14e0:	eb 13                	jmp    14f5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    14e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14eb:	8b 00                	mov    (%eax),%eax
    14ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    14f0:	e9 70 ff ff ff       	jmp    1465 <malloc+0x4e>
}
    14f5:	c9                   	leave  
    14f6:	c3                   	ret    
