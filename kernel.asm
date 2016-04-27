
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc 50 c6 10 80       	mov    $0x8010c650,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 f0 33 10 80       	mov    $0x801033f0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	83 ec 28             	sub    $0x28,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010003a:	c7 44 24 04 a4 84 10 	movl   $0x801084a4,0x4(%esp)
80100041:	80 
80100042:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
80100049:	e8 e4 4d 00 00       	call   80104e32 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010004e:	c7 05 90 db 10 80 84 	movl   $0x8010db84,0x8010db90
80100055:	db 10 80 
  bcache.head.next = &bcache.head;
80100058:	c7 05 94 db 10 80 84 	movl   $0x8010db84,0x8010db94
8010005f:	db 10 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100062:	c7 45 f4 94 c6 10 80 	movl   $0x8010c694,-0xc(%ebp)
80100069:	eb 3a                	jmp    801000a5 <binit+0x71>
    b->next = bcache.head.next;
8010006b:	8b 15 94 db 10 80    	mov    0x8010db94,%edx
80100071:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100074:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev = &bcache.head;
80100077:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010007a:	c7 40 0c 84 db 10 80 	movl   $0x8010db84,0xc(%eax)
    b->dev = -1;
80100081:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100084:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    bcache.head.next->prev = b;
8010008b:	a1 94 db 10 80       	mov    0x8010db94,%eax
80100090:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100093:	89 50 0c             	mov    %edx,0xc(%eax)
    bcache.head.next = b;
80100096:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100099:	a3 94 db 10 80       	mov    %eax,0x8010db94

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
8010009e:	81 45 f4 18 02 00 00 	addl   $0x218,-0xc(%ebp)
801000a5:	b8 84 db 10 80       	mov    $0x8010db84,%eax
801000aa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
801000ad:	72 bc                	jb     8010006b <binit+0x37>
    b->prev = &bcache.head;
    b->dev = -1;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000af:	c9                   	leave  
801000b0:	c3                   	ret    

801000b1 <bget>:
// Look through buffer cache for sector on device dev.
// If not found, allocate fresh block.
// In either case, return B_BUSY buffer.
static struct buf*
bget(uint dev, uint sector)
{
801000b1:	55                   	push   %ebp
801000b2:	89 e5                	mov    %esp,%ebp
801000b4:	83 ec 28             	sub    $0x28,%esp
  struct buf *b;

  acquire(&bcache.lock);
801000b7:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
801000be:	e8 90 4d 00 00       	call   80104e53 <acquire>

 loop:
  // Is the sector already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000c3:	a1 94 db 10 80       	mov    0x8010db94,%eax
801000c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
801000cb:	eb 63                	jmp    80100130 <bget+0x7f>
    if(b->dev == dev && b->sector == sector){
801000cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000d0:	8b 40 04             	mov    0x4(%eax),%eax
801000d3:	3b 45 08             	cmp    0x8(%ebp),%eax
801000d6:	75 4f                	jne    80100127 <bget+0x76>
801000d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000db:	8b 40 08             	mov    0x8(%eax),%eax
801000de:	3b 45 0c             	cmp    0xc(%ebp),%eax
801000e1:	75 44                	jne    80100127 <bget+0x76>
      if(!(b->flags & B_BUSY)){
801000e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000e6:	8b 00                	mov    (%eax),%eax
801000e8:	83 e0 01             	and    $0x1,%eax
801000eb:	85 c0                	test   %eax,%eax
801000ed:	75 23                	jne    80100112 <bget+0x61>
        b->flags |= B_BUSY;
801000ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000f2:	8b 00                	mov    (%eax),%eax
801000f4:	89 c2                	mov    %eax,%edx
801000f6:	83 ca 01             	or     $0x1,%edx
801000f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000fc:	89 10                	mov    %edx,(%eax)
        release(&bcache.lock);
801000fe:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
80100105:	e8 aa 4d 00 00       	call   80104eb4 <release>
        return b;
8010010a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010010d:	e9 93 00 00 00       	jmp    801001a5 <bget+0xf4>
      }
      sleep(b, &bcache.lock);
80100112:	c7 44 24 04 60 c6 10 	movl   $0x8010c660,0x4(%esp)
80100119:	80 
8010011a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010011d:	89 04 24             	mov    %eax,(%esp)
80100120:	e8 54 4a 00 00       	call   80104b79 <sleep>
      goto loop;
80100125:	eb 9c                	jmp    801000c3 <bget+0x12>

  acquire(&bcache.lock);

 loop:
  // Is the sector already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
80100127:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010012a:	8b 40 10             	mov    0x10(%eax),%eax
8010012d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100130:	81 7d f4 84 db 10 80 	cmpl   $0x8010db84,-0xc(%ebp)
80100137:	75 94                	jne    801000cd <bget+0x1c>
      goto loop;
    }
  }

  // Not cached; recycle some non-busy and clean buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100139:	a1 90 db 10 80       	mov    0x8010db90,%eax
8010013e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100141:	eb 4d                	jmp    80100190 <bget+0xdf>
    if((b->flags & B_BUSY) == 0 && (b->flags & B_DIRTY) == 0){
80100143:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100146:	8b 00                	mov    (%eax),%eax
80100148:	83 e0 01             	and    $0x1,%eax
8010014b:	85 c0                	test   %eax,%eax
8010014d:	75 38                	jne    80100187 <bget+0xd6>
8010014f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100152:	8b 00                	mov    (%eax),%eax
80100154:	83 e0 04             	and    $0x4,%eax
80100157:	85 c0                	test   %eax,%eax
80100159:	75 2c                	jne    80100187 <bget+0xd6>
      b->dev = dev;
8010015b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010015e:	8b 55 08             	mov    0x8(%ebp),%edx
80100161:	89 50 04             	mov    %edx,0x4(%eax)
      b->sector = sector;
80100164:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100167:	8b 55 0c             	mov    0xc(%ebp),%edx
8010016a:	89 50 08             	mov    %edx,0x8(%eax)
      b->flags = B_BUSY;
8010016d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100170:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
      release(&bcache.lock);
80100176:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
8010017d:	e8 32 4d 00 00       	call   80104eb4 <release>
      return b;
80100182:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100185:	eb 1e                	jmp    801001a5 <bget+0xf4>
      goto loop;
    }
  }

  // Not cached; recycle some non-busy and clean buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100187:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010018a:	8b 40 0c             	mov    0xc(%eax),%eax
8010018d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100190:	81 7d f4 84 db 10 80 	cmpl   $0x8010db84,-0xc(%ebp)
80100197:	75 aa                	jne    80100143 <bget+0x92>
      b->flags = B_BUSY;
      release(&bcache.lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100199:	c7 04 24 ab 84 10 80 	movl   $0x801084ab,(%esp)
801001a0:	e8 95 03 00 00       	call   8010053a <panic>
}
801001a5:	c9                   	leave  
801001a6:	c3                   	ret    

801001a7 <bread>:

// Return a B_BUSY buf with the contents of the indicated disk sector.
struct buf*
bread(uint dev, uint sector)
{
801001a7:	55                   	push   %ebp
801001a8:	89 e5                	mov    %esp,%ebp
801001aa:	83 ec 28             	sub    $0x28,%esp
  struct buf *b;

  b = bget(dev, sector);
801001ad:	8b 45 0c             	mov    0xc(%ebp),%eax
801001b0:	89 44 24 04          	mov    %eax,0x4(%esp)
801001b4:	8b 45 08             	mov    0x8(%ebp),%eax
801001b7:	89 04 24             	mov    %eax,(%esp)
801001ba:	e8 f2 fe ff ff       	call   801000b1 <bget>
801001bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!(b->flags & B_VALID))
801001c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001c5:	8b 00                	mov    (%eax),%eax
801001c7:	83 e0 02             	and    $0x2,%eax
801001ca:	85 c0                	test   %eax,%eax
801001cc:	75 0b                	jne    801001d9 <bread+0x32>
    iderw(b);
801001ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001d1:	89 04 24             	mov    %eax,(%esp)
801001d4:	e8 e5 25 00 00       	call   801027be <iderw>
  return b;
801001d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801001dc:	c9                   	leave  
801001dd:	c3                   	ret    

801001de <bwrite>:

// Write b's contents to disk.  Must be B_BUSY.
void
bwrite(struct buf *b)
{
801001de:	55                   	push   %ebp
801001df:	89 e5                	mov    %esp,%ebp
801001e1:	83 ec 18             	sub    $0x18,%esp
  if((b->flags & B_BUSY) == 0)
801001e4:	8b 45 08             	mov    0x8(%ebp),%eax
801001e7:	8b 00                	mov    (%eax),%eax
801001e9:	83 e0 01             	and    $0x1,%eax
801001ec:	85 c0                	test   %eax,%eax
801001ee:	75 0c                	jne    801001fc <bwrite+0x1e>
    panic("bwrite");
801001f0:	c7 04 24 bc 84 10 80 	movl   $0x801084bc,(%esp)
801001f7:	e8 3e 03 00 00       	call   8010053a <panic>
  b->flags |= B_DIRTY;
801001fc:	8b 45 08             	mov    0x8(%ebp),%eax
801001ff:	8b 00                	mov    (%eax),%eax
80100201:	89 c2                	mov    %eax,%edx
80100203:	83 ca 04             	or     $0x4,%edx
80100206:	8b 45 08             	mov    0x8(%ebp),%eax
80100209:	89 10                	mov    %edx,(%eax)
  iderw(b);
8010020b:	8b 45 08             	mov    0x8(%ebp),%eax
8010020e:	89 04 24             	mov    %eax,(%esp)
80100211:	e8 a8 25 00 00       	call   801027be <iderw>
}
80100216:	c9                   	leave  
80100217:	c3                   	ret    

80100218 <brelse>:

// Release a B_BUSY buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
80100218:	55                   	push   %ebp
80100219:	89 e5                	mov    %esp,%ebp
8010021b:	83 ec 18             	sub    $0x18,%esp
  if((b->flags & B_BUSY) == 0)
8010021e:	8b 45 08             	mov    0x8(%ebp),%eax
80100221:	8b 00                	mov    (%eax),%eax
80100223:	83 e0 01             	and    $0x1,%eax
80100226:	85 c0                	test   %eax,%eax
80100228:	75 0c                	jne    80100236 <brelse+0x1e>
    panic("brelse");
8010022a:	c7 04 24 c3 84 10 80 	movl   $0x801084c3,(%esp)
80100231:	e8 04 03 00 00       	call   8010053a <panic>

  acquire(&bcache.lock);
80100236:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
8010023d:	e8 11 4c 00 00       	call   80104e53 <acquire>

  b->next->prev = b->prev;
80100242:	8b 45 08             	mov    0x8(%ebp),%eax
80100245:	8b 40 10             	mov    0x10(%eax),%eax
80100248:	8b 55 08             	mov    0x8(%ebp),%edx
8010024b:	8b 52 0c             	mov    0xc(%edx),%edx
8010024e:	89 50 0c             	mov    %edx,0xc(%eax)
  b->prev->next = b->next;
80100251:	8b 45 08             	mov    0x8(%ebp),%eax
80100254:	8b 40 0c             	mov    0xc(%eax),%eax
80100257:	8b 55 08             	mov    0x8(%ebp),%edx
8010025a:	8b 52 10             	mov    0x10(%edx),%edx
8010025d:	89 50 10             	mov    %edx,0x10(%eax)
  b->next = bcache.head.next;
80100260:	8b 15 94 db 10 80    	mov    0x8010db94,%edx
80100266:	8b 45 08             	mov    0x8(%ebp),%eax
80100269:	89 50 10             	mov    %edx,0x10(%eax)
  b->prev = &bcache.head;
8010026c:	8b 45 08             	mov    0x8(%ebp),%eax
8010026f:	c7 40 0c 84 db 10 80 	movl   $0x8010db84,0xc(%eax)
  bcache.head.next->prev = b;
80100276:	a1 94 db 10 80       	mov    0x8010db94,%eax
8010027b:	8b 55 08             	mov    0x8(%ebp),%edx
8010027e:	89 50 0c             	mov    %edx,0xc(%eax)
  bcache.head.next = b;
80100281:	8b 45 08             	mov    0x8(%ebp),%eax
80100284:	a3 94 db 10 80       	mov    %eax,0x8010db94

  b->flags &= ~B_BUSY;
80100289:	8b 45 08             	mov    0x8(%ebp),%eax
8010028c:	8b 00                	mov    (%eax),%eax
8010028e:	89 c2                	mov    %eax,%edx
80100290:	83 e2 fe             	and    $0xfffffffe,%edx
80100293:	8b 45 08             	mov    0x8(%ebp),%eax
80100296:	89 10                	mov    %edx,(%eax)
  wakeup(b);
80100298:	8b 45 08             	mov    0x8(%ebp),%eax
8010029b:	89 04 24             	mov    %eax,(%esp)
8010029e:	e8 b3 49 00 00       	call   80104c56 <wakeup>

  release(&bcache.lock);
801002a3:	c7 04 24 60 c6 10 80 	movl   $0x8010c660,(%esp)
801002aa:	e8 05 4c 00 00       	call   80104eb4 <release>
}
801002af:	c9                   	leave  
801002b0:	c3                   	ret    
801002b1:	00 00                	add    %al,(%eax)
	...

801002b4 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801002b4:	55                   	push   %ebp
801002b5:	89 e5                	mov    %esp,%ebp
801002b7:	83 ec 14             	sub    $0x14,%esp
801002ba:	8b 45 08             	mov    0x8(%ebp),%eax
801002bd:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801002c1:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801002c5:	89 c2                	mov    %eax,%edx
801002c7:	ec                   	in     (%dx),%al
801002c8:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
801002cb:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
801002cf:	c9                   	leave  
801002d0:	c3                   	ret    

801002d1 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801002d1:	55                   	push   %ebp
801002d2:	89 e5                	mov    %esp,%ebp
801002d4:	83 ec 08             	sub    $0x8,%esp
801002d7:	8b 55 08             	mov    0x8(%ebp),%edx
801002da:	8b 45 0c             	mov    0xc(%ebp),%eax
801002dd:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801002e1:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801002e4:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801002e8:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801002ec:	ee                   	out    %al,(%dx)
}
801002ed:	c9                   	leave  
801002ee:	c3                   	ret    

801002ef <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
801002ef:	55                   	push   %ebp
801002f0:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
801002f2:	fa                   	cli    
}
801002f3:	5d                   	pop    %ebp
801002f4:	c3                   	ret    

801002f5 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
801002f5:	55                   	push   %ebp
801002f6:	89 e5                	mov    %esp,%ebp
801002f8:	53                   	push   %ebx
801002f9:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
801002fc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80100300:	74 19                	je     8010031b <printint+0x26>
80100302:	8b 45 08             	mov    0x8(%ebp),%eax
80100305:	c1 e8 1f             	shr    $0x1f,%eax
80100308:	89 45 10             	mov    %eax,0x10(%ebp)
8010030b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010030f:	74 0a                	je     8010031b <printint+0x26>
    x = -xx;
80100311:	8b 45 08             	mov    0x8(%ebp),%eax
80100314:	f7 d8                	neg    %eax
80100316:	89 45 f4             	mov    %eax,-0xc(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100319:	eb 06                	jmp    80100321 <printint+0x2c>
    x = -xx;
  else
    x = xx;
8010031b:	8b 45 08             	mov    0x8(%ebp),%eax
8010031e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  i = 0;
80100321:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  do{
    buf[i++] = digits[x % base];
80100328:	8b 4d f0             	mov    -0x10(%ebp),%ecx
8010032b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010032e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100331:	ba 00 00 00 00       	mov    $0x0,%edx
80100336:	f7 f3                	div    %ebx
80100338:	89 d0                	mov    %edx,%eax
8010033a:	0f b6 80 04 90 10 80 	movzbl -0x7fef6ffc(%eax),%eax
80100341:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
80100345:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }while((x /= base) != 0);
80100349:	8b 45 0c             	mov    0xc(%ebp),%eax
8010034c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
8010034f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100352:	ba 00 00 00 00       	mov    $0x0,%edx
80100357:	f7 75 d4             	divl   -0x2c(%ebp)
8010035a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010035d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100361:	75 c5                	jne    80100328 <printint+0x33>

  if(sign)
80100363:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80100367:	74 21                	je     8010038a <printint+0x95>
    buf[i++] = '-';
80100369:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010036c:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)
80100371:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

  while(--i >= 0)
80100375:	eb 13                	jmp    8010038a <printint+0x95>
    consputc(buf[i]);
80100377:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010037a:	0f b6 44 05 e0       	movzbl -0x20(%ebp,%eax,1),%eax
8010037f:	0f be c0             	movsbl %al,%eax
80100382:	89 04 24             	mov    %eax,(%esp)
80100385:	e8 c4 03 00 00       	call   8010074e <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
8010038a:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
8010038e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100392:	79 e3                	jns    80100377 <printint+0x82>
    consputc(buf[i]);
}
80100394:	83 c4 44             	add    $0x44,%esp
80100397:	5b                   	pop    %ebx
80100398:	5d                   	pop    %ebp
80100399:	c3                   	ret    

8010039a <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
8010039a:	55                   	push   %ebp
8010039b:	89 e5                	mov    %esp,%ebp
8010039d:	83 ec 38             	sub    $0x38,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
801003a0:	a1 f4 b5 10 80       	mov    0x8010b5f4,%eax
801003a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(locking)
801003a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801003ac:	74 0c                	je     801003ba <cprintf+0x20>
    acquire(&cons.lock);
801003ae:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
801003b5:	e8 99 4a 00 00       	call   80104e53 <acquire>

  if (fmt == 0)
801003ba:	8b 45 08             	mov    0x8(%ebp),%eax
801003bd:	85 c0                	test   %eax,%eax
801003bf:	75 0c                	jne    801003cd <cprintf+0x33>
    panic("null fmt");
801003c1:	c7 04 24 ca 84 10 80 	movl   $0x801084ca,(%esp)
801003c8:	e8 6d 01 00 00       	call   8010053a <panic>

  argp = (uint*)(void*)(&fmt + 1);
801003cd:	8d 45 08             	lea    0x8(%ebp),%eax
801003d0:	83 c0 04             	add    $0x4,%eax
801003d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801003d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801003dd:	e9 20 01 00 00       	jmp    80100502 <cprintf+0x168>
    if(c != '%'){
801003e2:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
801003e6:	74 10                	je     801003f8 <cprintf+0x5e>
      consputc(c);
801003e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
801003eb:	89 04 24             	mov    %eax,(%esp)
801003ee:	e8 5b 03 00 00       	call   8010074e <consputc>
      continue;
801003f3:	e9 06 01 00 00       	jmp    801004fe <cprintf+0x164>
    }
    c = fmt[++i] & 0xff;
801003f8:	8b 55 08             	mov    0x8(%ebp),%edx
801003fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801003ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100402:	8d 04 02             	lea    (%edx,%eax,1),%eax
80100405:	0f b6 00             	movzbl (%eax),%eax
80100408:	0f be c0             	movsbl %al,%eax
8010040b:	25 ff 00 00 00       	and    $0xff,%eax
80100410:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(c == 0)
80100413:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100417:	0f 84 08 01 00 00    	je     80100525 <cprintf+0x18b>
      break;
    switch(c){
8010041d:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100420:	83 f8 70             	cmp    $0x70,%eax
80100423:	74 4d                	je     80100472 <cprintf+0xd8>
80100425:	83 f8 70             	cmp    $0x70,%eax
80100428:	7f 13                	jg     8010043d <cprintf+0xa3>
8010042a:	83 f8 25             	cmp    $0x25,%eax
8010042d:	0f 84 a6 00 00 00    	je     801004d9 <cprintf+0x13f>
80100433:	83 f8 64             	cmp    $0x64,%eax
80100436:	74 14                	je     8010044c <cprintf+0xb2>
80100438:	e9 aa 00 00 00       	jmp    801004e7 <cprintf+0x14d>
8010043d:	83 f8 73             	cmp    $0x73,%eax
80100440:	74 53                	je     80100495 <cprintf+0xfb>
80100442:	83 f8 78             	cmp    $0x78,%eax
80100445:	74 2b                	je     80100472 <cprintf+0xd8>
80100447:	e9 9b 00 00 00       	jmp    801004e7 <cprintf+0x14d>
    case 'd':
      printint(*argp++, 10, 1);
8010044c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010044f:	8b 00                	mov    (%eax),%eax
80100451:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
80100455:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
8010045c:	00 
8010045d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80100464:	00 
80100465:	89 04 24             	mov    %eax,(%esp)
80100468:	e8 88 fe ff ff       	call   801002f5 <printint>
      break;
8010046d:	e9 8c 00 00 00       	jmp    801004fe <cprintf+0x164>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
80100472:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100475:	8b 00                	mov    (%eax),%eax
80100477:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
8010047b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100482:	00 
80100483:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
8010048a:	00 
8010048b:	89 04 24             	mov    %eax,(%esp)
8010048e:	e8 62 fe ff ff       	call   801002f5 <printint>
      break;
80100493:	eb 69                	jmp    801004fe <cprintf+0x164>
    case 's':
      if((s = (char*)*argp++) == 0)
80100495:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100498:	8b 00                	mov    (%eax),%eax
8010049a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010049d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801004a1:	0f 94 c0             	sete   %al
801004a4:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
801004a8:	84 c0                	test   %al,%al
801004aa:	74 20                	je     801004cc <cprintf+0x132>
        s = "(null)";
801004ac:	c7 45 f4 d3 84 10 80 	movl   $0x801084d3,-0xc(%ebp)
      for(; *s; s++)
801004b3:	eb 18                	jmp    801004cd <cprintf+0x133>
        consputc(*s);
801004b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801004b8:	0f b6 00             	movzbl (%eax),%eax
801004bb:	0f be c0             	movsbl %al,%eax
801004be:	89 04 24             	mov    %eax,(%esp)
801004c1:	e8 88 02 00 00       	call   8010074e <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801004c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801004ca:	eb 01                	jmp    801004cd <cprintf+0x133>
801004cc:	90                   	nop
801004cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801004d0:	0f b6 00             	movzbl (%eax),%eax
801004d3:	84 c0                	test   %al,%al
801004d5:	75 de                	jne    801004b5 <cprintf+0x11b>
        consputc(*s);
      break;
801004d7:	eb 25                	jmp    801004fe <cprintf+0x164>
    case '%':
      consputc('%');
801004d9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
801004e0:	e8 69 02 00 00       	call   8010074e <consputc>
      break;
801004e5:	eb 17                	jmp    801004fe <cprintf+0x164>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
801004e7:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
801004ee:	e8 5b 02 00 00       	call   8010074e <consputc>
      consputc(c);
801004f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
801004f6:	89 04 24             	mov    %eax,(%esp)
801004f9:	e8 50 02 00 00       	call   8010074e <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801004fe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80100502:	8b 55 08             	mov    0x8(%ebp),%edx
80100505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100508:	8d 04 02             	lea    (%edx,%eax,1),%eax
8010050b:	0f b6 00             	movzbl (%eax),%eax
8010050e:	0f be c0             	movsbl %al,%eax
80100511:	25 ff 00 00 00       	and    $0xff,%eax
80100516:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100519:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
8010051d:	0f 85 bf fe ff ff    	jne    801003e2 <cprintf+0x48>
80100523:	eb 01                	jmp    80100526 <cprintf+0x18c>
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
80100525:	90                   	nop
      consputc(c);
      break;
    }
  }

  if(locking)
80100526:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010052a:	74 0c                	je     80100538 <cprintf+0x19e>
    release(&cons.lock);
8010052c:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100533:	e8 7c 49 00 00       	call   80104eb4 <release>
}
80100538:	c9                   	leave  
80100539:	c3                   	ret    

8010053a <panic>:

void
panic(char *s)
{
8010053a:	55                   	push   %ebp
8010053b:	89 e5                	mov    %esp,%ebp
8010053d:	83 ec 48             	sub    $0x48,%esp
  int i;
  uint pcs[10];
  
  cli();
80100540:	e8 aa fd ff ff       	call   801002ef <cli>
  cons.locking = 0;
80100545:	c7 05 f4 b5 10 80 00 	movl   $0x0,0x8010b5f4
8010054c:	00 00 00 
  cprintf("cpu%d: panic: ", cpu->id);
8010054f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80100555:	0f b6 00             	movzbl (%eax),%eax
80100558:	0f b6 c0             	movzbl %al,%eax
8010055b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010055f:	c7 04 24 da 84 10 80 	movl   $0x801084da,(%esp)
80100566:	e8 2f fe ff ff       	call   8010039a <cprintf>
  cprintf(s);
8010056b:	8b 45 08             	mov    0x8(%ebp),%eax
8010056e:	89 04 24             	mov    %eax,(%esp)
80100571:	e8 24 fe ff ff       	call   8010039a <cprintf>
  cprintf("\n");
80100576:	c7 04 24 e9 84 10 80 	movl   $0x801084e9,(%esp)
8010057d:	e8 18 fe ff ff       	call   8010039a <cprintf>
  getcallerpcs(&s, pcs);
80100582:	8d 45 cc             	lea    -0x34(%ebp),%eax
80100585:	89 44 24 04          	mov    %eax,0x4(%esp)
80100589:	8d 45 08             	lea    0x8(%ebp),%eax
8010058c:	89 04 24             	mov    %eax,(%esp)
8010058f:	e8 6f 49 00 00       	call   80104f03 <getcallerpcs>
  for(i=0; i<10; i++)
80100594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010059b:	eb 1b                	jmp    801005b8 <panic+0x7e>
    cprintf(" %p", pcs[i]);
8010059d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005a0:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
801005a4:	89 44 24 04          	mov    %eax,0x4(%esp)
801005a8:	c7 04 24 eb 84 10 80 	movl   $0x801084eb,(%esp)
801005af:	e8 e6 fd ff ff       	call   8010039a <cprintf>
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801005b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801005b8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
801005bc:	7e df                	jle    8010059d <panic+0x63>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801005be:	c7 05 a0 b5 10 80 01 	movl   $0x1,0x8010b5a0
801005c5:	00 00 00 
  for(;;)
    ;
801005c8:	eb fe                	jmp    801005c8 <panic+0x8e>

801005ca <cgaputc>:
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

static void
cgaputc(int c)
{
801005ca:	55                   	push   %ebp
801005cb:	89 e5                	mov    %esp,%ebp
801005cd:	83 ec 28             	sub    $0x28,%esp
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
801005d0:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
801005d7:	00 
801005d8:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
801005df:	e8 ed fc ff ff       	call   801002d1 <outb>
  pos = inb(CRTPORT+1) << 8;
801005e4:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
801005eb:	e8 c4 fc ff ff       	call   801002b4 <inb>
801005f0:	0f b6 c0             	movzbl %al,%eax
801005f3:	c1 e0 08             	shl    $0x8,%eax
801005f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  outb(CRTPORT, 15);
801005f9:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80100600:	00 
80100601:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
80100608:	e8 c4 fc ff ff       	call   801002d1 <outb>
  pos |= inb(CRTPORT+1);
8010060d:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
80100614:	e8 9b fc ff ff       	call   801002b4 <inb>
80100619:	0f b6 c0             	movzbl %al,%eax
8010061c:	09 45 f4             	or     %eax,-0xc(%ebp)

  if(c == '\n')
8010061f:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
80100623:	75 30                	jne    80100655 <cgaputc+0x8b>
    pos += 80 - pos%80;
80100625:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80100628:	ba 67 66 66 66       	mov    $0x66666667,%edx
8010062d:	89 c8                	mov    %ecx,%eax
8010062f:	f7 ea                	imul   %edx
80100631:	c1 fa 05             	sar    $0x5,%edx
80100634:	89 c8                	mov    %ecx,%eax
80100636:	c1 f8 1f             	sar    $0x1f,%eax
80100639:	29 c2                	sub    %eax,%edx
8010063b:	89 d0                	mov    %edx,%eax
8010063d:	c1 e0 02             	shl    $0x2,%eax
80100640:	01 d0                	add    %edx,%eax
80100642:	c1 e0 04             	shl    $0x4,%eax
80100645:	89 ca                	mov    %ecx,%edx
80100647:	29 c2                	sub    %eax,%edx
80100649:	b8 50 00 00 00       	mov    $0x50,%eax
8010064e:	29 d0                	sub    %edx,%eax
80100650:	01 45 f4             	add    %eax,-0xc(%ebp)
80100653:	eb 33                	jmp    80100688 <cgaputc+0xbe>
  else if(c == BACKSPACE){
80100655:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
8010065c:	75 0c                	jne    8010066a <cgaputc+0xa0>
    if(pos > 0) --pos;
8010065e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100662:	7e 24                	jle    80100688 <cgaputc+0xbe>
80100664:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80100668:	eb 1e                	jmp    80100688 <cgaputc+0xbe>
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010066a:	a1 00 90 10 80       	mov    0x80109000,%eax
8010066f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100672:	01 d2                	add    %edx,%edx
80100674:	8d 14 10             	lea    (%eax,%edx,1),%edx
80100677:	8b 45 08             	mov    0x8(%ebp),%eax
8010067a:	66 25 ff 00          	and    $0xff,%ax
8010067e:	80 cc 07             	or     $0x7,%ah
80100681:	66 89 02             	mov    %ax,(%edx)
80100684:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  if((pos/80) >= 24){  // Scroll up.
80100688:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
8010068f:	7e 53                	jle    801006e4 <cgaputc+0x11a>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100691:	a1 00 90 10 80       	mov    0x80109000,%eax
80100696:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
8010069c:	a1 00 90 10 80       	mov    0x80109000,%eax
801006a1:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801006a8:	00 
801006a9:	89 54 24 04          	mov    %edx,0x4(%esp)
801006ad:	89 04 24             	mov    %eax,(%esp)
801006b0:	e8 c0 4a 00 00       	call   80105175 <memmove>
    pos -= 80;
801006b5:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801006b9:	b8 80 07 00 00       	mov    $0x780,%eax
801006be:	2b 45 f4             	sub    -0xc(%ebp),%eax
801006c1:	8d 14 00             	lea    (%eax,%eax,1),%edx
801006c4:	a1 00 90 10 80       	mov    0x80109000,%eax
801006c9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801006cc:	01 c9                	add    %ecx,%ecx
801006ce:	01 c8                	add    %ecx,%eax
801006d0:	89 54 24 08          	mov    %edx,0x8(%esp)
801006d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801006db:	00 
801006dc:	89 04 24             	mov    %eax,(%esp)
801006df:	e8 be 49 00 00       	call   801050a2 <memset>
  }
  
  outb(CRTPORT, 14);
801006e4:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
801006eb:	00 
801006ec:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
801006f3:	e8 d9 fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT+1, pos>>8);
801006f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801006fb:	c1 f8 08             	sar    $0x8,%eax
801006fe:	0f b6 c0             	movzbl %al,%eax
80100701:	89 44 24 04          	mov    %eax,0x4(%esp)
80100705:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
8010070c:	e8 c0 fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT, 15);
80100711:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80100718:	00 
80100719:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
80100720:	e8 ac fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT+1, pos);
80100725:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100728:	0f b6 c0             	movzbl %al,%eax
8010072b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010072f:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
80100736:	e8 96 fb ff ff       	call   801002d1 <outb>
  crt[pos] = ' ' | 0x0700;
8010073b:	a1 00 90 10 80       	mov    0x80109000,%eax
80100740:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100743:	01 d2                	add    %edx,%edx
80100745:	01 d0                	add    %edx,%eax
80100747:	66 c7 00 20 07       	movw   $0x720,(%eax)
}
8010074c:	c9                   	leave  
8010074d:	c3                   	ret    

8010074e <consputc>:

void
consputc(int c)
{
8010074e:	55                   	push   %ebp
8010074f:	89 e5                	mov    %esp,%ebp
80100751:	83 ec 18             	sub    $0x18,%esp
  if(panicked){
80100754:	a1 a0 b5 10 80       	mov    0x8010b5a0,%eax
80100759:	85 c0                	test   %eax,%eax
8010075b:	74 07                	je     80100764 <consputc+0x16>
    cli();
8010075d:	e8 8d fb ff ff       	call   801002ef <cli>
    for(;;)
      ;
80100762:	eb fe                	jmp    80100762 <consputc+0x14>
  }

  if(c == BACKSPACE){
80100764:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
8010076b:	75 26                	jne    80100793 <consputc+0x45>
    uartputc('\b'); uartputc(' '); uartputc('\b');
8010076d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100774:	e8 7b 63 00 00       	call   80106af4 <uartputc>
80100779:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100780:	e8 6f 63 00 00       	call   80106af4 <uartputc>
80100785:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010078c:	e8 63 63 00 00       	call   80106af4 <uartputc>
80100791:	eb 0b                	jmp    8010079e <consputc+0x50>
  } else
    uartputc(c);
80100793:	8b 45 08             	mov    0x8(%ebp),%eax
80100796:	89 04 24             	mov    %eax,(%esp)
80100799:	e8 56 63 00 00       	call   80106af4 <uartputc>
  cgaputc(c);
8010079e:	8b 45 08             	mov    0x8(%ebp),%eax
801007a1:	89 04 24             	mov    %eax,(%esp)
801007a4:	e8 21 fe ff ff       	call   801005ca <cgaputc>
}
801007a9:	c9                   	leave  
801007aa:	c3                   	ret    

801007ab <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007ab:	55                   	push   %ebp
801007ac:	89 e5                	mov    %esp,%ebp
801007ae:	83 ec 28             	sub    $0x28,%esp
  int c;

  acquire(&input.lock);
801007b1:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
801007b8:	e8 96 46 00 00       	call   80104e53 <acquire>
  while((c = getc()) >= 0){
801007bd:	e9 3e 01 00 00       	jmp    80100900 <consoleintr+0x155>
    switch(c){
801007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801007c5:	83 f8 10             	cmp    $0x10,%eax
801007c8:	74 1e                	je     801007e8 <consoleintr+0x3d>
801007ca:	83 f8 10             	cmp    $0x10,%eax
801007cd:	7f 0a                	jg     801007d9 <consoleintr+0x2e>
801007cf:	83 f8 08             	cmp    $0x8,%eax
801007d2:	74 68                	je     8010083c <consoleintr+0x91>
801007d4:	e9 94 00 00 00       	jmp    8010086d <consoleintr+0xc2>
801007d9:	83 f8 15             	cmp    $0x15,%eax
801007dc:	74 2f                	je     8010080d <consoleintr+0x62>
801007de:	83 f8 7f             	cmp    $0x7f,%eax
801007e1:	74 59                	je     8010083c <consoleintr+0x91>
801007e3:	e9 85 00 00 00       	jmp    8010086d <consoleintr+0xc2>
    case C('P'):  // Process listing.
      procdump();
801007e8:	e8 10 45 00 00       	call   80104cfd <procdump>
      break;
801007ed:	e9 0e 01 00 00       	jmp    80100900 <consoleintr+0x155>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
801007f2:	a1 5c de 10 80       	mov    0x8010de5c,%eax
801007f7:	83 e8 01             	sub    $0x1,%eax
801007fa:	a3 5c de 10 80       	mov    %eax,0x8010de5c
        consputc(BACKSPACE);
801007ff:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
80100806:	e8 43 ff ff ff       	call   8010074e <consputc>
8010080b:	eb 01                	jmp    8010080e <consoleintr+0x63>
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010080d:	90                   	nop
8010080e:	8b 15 5c de 10 80    	mov    0x8010de5c,%edx
80100814:	a1 58 de 10 80       	mov    0x8010de58,%eax
80100819:	39 c2                	cmp    %eax,%edx
8010081b:	0f 84 db 00 00 00    	je     801008fc <consoleintr+0x151>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100821:	a1 5c de 10 80       	mov    0x8010de5c,%eax
80100826:	83 e8 01             	sub    $0x1,%eax
80100829:	83 e0 7f             	and    $0x7f,%eax
8010082c:	0f b6 80 d4 dd 10 80 	movzbl -0x7fef222c(%eax),%eax
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100833:	3c 0a                	cmp    $0xa,%al
80100835:	75 bb                	jne    801007f2 <consoleintr+0x47>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
80100837:	e9 c4 00 00 00       	jmp    80100900 <consoleintr+0x155>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
8010083c:	8b 15 5c de 10 80    	mov    0x8010de5c,%edx
80100842:	a1 58 de 10 80       	mov    0x8010de58,%eax
80100847:	39 c2                	cmp    %eax,%edx
80100849:	0f 84 b0 00 00 00    	je     801008ff <consoleintr+0x154>
        input.e--;
8010084f:	a1 5c de 10 80       	mov    0x8010de5c,%eax
80100854:	83 e8 01             	sub    $0x1,%eax
80100857:	a3 5c de 10 80       	mov    %eax,0x8010de5c
        consputc(BACKSPACE);
8010085c:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
80100863:	e8 e6 fe ff ff       	call   8010074e <consputc>
      }
      break;
80100868:	e9 93 00 00 00       	jmp    80100900 <consoleintr+0x155>
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
8010086d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100871:	0f 84 89 00 00 00    	je     80100900 <consoleintr+0x155>
80100877:	8b 15 5c de 10 80    	mov    0x8010de5c,%edx
8010087d:	a1 54 de 10 80       	mov    0x8010de54,%eax
80100882:	89 d1                	mov    %edx,%ecx
80100884:	29 c1                	sub    %eax,%ecx
80100886:	89 c8                	mov    %ecx,%eax
80100888:	83 f8 7f             	cmp    $0x7f,%eax
8010088b:	77 73                	ja     80100900 <consoleintr+0x155>
        c = (c == '\r') ? '\n' : c;
8010088d:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
80100891:	74 05                	je     80100898 <consoleintr+0xed>
80100893:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100896:	eb 05                	jmp    8010089d <consoleintr+0xf2>
80100898:	b8 0a 00 00 00       	mov    $0xa,%eax
8010089d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        input.buf[input.e++ % INPUT_BUF] = c;
801008a0:	a1 5c de 10 80       	mov    0x8010de5c,%eax
801008a5:	89 c1                	mov    %eax,%ecx
801008a7:	83 e1 7f             	and    $0x7f,%ecx
801008aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801008ad:	88 91 d4 dd 10 80    	mov    %dl,-0x7fef222c(%ecx)
801008b3:	83 c0 01             	add    $0x1,%eax
801008b6:	a3 5c de 10 80       	mov    %eax,0x8010de5c
        consputc(c);
801008bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801008be:	89 04 24             	mov    %eax,(%esp)
801008c1:	e8 88 fe ff ff       	call   8010074e <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
801008ca:	74 18                	je     801008e4 <consoleintr+0x139>
801008cc:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
801008d0:	74 12                	je     801008e4 <consoleintr+0x139>
801008d2:	a1 5c de 10 80       	mov    0x8010de5c,%eax
801008d7:	8b 15 54 de 10 80    	mov    0x8010de54,%edx
801008dd:	83 ea 80             	sub    $0xffffff80,%edx
801008e0:	39 d0                	cmp    %edx,%eax
801008e2:	75 1c                	jne    80100900 <consoleintr+0x155>
          input.w = input.e;
801008e4:	a1 5c de 10 80       	mov    0x8010de5c,%eax
801008e9:	a3 58 de 10 80       	mov    %eax,0x8010de58
          wakeup(&input.r);
801008ee:	c7 04 24 54 de 10 80 	movl   $0x8010de54,(%esp)
801008f5:	e8 5c 43 00 00       	call   80104c56 <wakeup>
801008fa:	eb 04                	jmp    80100900 <consoleintr+0x155>
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
801008fc:	90                   	nop
801008fd:	eb 01                	jmp    80100900 <consoleintr+0x155>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
801008ff:	90                   	nop
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0){
80100900:	8b 45 08             	mov    0x8(%ebp),%eax
80100903:	ff d0                	call   *%eax
80100905:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100908:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010090c:	0f 89 b0 fe ff ff    	jns    801007c2 <consoleintr+0x17>
        }
      }
      break;
    }
  }
  release(&input.lock);
80100912:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
80100919:	e8 96 45 00 00       	call   80104eb4 <release>
}
8010091e:	c9                   	leave  
8010091f:	c3                   	ret    

80100920 <consoleread>:

int
consoleread(struct inode *ip, char *dst, int n)
{
80100920:	55                   	push   %ebp
80100921:	89 e5                	mov    %esp,%ebp
80100923:	83 ec 28             	sub    $0x28,%esp
  uint target;
  int c;

  iunlock(ip);
80100926:	8b 45 08             	mov    0x8(%ebp),%eax
80100929:	89 04 24             	mov    %eax,(%esp)
8010092c:	e8 9b 10 00 00       	call   801019cc <iunlock>
  target = n;
80100931:	8b 45 10             	mov    0x10(%ebp),%eax
80100934:	89 45 f0             	mov    %eax,-0x10(%ebp)
  acquire(&input.lock);
80100937:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
8010093e:	e8 10 45 00 00       	call   80104e53 <acquire>
  while(n > 0){
80100943:	e9 a8 00 00 00       	jmp    801009f0 <consoleread+0xd0>
    while(input.r == input.w){
      if(proc->killed){
80100948:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010094e:	8b 40 24             	mov    0x24(%eax),%eax
80100951:	85 c0                	test   %eax,%eax
80100953:	74 21                	je     80100976 <consoleread+0x56>
        release(&input.lock);
80100955:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
8010095c:	e8 53 45 00 00       	call   80104eb4 <release>
        ilock(ip);
80100961:	8b 45 08             	mov    0x8(%ebp),%eax
80100964:	89 04 24             	mov    %eax,(%esp)
80100967:	e8 0f 0f 00 00       	call   8010187b <ilock>
        return -1;
8010096c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100971:	e9 a9 00 00 00       	jmp    80100a1f <consoleread+0xff>
      }
      sleep(&input.r, &input.lock);
80100976:	c7 44 24 04 a0 dd 10 	movl   $0x8010dda0,0x4(%esp)
8010097d:	80 
8010097e:	c7 04 24 54 de 10 80 	movl   $0x8010de54,(%esp)
80100985:	e8 ef 41 00 00       	call   80104b79 <sleep>
8010098a:	eb 01                	jmp    8010098d <consoleread+0x6d>

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
8010098c:	90                   	nop
8010098d:	8b 15 54 de 10 80    	mov    0x8010de54,%edx
80100993:	a1 58 de 10 80       	mov    0x8010de58,%eax
80100998:	39 c2                	cmp    %eax,%edx
8010099a:	74 ac                	je     80100948 <consoleread+0x28>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
8010099c:	a1 54 de 10 80       	mov    0x8010de54,%eax
801009a1:	89 c2                	mov    %eax,%edx
801009a3:	83 e2 7f             	and    $0x7f,%edx
801009a6:	0f b6 92 d4 dd 10 80 	movzbl -0x7fef222c(%edx),%edx
801009ad:	0f be d2             	movsbl %dl,%edx
801009b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
801009b3:	83 c0 01             	add    $0x1,%eax
801009b6:	a3 54 de 10 80       	mov    %eax,0x8010de54
    if(c == C('D')){  // EOF
801009bb:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
801009bf:	75 17                	jne    801009d8 <consoleread+0xb8>
      if(n < target){
801009c1:	8b 45 10             	mov    0x10(%ebp),%eax
801009c4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801009c7:	73 2f                	jae    801009f8 <consoleread+0xd8>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
801009c9:	a1 54 de 10 80       	mov    0x8010de54,%eax
801009ce:	83 e8 01             	sub    $0x1,%eax
801009d1:	a3 54 de 10 80       	mov    %eax,0x8010de54
      }
      break;
801009d6:	eb 24                	jmp    801009fc <consoleread+0xdc>
    }
    *dst++ = c;
801009d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801009db:	89 c2                	mov    %eax,%edx
801009dd:	8b 45 0c             	mov    0xc(%ebp),%eax
801009e0:	88 10                	mov    %dl,(%eax)
801009e2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    --n;
801009e6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    if(c == '\n')
801009ea:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
801009ee:	74 0b                	je     801009fb <consoleread+0xdb>
  int c;

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
801009f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801009f4:	7f 96                	jg     8010098c <consoleread+0x6c>
801009f6:	eb 04                	jmp    801009fc <consoleread+0xdc>
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
801009f8:	90                   	nop
801009f9:	eb 01                	jmp    801009fc <consoleread+0xdc>
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
801009fb:	90                   	nop
  }
  release(&input.lock);
801009fc:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
80100a03:	e8 ac 44 00 00       	call   80104eb4 <release>
  ilock(ip);
80100a08:	8b 45 08             	mov    0x8(%ebp),%eax
80100a0b:	89 04 24             	mov    %eax,(%esp)
80100a0e:	e8 68 0e 00 00       	call   8010187b <ilock>

  return target - n;
80100a13:	8b 45 10             	mov    0x10(%ebp),%eax
80100a16:	8b 55 f0             	mov    -0x10(%ebp),%edx
80100a19:	89 d1                	mov    %edx,%ecx
80100a1b:	29 c1                	sub    %eax,%ecx
80100a1d:	89 c8                	mov    %ecx,%eax
}
80100a1f:	c9                   	leave  
80100a20:	c3                   	ret    

80100a21 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100a21:	55                   	push   %ebp
80100a22:	89 e5                	mov    %esp,%ebp
80100a24:	83 ec 28             	sub    $0x28,%esp
  int i;

  iunlock(ip);
80100a27:	8b 45 08             	mov    0x8(%ebp),%eax
80100a2a:	89 04 24             	mov    %eax,(%esp)
80100a2d:	e8 9a 0f 00 00       	call   801019cc <iunlock>
  acquire(&cons.lock);
80100a32:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100a39:	e8 15 44 00 00       	call   80104e53 <acquire>
  for(i = 0; i < n; i++)
80100a3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80100a45:	eb 1d                	jmp    80100a64 <consolewrite+0x43>
    consputc(buf[i] & 0xff);
80100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100a4a:	03 45 0c             	add    0xc(%ebp),%eax
80100a4d:	0f b6 00             	movzbl (%eax),%eax
80100a50:	0f be c0             	movsbl %al,%eax
80100a53:	25 ff 00 00 00       	and    $0xff,%eax
80100a58:	89 04 24             	mov    %eax,(%esp)
80100a5b:	e8 ee fc ff ff       	call   8010074e <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
80100a60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80100a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100a67:	3b 45 10             	cmp    0x10(%ebp),%eax
80100a6a:	7c db                	jl     80100a47 <consolewrite+0x26>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
80100a6c:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100a73:	e8 3c 44 00 00       	call   80104eb4 <release>
  ilock(ip);
80100a78:	8b 45 08             	mov    0x8(%ebp),%eax
80100a7b:	89 04 24             	mov    %eax,(%esp)
80100a7e:	e8 f8 0d 00 00       	call   8010187b <ilock>

  return n;
80100a83:	8b 45 10             	mov    0x10(%ebp),%eax
}
80100a86:	c9                   	leave  
80100a87:	c3                   	ret    

80100a88 <consoleinit>:

void
consoleinit(void)
{
80100a88:	55                   	push   %ebp
80100a89:	89 e5                	mov    %esp,%ebp
80100a8b:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100a8e:	c7 44 24 04 ef 84 10 	movl   $0x801084ef,0x4(%esp)
80100a95:	80 
80100a96:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100a9d:	e8 90 43 00 00       	call   80104e32 <initlock>
  initlock(&input.lock, "input");
80100aa2:	c7 44 24 04 f7 84 10 	movl   $0x801084f7,0x4(%esp)
80100aa9:	80 
80100aaa:	c7 04 24 a0 dd 10 80 	movl   $0x8010dda0,(%esp)
80100ab1:	e8 7c 43 00 00       	call   80104e32 <initlock>

  devsw[CONSOLE].write = consolewrite;
80100ab6:	c7 05 0c e8 10 80 21 	movl   $0x80100a21,0x8010e80c
80100abd:	0a 10 80 
  devsw[CONSOLE].read = consoleread;
80100ac0:	c7 05 08 e8 10 80 20 	movl   $0x80100920,0x8010e808
80100ac7:	09 10 80 
  cons.locking = 1;
80100aca:	c7 05 f4 b5 10 80 01 	movl   $0x1,0x8010b5f4
80100ad1:	00 00 00 

  picenable(IRQ_KBD);
80100ad4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80100adb:	e8 ad 2f 00 00       	call   80103a8d <picenable>
  ioapicenable(IRQ_KBD, 0);
80100ae0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100ae7:	00 
80100ae8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80100aef:	e8 8a 1e 00 00       	call   8010297e <ioapicenable>
}
80100af4:	c9                   	leave  
80100af5:	c3                   	ret    
	...

80100af8 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100af8:	55                   	push   %ebp
80100af9:	89 e5                	mov    %esp,%ebp
80100afb:	81 ec 38 01 00 00    	sub    $0x138,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  if((ip = namei(path)) == 0)
80100b01:	8b 45 08             	mov    0x8(%ebp),%eax
80100b04:	89 04 24             	mov    %eax,(%esp)
80100b07:	e8 17 19 00 00       	call   80102423 <namei>
80100b0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
80100b0f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80100b13:	75 0a                	jne    80100b1f <exec+0x27>
    return -1;
80100b15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b1a:	e9 e4 03 00 00       	jmp    80100f03 <exec+0x40b>
  ilock(ip);
80100b1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100b22:	89 04 24             	mov    %eax,(%esp)
80100b25:	e8 51 0d 00 00       	call   8010187b <ilock>
  pgdir = 0;
80100b2a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100b31:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
80100b37:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
80100b3e:	00 
80100b3f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100b46:	00 
80100b47:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100b4e:	89 04 24             	mov    %eax,(%esp)
80100b51:	e8 1e 12 00 00       	call   80101d74 <readi>
80100b56:	83 f8 33             	cmp    $0x33,%eax
80100b59:	0f 86 5e 03 00 00    	jbe    80100ebd <exec+0x3c5>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100b5f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b65:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
80100b6a:	0f 85 50 03 00 00    	jne    80100ec0 <exec+0x3c8>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100b70:	e8 c4 70 00 00       	call   80107c39 <setupkvm>
80100b75:	89 45 f0             	mov    %eax,-0x10(%ebp)
80100b78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100b7c:	0f 84 41 03 00 00    	je     80100ec3 <exec+0x3cb>
    goto bad;

  // Load program into memory.
  sz = 0;
80100b82:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b89:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
80100b90:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
80100b96:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100b99:	e9 ca 00 00 00       	jmp    80100c68 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b9e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80100ba1:	8d 85 ec fe ff ff    	lea    -0x114(%ebp),%eax
80100ba7:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100bae:	00 
80100baf:	89 54 24 08          	mov    %edx,0x8(%esp)
80100bb3:	89 44 24 04          	mov    %eax,0x4(%esp)
80100bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100bba:	89 04 24             	mov    %eax,(%esp)
80100bbd:	e8 b2 11 00 00       	call   80101d74 <readi>
80100bc2:	83 f8 20             	cmp    $0x20,%eax
80100bc5:	0f 85 fb 02 00 00    	jne    80100ec6 <exec+0x3ce>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100bcb:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100bd1:	83 f8 01             	cmp    $0x1,%eax
80100bd4:	0f 85 80 00 00 00    	jne    80100c5a <exec+0x162>
      continue;
    if(ph.memsz < ph.filesz)
80100bda:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
80100be0:	8b 85 fc fe ff ff    	mov    -0x104(%ebp),%eax
80100be6:	39 c2                	cmp    %eax,%edx
80100be8:	0f 82 db 02 00 00    	jb     80100ec9 <exec+0x3d1>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100bee:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
80100bf4:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
80100bfa:	8d 04 02             	lea    (%edx,%eax,1),%eax
80100bfd:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100c04:	89 44 24 04          	mov    %eax,0x4(%esp)
80100c08:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100c0b:	89 04 24             	mov    %eax,(%esp)
80100c0e:	e8 fa 73 00 00       	call   8010800d <allocuvm>
80100c13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100c16:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100c1a:	0f 84 ac 02 00 00    	je     80100ecc <exec+0x3d4>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100c20:	8b 8d fc fe ff ff    	mov    -0x104(%ebp),%ecx
80100c26:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100c2c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c32:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80100c36:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100c3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
80100c3d:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c41:	89 44 24 04          	mov    %eax,0x4(%esp)
80100c45:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100c48:	89 04 24             	mov    %eax,(%esp)
80100c4b:	e8 cd 72 00 00       	call   80107f1d <loaduvm>
80100c50:	85 c0                	test   %eax,%eax
80100c52:	0f 88 77 02 00 00    	js     80100ecf <exec+0x3d7>
80100c58:	eb 01                	jmp    80100c5b <exec+0x163>
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
      continue;
80100c5a:	90                   	nop
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100c5b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
80100c5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100c62:	83 c0 20             	add    $0x20,%eax
80100c65:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100c68:	0f b7 85 38 ff ff ff 	movzwl -0xc8(%ebp),%eax
80100c6f:	0f b7 c0             	movzwl %ax,%eax
80100c72:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80100c75:	0f 8f 23 ff ff ff    	jg     80100b9e <exec+0xa6>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100c7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100c7e:	89 04 24             	mov    %eax,(%esp)
80100c81:	e8 7c 0e 00 00       	call   80101b02 <iunlockput>
  ip = 0;
80100c86:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100c8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100c90:	05 ff 0f 00 00       	add    $0xfff,%eax
80100c95:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100c9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ca0:	05 00 20 00 00       	add    $0x2000,%eax
80100ca5:	89 44 24 08          	mov    %eax,0x8(%esp)
80100ca9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100cac:	89 44 24 04          	mov    %eax,0x4(%esp)
80100cb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100cb3:	89 04 24             	mov    %eax,(%esp)
80100cb6:	e8 52 73 00 00       	call   8010800d <allocuvm>
80100cbb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100cbe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100cc2:	0f 84 0a 02 00 00    	je     80100ed2 <exec+0x3da>
    goto bad;
  proc->pstack = (uint *)sz;
80100cc8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cce:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100cd1:	89 50 7c             	mov    %edx,0x7c(%eax)

  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100cd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100cd7:	2d 00 20 00 00       	sub    $0x2000,%eax
80100cdc:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ce0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100ce3:	89 04 24             	mov    %eax,(%esp)
80100ce6:	e8 46 75 00 00       	call   80108231 <clearpteu>

  sp = sz;
80100ceb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100cee:	89 45 e8             	mov    %eax,-0x18(%ebp)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100cf1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80100cf8:	e9 81 00 00 00       	jmp    80100d7e <exec+0x286>
    if(argc >= MAXARG)
80100cfd:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
80100d01:	0f 87 ce 01 00 00    	ja     80100ed5 <exec+0x3dd>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100d07:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d0a:	c1 e0 02             	shl    $0x2,%eax
80100d0d:	03 45 0c             	add    0xc(%ebp),%eax
80100d10:	8b 00                	mov    (%eax),%eax
80100d12:	89 04 24             	mov    %eax,(%esp)
80100d15:	e8 09 46 00 00       	call   80105323 <strlen>
80100d1a:	f7 d0                	not    %eax
80100d1c:	03 45 e8             	add    -0x18(%ebp),%eax
80100d1f:	83 e0 fc             	and    $0xfffffffc,%eax
80100d22:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100d25:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d28:	c1 e0 02             	shl    $0x2,%eax
80100d2b:	03 45 0c             	add    0xc(%ebp),%eax
80100d2e:	8b 00                	mov    (%eax),%eax
80100d30:	89 04 24             	mov    %eax,(%esp)
80100d33:	e8 eb 45 00 00       	call   80105323 <strlen>
80100d38:	83 c0 01             	add    $0x1,%eax
80100d3b:	89 c2                	mov    %eax,%edx
80100d3d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d40:	c1 e0 02             	shl    $0x2,%eax
80100d43:	03 45 0c             	add    0xc(%ebp),%eax
80100d46:	8b 00                	mov    (%eax),%eax
80100d48:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100d4c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100d50:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100d53:	89 44 24 04          	mov    %eax,0x4(%esp)
80100d57:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d5a:	89 04 24             	mov    %eax,(%esp)
80100d5d:	e8 94 76 00 00       	call   801083f6 <copyout>
80100d62:	85 c0                	test   %eax,%eax
80100d64:	0f 88 6e 01 00 00    	js     80100ed8 <exec+0x3e0>
      goto bad;
    ustack[3+argc] = sp;
80100d6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d6d:	8d 50 03             	lea    0x3(%eax),%edx
80100d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100d73:	89 84 95 40 ff ff ff 	mov    %eax,-0xc0(%ebp,%edx,4)
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));

  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d7a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
80100d7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d81:	c1 e0 02             	shl    $0x2,%eax
80100d84:	03 45 0c             	add    0xc(%ebp),%eax
80100d87:	8b 00                	mov    (%eax),%eax
80100d89:	85 c0                	test   %eax,%eax
80100d8b:	0f 85 6c ff ff ff    	jne    80100cfd <exec+0x205>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100d91:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d94:	83 c0 03             	add    $0x3,%eax
80100d97:	c7 84 85 40 ff ff ff 	movl   $0x0,-0xc0(%ebp,%eax,4)
80100d9e:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100da2:	c7 85 40 ff ff ff ff 	movl   $0xffffffff,-0xc0(%ebp)
80100da9:	ff ff ff 
  ustack[1] = argc;
80100dac:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100daf:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100db5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100db8:	83 c0 01             	add    $0x1,%eax
80100dbb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80100dc2:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100dc5:	29 d0                	sub    %edx,%eax
80100dc7:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)

  sp -= (3+argc+1) * 4;
80100dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100dd0:	83 c0 04             	add    $0x4,%eax
80100dd3:	c1 e0 02             	shl    $0x2,%eax
80100dd6:	29 45 e8             	sub    %eax,-0x18(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100dd9:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100ddc:	83 c0 04             	add    $0x4,%eax
80100ddf:	c1 e0 02             	shl    $0x2,%eax
80100de2:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100de6:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
80100dec:	89 44 24 08          	mov    %eax,0x8(%esp)
80100df0:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100df3:	89 44 24 04          	mov    %eax,0x4(%esp)
80100df7:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100dfa:	89 04 24             	mov    %eax,(%esp)
80100dfd:	e8 f4 75 00 00       	call   801083f6 <copyout>
80100e02:	85 c0                	test   %eax,%eax
80100e04:	0f 88 d1 00 00 00    	js     80100edb <exec+0x3e3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e0a:	8b 45 08             	mov    0x8(%ebp),%eax
80100e0d:	89 45 d0             	mov    %eax,-0x30(%ebp)
80100e10:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e13:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80100e16:	eb 17                	jmp    80100e2f <exec+0x337>
    if(*s == '/')
80100e18:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e1b:	0f b6 00             	movzbl (%eax),%eax
80100e1e:	3c 2f                	cmp    $0x2f,%al
80100e20:	75 09                	jne    80100e2b <exec+0x333>
      last = s+1;
80100e22:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e25:	83 c0 01             	add    $0x1,%eax
80100e28:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e2b:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
80100e2f:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e32:	0f b6 00             	movzbl (%eax),%eax
80100e35:	84 c0                	test   %al,%al
80100e37:	75 df                	jne    80100e18 <exec+0x320>
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100e39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e3f:	8d 50 6c             	lea    0x6c(%eax),%edx
80100e42:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100e49:	00 
80100e4a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80100e4d:	89 44 24 04          	mov    %eax,0x4(%esp)
80100e51:	89 14 24             	mov    %edx,(%esp)
80100e54:	e8 7c 44 00 00       	call   801052d5 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100e59:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e5f:	8b 40 04             	mov    0x4(%eax),%eax
80100e62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  proc->pgdir = pgdir;
80100e65:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
80100e6e:	89 50 04             	mov    %edx,0x4(%eax)
  proc->sz = sz;
80100e71:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e77:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100e7a:	89 10                	mov    %edx,(%eax)
  proc->tf->eip = elf.entry;  // main
80100e7c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e82:	8b 40 18             	mov    0x18(%eax),%eax
80100e85:	8b 95 24 ff ff ff    	mov    -0xdc(%ebp),%edx
80100e8b:	89 50 38             	mov    %edx,0x38(%eax)
  proc->tf->esp = sp;
80100e8e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e94:	8b 40 18             	mov    0x18(%eax),%eax
80100e97:	8b 55 e8             	mov    -0x18(%ebp),%edx
80100e9a:	89 50 44             	mov    %edx,0x44(%eax)
  switchuvm(proc);
80100e9d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100ea3:	89 04 24             	mov    %eax,(%esp)
80100ea6:	e8 80 6e 00 00       	call   80107d2b <switchuvm>
  freevm(oldpgdir);
80100eab:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100eae:	89 04 24             	mov    %eax,(%esp)
80100eb1:	e8 ed 72 00 00       	call   801081a3 <freevm>
  return 0;
80100eb6:	b8 00 00 00 00       	mov    $0x0,%eax
80100ebb:	eb 46                	jmp    80100f03 <exec+0x40b>
  ilock(ip);
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
80100ebd:	90                   	nop
80100ebe:	eb 1c                	jmp    80100edc <exec+0x3e4>
  if(elf.magic != ELF_MAGIC)
    goto bad;
80100ec0:	90                   	nop
80100ec1:	eb 19                	jmp    80100edc <exec+0x3e4>

  if((pgdir = setupkvm()) == 0)
    goto bad;
80100ec3:	90                   	nop
80100ec4:	eb 16                	jmp    80100edc <exec+0x3e4>

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
80100ec6:	90                   	nop
80100ec7:	eb 13                	jmp    80100edc <exec+0x3e4>
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto bad;
80100ec9:	90                   	nop
80100eca:	eb 10                	jmp    80100edc <exec+0x3e4>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
80100ecc:	90                   	nop
80100ecd:	eb 0d                	jmp    80100edc <exec+0x3e4>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
80100ecf:	90                   	nop
80100ed0:	eb 0a                	jmp    80100edc <exec+0x3e4>

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
80100ed2:	90                   	nop
80100ed3:	eb 07                	jmp    80100edc <exec+0x3e4>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
80100ed5:	90                   	nop
80100ed6:	eb 04                	jmp    80100edc <exec+0x3e4>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
80100ed8:	90                   	nop
80100ed9:	eb 01                	jmp    80100edc <exec+0x3e4>
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;
80100edb:	90                   	nop
  switchuvm(proc);
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
80100edc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100ee0:	74 0b                	je     80100eed <exec+0x3f5>
    freevm(pgdir);
80100ee2:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100ee5:	89 04 24             	mov    %eax,(%esp)
80100ee8:	e8 b6 72 00 00       	call   801081a3 <freevm>
  if(ip)
80100eed:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80100ef1:	74 0b                	je     80100efe <exec+0x406>
    iunlockput(ip);
80100ef3:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100ef6:	89 04 24             	mov    %eax,(%esp)
80100ef9:	e8 04 0c 00 00       	call   80101b02 <iunlockput>
  return -1;
80100efe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f03:	c9                   	leave  
80100f04:	c3                   	ret    
80100f05:	00 00                	add    %al,(%eax)
	...

80100f08 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100f08:	55                   	push   %ebp
80100f09:	89 e5                	mov    %esp,%ebp
80100f0b:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100f0e:	c7 44 24 04 fd 84 10 	movl   $0x801084fd,0x4(%esp)
80100f15:	80 
80100f16:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100f1d:	e8 10 3f 00 00       	call   80104e32 <initlock>
}
80100f22:	c9                   	leave  
80100f23:	c3                   	ret    

80100f24 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100f24:	55                   	push   %ebp
80100f25:	89 e5                	mov    %esp,%ebp
80100f27:	83 ec 28             	sub    $0x28,%esp
  struct file *f;

  acquire(&ftable.lock);
80100f2a:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100f31:	e8 1d 3f 00 00       	call   80104e53 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100f36:	c7 45 f4 94 de 10 80 	movl   $0x8010de94,-0xc(%ebp)
80100f3d:	eb 29                	jmp    80100f68 <filealloc+0x44>
    if(f->ref == 0){
80100f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f42:	8b 40 04             	mov    0x4(%eax),%eax
80100f45:	85 c0                	test   %eax,%eax
80100f47:	75 1b                	jne    80100f64 <filealloc+0x40>
      f->ref = 1;
80100f49:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f4c:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
      release(&ftable.lock);
80100f53:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100f5a:	e8 55 3f 00 00       	call   80104eb4 <release>
      return f;
80100f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f62:	eb 1f                	jmp    80100f83 <filealloc+0x5f>
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100f64:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
80100f68:	b8 f4 e7 10 80       	mov    $0x8010e7f4,%eax
80100f6d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80100f70:	72 cd                	jb     80100f3f <filealloc+0x1b>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100f72:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100f79:	e8 36 3f 00 00       	call   80104eb4 <release>
  return 0;
80100f7e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80100f83:	c9                   	leave  
80100f84:	c3                   	ret    

80100f85 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100f85:	55                   	push   %ebp
80100f86:	89 e5                	mov    %esp,%ebp
80100f88:	83 ec 18             	sub    $0x18,%esp
  acquire(&ftable.lock);
80100f8b:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100f92:	e8 bc 3e 00 00       	call   80104e53 <acquire>
  if(f->ref < 1)
80100f97:	8b 45 08             	mov    0x8(%ebp),%eax
80100f9a:	8b 40 04             	mov    0x4(%eax),%eax
80100f9d:	85 c0                	test   %eax,%eax
80100f9f:	7f 0c                	jg     80100fad <filedup+0x28>
    panic("filedup");
80100fa1:	c7 04 24 04 85 10 80 	movl   $0x80108504,(%esp)
80100fa8:	e8 8d f5 ff ff       	call   8010053a <panic>
  f->ref++;
80100fad:	8b 45 08             	mov    0x8(%ebp),%eax
80100fb0:	8b 40 04             	mov    0x4(%eax),%eax
80100fb3:	8d 50 01             	lea    0x1(%eax),%edx
80100fb6:	8b 45 08             	mov    0x8(%ebp),%eax
80100fb9:	89 50 04             	mov    %edx,0x4(%eax)
  release(&ftable.lock);
80100fbc:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100fc3:	e8 ec 3e 00 00       	call   80104eb4 <release>
  return f;
80100fc8:	8b 45 08             	mov    0x8(%ebp),%eax
}
80100fcb:	c9                   	leave  
80100fcc:	c3                   	ret    

80100fcd <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100fcd:	55                   	push   %ebp
80100fce:	89 e5                	mov    %esp,%ebp
80100fd0:	83 ec 38             	sub    $0x38,%esp
  struct file ff;

  acquire(&ftable.lock);
80100fd3:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80100fda:	e8 74 3e 00 00       	call   80104e53 <acquire>
  if(f->ref < 1)
80100fdf:	8b 45 08             	mov    0x8(%ebp),%eax
80100fe2:	8b 40 04             	mov    0x4(%eax),%eax
80100fe5:	85 c0                	test   %eax,%eax
80100fe7:	7f 0c                	jg     80100ff5 <fileclose+0x28>
    panic("fileclose");
80100fe9:	c7 04 24 0c 85 10 80 	movl   $0x8010850c,(%esp)
80100ff0:	e8 45 f5 ff ff       	call   8010053a <panic>
  if(--f->ref > 0){
80100ff5:	8b 45 08             	mov    0x8(%ebp),%eax
80100ff8:	8b 40 04             	mov    0x4(%eax),%eax
80100ffb:	8d 50 ff             	lea    -0x1(%eax),%edx
80100ffe:	8b 45 08             	mov    0x8(%ebp),%eax
80101001:	89 50 04             	mov    %edx,0x4(%eax)
80101004:	8b 45 08             	mov    0x8(%ebp),%eax
80101007:	8b 40 04             	mov    0x4(%eax),%eax
8010100a:	85 c0                	test   %eax,%eax
8010100c:	7e 11                	jle    8010101f <fileclose+0x52>
    release(&ftable.lock);
8010100e:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
80101015:	e8 9a 3e 00 00       	call   80104eb4 <release>
    return;
8010101a:	e9 82 00 00 00       	jmp    801010a1 <fileclose+0xd4>
  }
  ff = *f;
8010101f:	8b 45 08             	mov    0x8(%ebp),%eax
80101022:	8b 10                	mov    (%eax),%edx
80101024:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101027:	8b 50 04             	mov    0x4(%eax),%edx
8010102a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010102d:	8b 50 08             	mov    0x8(%eax),%edx
80101030:	89 55 e8             	mov    %edx,-0x18(%ebp)
80101033:	8b 50 0c             	mov    0xc(%eax),%edx
80101036:	89 55 ec             	mov    %edx,-0x14(%ebp)
80101039:	8b 50 10             	mov    0x10(%eax),%edx
8010103c:	89 55 f0             	mov    %edx,-0x10(%ebp)
8010103f:	8b 40 14             	mov    0x14(%eax),%eax
80101042:	89 45 f4             	mov    %eax,-0xc(%ebp)
  f->ref = 0;
80101045:	8b 45 08             	mov    0x8(%ebp),%eax
80101048:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  f->type = FD_NONE;
8010104f:	8b 45 08             	mov    0x8(%ebp),%eax
80101052:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  release(&ftable.lock);
80101058:	c7 04 24 60 de 10 80 	movl   $0x8010de60,(%esp)
8010105f:	e8 50 3e 00 00       	call   80104eb4 <release>
  
  if(ff.type == FD_PIPE)
80101064:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101067:	83 f8 01             	cmp    $0x1,%eax
8010106a:	75 18                	jne    80101084 <fileclose+0xb7>
    pipeclose(ff.pipe, ff.writable);
8010106c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
80101070:	0f be d0             	movsbl %al,%edx
80101073:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101076:	89 54 24 04          	mov    %edx,0x4(%esp)
8010107a:	89 04 24             	mov    %eax,(%esp)
8010107d:	e8 c5 2c 00 00       	call   80103d47 <pipeclose>
80101082:	eb 1d                	jmp    801010a1 <fileclose+0xd4>
  else if(ff.type == FD_INODE){
80101084:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101087:	83 f8 02             	cmp    $0x2,%eax
8010108a:	75 15                	jne    801010a1 <fileclose+0xd4>
    begin_trans();
8010108c:	e8 81 21 00 00       	call   80103212 <begin_trans>
    iput(ff.ip);
80101091:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101094:	89 04 24             	mov    %eax,(%esp)
80101097:	e8 95 09 00 00       	call   80101a31 <iput>
    commit_trans();
8010109c:	e8 ba 21 00 00       	call   8010325b <commit_trans>
  }
}
801010a1:	c9                   	leave  
801010a2:	c3                   	ret    

801010a3 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
801010a3:	55                   	push   %ebp
801010a4:	89 e5                	mov    %esp,%ebp
801010a6:	83 ec 18             	sub    $0x18,%esp
  if(f->type == FD_INODE){
801010a9:	8b 45 08             	mov    0x8(%ebp),%eax
801010ac:	8b 00                	mov    (%eax),%eax
801010ae:	83 f8 02             	cmp    $0x2,%eax
801010b1:	75 38                	jne    801010eb <filestat+0x48>
    ilock(f->ip);
801010b3:	8b 45 08             	mov    0x8(%ebp),%eax
801010b6:	8b 40 10             	mov    0x10(%eax),%eax
801010b9:	89 04 24             	mov    %eax,(%esp)
801010bc:	e8 ba 07 00 00       	call   8010187b <ilock>
    stati(f->ip, st);
801010c1:	8b 45 08             	mov    0x8(%ebp),%eax
801010c4:	8b 40 10             	mov    0x10(%eax),%eax
801010c7:	8b 55 0c             	mov    0xc(%ebp),%edx
801010ca:	89 54 24 04          	mov    %edx,0x4(%esp)
801010ce:	89 04 24             	mov    %eax,(%esp)
801010d1:	e8 59 0c 00 00       	call   80101d2f <stati>
    iunlock(f->ip);
801010d6:	8b 45 08             	mov    0x8(%ebp),%eax
801010d9:	8b 40 10             	mov    0x10(%eax),%eax
801010dc:	89 04 24             	mov    %eax,(%esp)
801010df:	e8 e8 08 00 00       	call   801019cc <iunlock>
    return 0;
801010e4:	b8 00 00 00 00       	mov    $0x0,%eax
801010e9:	eb 05                	jmp    801010f0 <filestat+0x4d>
  }
  return -1;
801010eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801010f0:	c9                   	leave  
801010f1:	c3                   	ret    

801010f2 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
801010f2:	55                   	push   %ebp
801010f3:	89 e5                	mov    %esp,%ebp
801010f5:	83 ec 28             	sub    $0x28,%esp
  int r;

  if(f->readable == 0)
801010f8:	8b 45 08             	mov    0x8(%ebp),%eax
801010fb:	0f b6 40 08          	movzbl 0x8(%eax),%eax
801010ff:	84 c0                	test   %al,%al
80101101:	75 0a                	jne    8010110d <fileread+0x1b>
    return -1;
80101103:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101108:	e9 9f 00 00 00       	jmp    801011ac <fileread+0xba>
  if(f->type == FD_PIPE)
8010110d:	8b 45 08             	mov    0x8(%ebp),%eax
80101110:	8b 00                	mov    (%eax),%eax
80101112:	83 f8 01             	cmp    $0x1,%eax
80101115:	75 1e                	jne    80101135 <fileread+0x43>
    return piperead(f->pipe, addr, n);
80101117:	8b 45 08             	mov    0x8(%ebp),%eax
8010111a:	8b 40 0c             	mov    0xc(%eax),%eax
8010111d:	8b 55 10             	mov    0x10(%ebp),%edx
80101120:	89 54 24 08          	mov    %edx,0x8(%esp)
80101124:	8b 55 0c             	mov    0xc(%ebp),%edx
80101127:	89 54 24 04          	mov    %edx,0x4(%esp)
8010112b:	89 04 24             	mov    %eax,(%esp)
8010112e:	e8 96 2d 00 00       	call   80103ec9 <piperead>
80101133:	eb 77                	jmp    801011ac <fileread+0xba>
  if(f->type == FD_INODE){
80101135:	8b 45 08             	mov    0x8(%ebp),%eax
80101138:	8b 00                	mov    (%eax),%eax
8010113a:	83 f8 02             	cmp    $0x2,%eax
8010113d:	75 61                	jne    801011a0 <fileread+0xae>
    ilock(f->ip);
8010113f:	8b 45 08             	mov    0x8(%ebp),%eax
80101142:	8b 40 10             	mov    0x10(%eax),%eax
80101145:	89 04 24             	mov    %eax,(%esp)
80101148:	e8 2e 07 00 00       	call   8010187b <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
8010114d:	8b 4d 10             	mov    0x10(%ebp),%ecx
80101150:	8b 45 08             	mov    0x8(%ebp),%eax
80101153:	8b 50 14             	mov    0x14(%eax),%edx
80101156:	8b 45 08             	mov    0x8(%ebp),%eax
80101159:	8b 40 10             	mov    0x10(%eax),%eax
8010115c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80101160:	89 54 24 08          	mov    %edx,0x8(%esp)
80101164:	8b 55 0c             	mov    0xc(%ebp),%edx
80101167:	89 54 24 04          	mov    %edx,0x4(%esp)
8010116b:	89 04 24             	mov    %eax,(%esp)
8010116e:	e8 01 0c 00 00       	call   80101d74 <readi>
80101173:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101176:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010117a:	7e 11                	jle    8010118d <fileread+0x9b>
      f->off += r;
8010117c:	8b 45 08             	mov    0x8(%ebp),%eax
8010117f:	8b 50 14             	mov    0x14(%eax),%edx
80101182:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101185:	01 c2                	add    %eax,%edx
80101187:	8b 45 08             	mov    0x8(%ebp),%eax
8010118a:	89 50 14             	mov    %edx,0x14(%eax)
    iunlock(f->ip);
8010118d:	8b 45 08             	mov    0x8(%ebp),%eax
80101190:	8b 40 10             	mov    0x10(%eax),%eax
80101193:	89 04 24             	mov    %eax,(%esp)
80101196:	e8 31 08 00 00       	call   801019cc <iunlock>
    return r;
8010119b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010119e:	eb 0c                	jmp    801011ac <fileread+0xba>
  }
  panic("fileread");
801011a0:	c7 04 24 16 85 10 80 	movl   $0x80108516,(%esp)
801011a7:	e8 8e f3 ff ff       	call   8010053a <panic>
}
801011ac:	c9                   	leave  
801011ad:	c3                   	ret    

801011ae <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
801011ae:	55                   	push   %ebp
801011af:	89 e5                	mov    %esp,%ebp
801011b1:	53                   	push   %ebx
801011b2:	83 ec 24             	sub    $0x24,%esp
  int r;

  if(f->writable == 0)
801011b5:	8b 45 08             	mov    0x8(%ebp),%eax
801011b8:	0f b6 40 09          	movzbl 0x9(%eax),%eax
801011bc:	84 c0                	test   %al,%al
801011be:	75 0a                	jne    801011ca <filewrite+0x1c>
    return -1;
801011c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801011c5:	e9 23 01 00 00       	jmp    801012ed <filewrite+0x13f>
  if(f->type == FD_PIPE)
801011ca:	8b 45 08             	mov    0x8(%ebp),%eax
801011cd:	8b 00                	mov    (%eax),%eax
801011cf:	83 f8 01             	cmp    $0x1,%eax
801011d2:	75 21                	jne    801011f5 <filewrite+0x47>
    return pipewrite(f->pipe, addr, n);
801011d4:	8b 45 08             	mov    0x8(%ebp),%eax
801011d7:	8b 40 0c             	mov    0xc(%eax),%eax
801011da:	8b 55 10             	mov    0x10(%ebp),%edx
801011dd:	89 54 24 08          	mov    %edx,0x8(%esp)
801011e1:	8b 55 0c             	mov    0xc(%ebp),%edx
801011e4:	89 54 24 04          	mov    %edx,0x4(%esp)
801011e8:	89 04 24             	mov    %eax,(%esp)
801011eb:	e8 e9 2b 00 00       	call   80103dd9 <pipewrite>
801011f0:	e9 f8 00 00 00       	jmp    801012ed <filewrite+0x13f>
  if(f->type == FD_INODE){
801011f5:	8b 45 08             	mov    0x8(%ebp),%eax
801011f8:	8b 00                	mov    (%eax),%eax
801011fa:	83 f8 02             	cmp    $0x2,%eax
801011fd:	0f 85 de 00 00 00    	jne    801012e1 <filewrite+0x133>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
80101203:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
    int i = 0;
8010120a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while(i < n){
80101211:	e9 a8 00 00 00       	jmp    801012be <filewrite+0x110>
      int n1 = n - i;
80101216:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101219:	8b 55 10             	mov    0x10(%ebp),%edx
8010121c:	89 d1                	mov    %edx,%ecx
8010121e:	29 c1                	sub    %eax,%ecx
80101220:	89 c8                	mov    %ecx,%eax
80101222:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(n1 > max)
80101225:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101228:	3b 45 ec             	cmp    -0x14(%ebp),%eax
8010122b:	7e 06                	jle    80101233 <filewrite+0x85>
        n1 = max;
8010122d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101230:	89 45 f4             	mov    %eax,-0xc(%ebp)

      begin_trans();
80101233:	e8 da 1f 00 00       	call   80103212 <begin_trans>
      ilock(f->ip);
80101238:	8b 45 08             	mov    0x8(%ebp),%eax
8010123b:	8b 40 10             	mov    0x10(%eax),%eax
8010123e:	89 04 24             	mov    %eax,(%esp)
80101241:	e8 35 06 00 00       	call   8010187b <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101246:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101249:	8b 45 08             	mov    0x8(%ebp),%eax
8010124c:	8b 48 14             	mov    0x14(%eax),%ecx
8010124f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101252:	89 c2                	mov    %eax,%edx
80101254:	03 55 0c             	add    0xc(%ebp),%edx
80101257:	8b 45 08             	mov    0x8(%ebp),%eax
8010125a:	8b 40 10             	mov    0x10(%eax),%eax
8010125d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80101261:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101265:	89 54 24 04          	mov    %edx,0x4(%esp)
80101269:	89 04 24             	mov    %eax,(%esp)
8010126c:	e8 6f 0c 00 00       	call   80101ee0 <writei>
80101271:	89 45 e8             	mov    %eax,-0x18(%ebp)
80101274:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80101278:	7e 11                	jle    8010128b <filewrite+0xdd>
        f->off += r;
8010127a:	8b 45 08             	mov    0x8(%ebp),%eax
8010127d:	8b 50 14             	mov    0x14(%eax),%edx
80101280:	8b 45 e8             	mov    -0x18(%ebp),%eax
80101283:	01 c2                	add    %eax,%edx
80101285:	8b 45 08             	mov    0x8(%ebp),%eax
80101288:	89 50 14             	mov    %edx,0x14(%eax)
      iunlock(f->ip);
8010128b:	8b 45 08             	mov    0x8(%ebp),%eax
8010128e:	8b 40 10             	mov    0x10(%eax),%eax
80101291:	89 04 24             	mov    %eax,(%esp)
80101294:	e8 33 07 00 00       	call   801019cc <iunlock>
      commit_trans();
80101299:	e8 bd 1f 00 00       	call   8010325b <commit_trans>

      if(r < 0)
8010129e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
801012a2:	78 28                	js     801012cc <filewrite+0x11e>
        break;
      if(r != n1)
801012a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
801012a7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801012aa:	74 0c                	je     801012b8 <filewrite+0x10a>
        panic("short filewrite");
801012ac:	c7 04 24 1f 85 10 80 	movl   $0x8010851f,(%esp)
801012b3:	e8 82 f2 ff ff       	call   8010053a <panic>
      i += r;
801012b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
801012bb:	01 45 f0             	add    %eax,-0x10(%ebp)
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
801012be:	8b 45 f0             	mov    -0x10(%ebp),%eax
801012c1:	3b 45 10             	cmp    0x10(%ebp),%eax
801012c4:	0f 8c 4c ff ff ff    	jl     80101216 <filewrite+0x68>
801012ca:	eb 01                	jmp    801012cd <filewrite+0x11f>
        f->off += r;
      iunlock(f->ip);
      commit_trans();

      if(r < 0)
        break;
801012cc:	90                   	nop
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801012cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
801012d0:	3b 45 10             	cmp    0x10(%ebp),%eax
801012d3:	75 05                	jne    801012da <filewrite+0x12c>
801012d5:	8b 45 10             	mov    0x10(%ebp),%eax
801012d8:	eb 05                	jmp    801012df <filewrite+0x131>
801012da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801012df:	eb 0c                	jmp    801012ed <filewrite+0x13f>
  }
  panic("filewrite");
801012e1:	c7 04 24 2f 85 10 80 	movl   $0x8010852f,(%esp)
801012e8:	e8 4d f2 ff ff       	call   8010053a <panic>
}
801012ed:	83 c4 24             	add    $0x24,%esp
801012f0:	5b                   	pop    %ebx
801012f1:	5d                   	pop    %ebp
801012f2:	c3                   	ret    
	...

801012f4 <readsb>:
static void itrunc(struct inode*);

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801012f4:	55                   	push   %ebp
801012f5:	89 e5                	mov    %esp,%ebp
801012f7:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  
  bp = bread(dev, 1);
801012fa:	8b 45 08             	mov    0x8(%ebp),%eax
801012fd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80101304:	00 
80101305:	89 04 24             	mov    %eax,(%esp)
80101308:	e8 9a ee ff ff       	call   801001a7 <bread>
8010130d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
80101310:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101313:	83 c0 18             	add    $0x18,%eax
80101316:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
8010131d:	00 
8010131e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101322:	8b 45 0c             	mov    0xc(%ebp),%eax
80101325:	89 04 24             	mov    %eax,(%esp)
80101328:	e8 48 3e 00 00       	call   80105175 <memmove>
  brelse(bp);
8010132d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101330:	89 04 24             	mov    %eax,(%esp)
80101333:	e8 e0 ee ff ff       	call   80100218 <brelse>
}
80101338:	c9                   	leave  
80101339:	c3                   	ret    

8010133a <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
8010133a:	55                   	push   %ebp
8010133b:	89 e5                	mov    %esp,%ebp
8010133d:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  
  bp = bread(dev, bno);
80101340:	8b 55 0c             	mov    0xc(%ebp),%edx
80101343:	8b 45 08             	mov    0x8(%ebp),%eax
80101346:	89 54 24 04          	mov    %edx,0x4(%esp)
8010134a:	89 04 24             	mov    %eax,(%esp)
8010134d:	e8 55 ee ff ff       	call   801001a7 <bread>
80101352:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
80101355:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101358:	83 c0 18             	add    $0x18,%eax
8010135b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80101362:	00 
80101363:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010136a:	00 
8010136b:	89 04 24             	mov    %eax,(%esp)
8010136e:	e8 2f 3d 00 00       	call   801050a2 <memset>
  log_write(bp);
80101373:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101376:	89 04 24             	mov    %eax,(%esp)
80101379:	e8 35 1f 00 00       	call   801032b3 <log_write>
  brelse(bp);
8010137e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101381:	89 04 24             	mov    %eax,(%esp)
80101384:	e8 8f ee ff ff       	call   80100218 <brelse>
}
80101389:	c9                   	leave  
8010138a:	c3                   	ret    

8010138b <balloc>:
// Blocks. 

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010138b:	55                   	push   %ebp
8010138c:	89 e5                	mov    %esp,%ebp
8010138e:	53                   	push   %ebx
8010138f:	83 ec 34             	sub    $0x34,%esp
  int b, bi, m;
  struct buf *bp;
  struct superblock sb;

  bp = 0;
80101392:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  readsb(dev, &sb);
80101399:	8b 45 08             	mov    0x8(%ebp),%eax
8010139c:	8d 55 d8             	lea    -0x28(%ebp),%edx
8010139f:	89 54 24 04          	mov    %edx,0x4(%esp)
801013a3:	89 04 24             	mov    %eax,(%esp)
801013a6:	e8 49 ff ff ff       	call   801012f4 <readsb>
  for(b = 0; b < sb.size; b += BPB){
801013ab:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
801013b2:	e9 15 01 00 00       	jmp    801014cc <balloc+0x141>
    bp = bread(dev, BBLOCK(b, sb.ninodes));
801013b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
801013ba:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
801013c0:	85 c0                	test   %eax,%eax
801013c2:	0f 48 c2             	cmovs  %edx,%eax
801013c5:	c1 f8 0c             	sar    $0xc,%eax
801013c8:	8b 55 e0             	mov    -0x20(%ebp),%edx
801013cb:	c1 ea 03             	shr    $0x3,%edx
801013ce:	01 d0                	add    %edx,%eax
801013d0:	83 c0 03             	add    $0x3,%eax
801013d3:	89 44 24 04          	mov    %eax,0x4(%esp)
801013d7:	8b 45 08             	mov    0x8(%ebp),%eax
801013da:	89 04 24             	mov    %eax,(%esp)
801013dd:	e8 c5 ed ff ff       	call   801001a7 <bread>
801013e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801013e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
801013ec:	e9 aa 00 00 00       	jmp    8010149b <balloc+0x110>
      m = 1 << (bi % 8);
801013f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
801013f4:	89 c2                	mov    %eax,%edx
801013f6:	c1 fa 1f             	sar    $0x1f,%edx
801013f9:	c1 ea 1d             	shr    $0x1d,%edx
801013fc:	01 d0                	add    %edx,%eax
801013fe:	83 e0 07             	and    $0x7,%eax
80101401:	29 d0                	sub    %edx,%eax
80101403:	ba 01 00 00 00       	mov    $0x1,%edx
80101408:	89 d3                	mov    %edx,%ebx
8010140a:	89 c1                	mov    %eax,%ecx
8010140c:	d3 e3                	shl    %cl,%ebx
8010140e:	89 d8                	mov    %ebx,%eax
80101410:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101413:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101416:	8d 50 07             	lea    0x7(%eax),%edx
80101419:	85 c0                	test   %eax,%eax
8010141b:	0f 48 c2             	cmovs  %edx,%eax
8010141e:	c1 f8 03             	sar    $0x3,%eax
80101421:	8b 55 f4             	mov    -0xc(%ebp),%edx
80101424:	0f b6 44 02 18       	movzbl 0x18(%edx,%eax,1),%eax
80101429:	0f b6 c0             	movzbl %al,%eax
8010142c:	23 45 f0             	and    -0x10(%ebp),%eax
8010142f:	85 c0                	test   %eax,%eax
80101431:	75 64                	jne    80101497 <balloc+0x10c>
        bp->data[bi/8] |= m;  // Mark block in use.
80101433:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101436:	8d 50 07             	lea    0x7(%eax),%edx
80101439:	85 c0                	test   %eax,%eax
8010143b:	0f 48 c2             	cmovs  %edx,%eax
8010143e:	c1 f8 03             	sar    $0x3,%eax
80101441:	89 c2                	mov    %eax,%edx
80101443:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80101446:	0f b6 44 01 18       	movzbl 0x18(%ecx,%eax,1),%eax
8010144b:	89 c1                	mov    %eax,%ecx
8010144d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101450:	09 c8                	or     %ecx,%eax
80101452:	89 c1                	mov    %eax,%ecx
80101454:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101457:	88 4c 10 18          	mov    %cl,0x18(%eax,%edx,1)
        log_write(bp);
8010145b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010145e:	89 04 24             	mov    %eax,(%esp)
80101461:	e8 4d 1e 00 00       	call   801032b3 <log_write>
        brelse(bp);
80101466:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101469:	89 04 24             	mov    %eax,(%esp)
8010146c:	e8 a7 ed ff ff       	call   80100218 <brelse>
        bzero(dev, b + bi);
80101471:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101474:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101477:	01 c2                	add    %eax,%edx
80101479:	8b 45 08             	mov    0x8(%ebp),%eax
8010147c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101480:	89 04 24             	mov    %eax,(%esp)
80101483:	e8 b2 fe ff ff       	call   8010133a <bzero>
        return b + bi;
80101488:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010148b:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010148e:	8d 04 02             	lea    (%edx,%eax,1),%eax
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
80101491:	83 c4 34             	add    $0x34,%esp
80101494:	5b                   	pop    %ebx
80101495:	5d                   	pop    %ebp
80101496:	c3                   	ret    

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb.ninodes));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101497:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
8010149b:	81 7d ec ff 0f 00 00 	cmpl   $0xfff,-0x14(%ebp)
801014a2:	7f 16                	jg     801014ba <balloc+0x12f>
801014a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
801014a7:	8b 55 e8             	mov    -0x18(%ebp),%edx
801014aa:	8d 04 02             	lea    (%edx,%eax,1),%eax
801014ad:	89 c2                	mov    %eax,%edx
801014af:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014b2:	39 c2                	cmp    %eax,%edx
801014b4:	0f 82 37 ff ff ff    	jb     801013f1 <balloc+0x66>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801014ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
801014bd:	89 04 24             	mov    %eax,(%esp)
801014c0:	e8 53 ed ff ff       	call   80100218 <brelse>
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
801014c5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
801014cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
801014cf:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014d2:	39 c2                	cmp    %eax,%edx
801014d4:	0f 82 dd fe ff ff    	jb     801013b7 <balloc+0x2c>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801014da:	c7 04 24 39 85 10 80 	movl   $0x80108539,(%esp)
801014e1:	e8 54 f0 ff ff       	call   8010053a <panic>

801014e6 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801014e6:	55                   	push   %ebp
801014e7:	89 e5                	mov    %esp,%ebp
801014e9:	53                   	push   %ebx
801014ea:	83 ec 34             	sub    $0x34,%esp
  struct buf *bp;
  struct superblock sb;
  int bi, m;

  readsb(dev, &sb);
801014ed:	8d 45 dc             	lea    -0x24(%ebp),%eax
801014f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801014f4:	8b 45 08             	mov    0x8(%ebp),%eax
801014f7:	89 04 24             	mov    %eax,(%esp)
801014fa:	e8 f5 fd ff ff       	call   801012f4 <readsb>
  bp = bread(dev, BBLOCK(b, sb.ninodes));
801014ff:	8b 45 0c             	mov    0xc(%ebp),%eax
80101502:	89 c2                	mov    %eax,%edx
80101504:	c1 ea 0c             	shr    $0xc,%edx
80101507:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010150a:	c1 e8 03             	shr    $0x3,%eax
8010150d:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101510:	8d 50 03             	lea    0x3(%eax),%edx
80101513:	8b 45 08             	mov    0x8(%ebp),%eax
80101516:	89 54 24 04          	mov    %edx,0x4(%esp)
8010151a:	89 04 24             	mov    %eax,(%esp)
8010151d:	e8 85 ec ff ff       	call   801001a7 <bread>
80101522:	89 45 ec             	mov    %eax,-0x14(%ebp)
  bi = b % BPB;
80101525:	8b 45 0c             	mov    0xc(%ebp),%eax
80101528:	25 ff 0f 00 00       	and    $0xfff,%eax
8010152d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
80101530:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101533:	89 c2                	mov    %eax,%edx
80101535:	c1 fa 1f             	sar    $0x1f,%edx
80101538:	c1 ea 1d             	shr    $0x1d,%edx
8010153b:	01 d0                	add    %edx,%eax
8010153d:	83 e0 07             	and    $0x7,%eax
80101540:	29 d0                	sub    %edx,%eax
80101542:	ba 01 00 00 00       	mov    $0x1,%edx
80101547:	89 d3                	mov    %edx,%ebx
80101549:	89 c1                	mov    %eax,%ecx
8010154b:	d3 e3                	shl    %cl,%ebx
8010154d:	89 d8                	mov    %ebx,%eax
8010154f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((bp->data[bi/8] & m) == 0)
80101552:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101555:	8d 50 07             	lea    0x7(%eax),%edx
80101558:	85 c0                	test   %eax,%eax
8010155a:	0f 48 c2             	cmovs  %edx,%eax
8010155d:	c1 f8 03             	sar    $0x3,%eax
80101560:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101563:	0f b6 44 02 18       	movzbl 0x18(%edx,%eax,1),%eax
80101568:	0f b6 c0             	movzbl %al,%eax
8010156b:	23 45 f4             	and    -0xc(%ebp),%eax
8010156e:	85 c0                	test   %eax,%eax
80101570:	75 0c                	jne    8010157e <bfree+0x98>
    panic("freeing free block");
80101572:	c7 04 24 4f 85 10 80 	movl   $0x8010854f,(%esp)
80101579:	e8 bc ef ff ff       	call   8010053a <panic>
  bp->data[bi/8] &= ~m;
8010157e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101581:	8d 50 07             	lea    0x7(%eax),%edx
80101584:	85 c0                	test   %eax,%eax
80101586:	0f 48 c2             	cmovs  %edx,%eax
80101589:	c1 f8 03             	sar    $0x3,%eax
8010158c:	89 c2                	mov    %eax,%edx
8010158e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
80101591:	0f b6 44 01 18       	movzbl 0x18(%ecx,%eax,1),%eax
80101596:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80101599:	f7 d1                	not    %ecx
8010159b:	21 c8                	and    %ecx,%eax
8010159d:	89 c1                	mov    %eax,%ecx
8010159f:	8b 45 ec             	mov    -0x14(%ebp),%eax
801015a2:	88 4c 10 18          	mov    %cl,0x18(%eax,%edx,1)
  log_write(bp);
801015a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801015a9:	89 04 24             	mov    %eax,(%esp)
801015ac:	e8 02 1d 00 00       	call   801032b3 <log_write>
  brelse(bp);
801015b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
801015b4:	89 04 24             	mov    %eax,(%esp)
801015b7:	e8 5c ec ff ff       	call   80100218 <brelse>
}
801015bc:	83 c4 34             	add    $0x34,%esp
801015bf:	5b                   	pop    %ebx
801015c0:	5d                   	pop    %ebp
801015c1:	c3                   	ret    

801015c2 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(void)
{
801015c2:	55                   	push   %ebp
801015c3:	89 e5                	mov    %esp,%ebp
801015c5:	83 ec 18             	sub    $0x18,%esp
  initlock(&icache.lock, "icache");
801015c8:	c7 44 24 04 62 85 10 	movl   $0x80108562,0x4(%esp)
801015cf:	80 
801015d0:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
801015d7:	e8 56 38 00 00       	call   80104e32 <initlock>
}
801015dc:	c9                   	leave  
801015dd:	c3                   	ret    

801015de <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801015de:	55                   	push   %ebp
801015df:	89 e5                	mov    %esp,%ebp
801015e1:	83 ec 48             	sub    $0x48,%esp
801015e4:	8b 45 0c             	mov    0xc(%ebp),%eax
801015e7:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
801015eb:	8b 45 08             	mov    0x8(%ebp),%eax
801015ee:	8d 55 dc             	lea    -0x24(%ebp),%edx
801015f1:	89 54 24 04          	mov    %edx,0x4(%esp)
801015f5:	89 04 24             	mov    %eax,(%esp)
801015f8:	e8 f7 fc ff ff       	call   801012f4 <readsb>

  for(inum = 1; inum < sb.ninodes; inum++){
801015fd:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
80101604:	e9 98 00 00 00       	jmp    801016a1 <ialloc+0xc3>
    bp = bread(dev, IBLOCK(inum));
80101609:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010160c:	c1 e8 03             	shr    $0x3,%eax
8010160f:	83 c0 02             	add    $0x2,%eax
80101612:	89 44 24 04          	mov    %eax,0x4(%esp)
80101616:	8b 45 08             	mov    0x8(%ebp),%eax
80101619:	89 04 24             	mov    %eax,(%esp)
8010161c:	e8 86 eb ff ff       	call   801001a7 <bread>
80101621:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
80101624:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101627:	83 c0 18             	add    $0x18,%eax
8010162a:	8b 55 ec             	mov    -0x14(%ebp),%edx
8010162d:	83 e2 07             	and    $0x7,%edx
80101630:	c1 e2 06             	shl    $0x6,%edx
80101633:	01 d0                	add    %edx,%eax
80101635:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(dip->type == 0){  // a free inode
80101638:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010163b:	0f b7 00             	movzwl (%eax),%eax
8010163e:	66 85 c0             	test   %ax,%ax
80101641:	75 4f                	jne    80101692 <ialloc+0xb4>
      memset(dip, 0, sizeof(*dip));
80101643:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010164a:	00 
8010164b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101652:	00 
80101653:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101656:	89 04 24             	mov    %eax,(%esp)
80101659:	e8 44 3a 00 00       	call   801050a2 <memset>
      dip->type = type;
8010165e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101661:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
80101665:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
80101668:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010166b:	89 04 24             	mov    %eax,(%esp)
8010166e:	e8 40 1c 00 00       	call   801032b3 <log_write>
      brelse(bp);
80101673:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101676:	89 04 24             	mov    %eax,(%esp)
80101679:	e8 9a eb ff ff       	call   80100218 <brelse>
      return iget(dev, inum);
8010167e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101681:	89 44 24 04          	mov    %eax,0x4(%esp)
80101685:	8b 45 08             	mov    0x8(%ebp),%eax
80101688:	89 04 24             	mov    %eax,(%esp)
8010168b:	e8 e6 00 00 00       	call   80101776 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101690:	c9                   	leave  
80101691:	c3                   	ret    
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101692:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101695:	89 04 24             	mov    %eax,(%esp)
80101698:	e8 7b eb ff ff       	call   80100218 <brelse>
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);

  for(inum = 1; inum < sb.ninodes; inum++){
8010169d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
801016a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
801016a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801016a7:	39 c2                	cmp    %eax,%edx
801016a9:	0f 82 5a ff ff ff    	jb     80101609 <ialloc+0x2b>
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801016af:	c7 04 24 69 85 10 80 	movl   $0x80108569,(%esp)
801016b6:	e8 7f ee ff ff       	call   8010053a <panic>

801016bb <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801016bb:	55                   	push   %ebp
801016bc:	89 e5                	mov    %esp,%ebp
801016be:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum));
801016c1:	8b 45 08             	mov    0x8(%ebp),%eax
801016c4:	8b 40 04             	mov    0x4(%eax),%eax
801016c7:	c1 e8 03             	shr    $0x3,%eax
801016ca:	8d 50 02             	lea    0x2(%eax),%edx
801016cd:	8b 45 08             	mov    0x8(%ebp),%eax
801016d0:	8b 00                	mov    (%eax),%eax
801016d2:	89 54 24 04          	mov    %edx,0x4(%esp)
801016d6:	89 04 24             	mov    %eax,(%esp)
801016d9:	e8 c9 ea ff ff       	call   801001a7 <bread>
801016de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801016e4:	83 c0 18             	add    $0x18,%eax
801016e7:	89 c2                	mov    %eax,%edx
801016e9:	8b 45 08             	mov    0x8(%ebp),%eax
801016ec:	8b 40 04             	mov    0x4(%eax),%eax
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 04 02             	lea    (%edx,%eax,1),%eax
801016f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip->type = ip->type;
801016fb:	8b 45 08             	mov    0x8(%ebp),%eax
801016fe:	0f b7 50 10          	movzwl 0x10(%eax),%edx
80101702:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101705:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
80101708:	8b 45 08             	mov    0x8(%ebp),%eax
8010170b:	0f b7 50 12          	movzwl 0x12(%eax),%edx
8010170f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101712:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
80101716:	8b 45 08             	mov    0x8(%ebp),%eax
80101719:	0f b7 50 14          	movzwl 0x14(%eax),%edx
8010171d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101720:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
80101724:	8b 45 08             	mov    0x8(%ebp),%eax
80101727:	0f b7 50 16          	movzwl 0x16(%eax),%edx
8010172b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010172e:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
80101732:	8b 45 08             	mov    0x8(%ebp),%eax
80101735:	8b 50 18             	mov    0x18(%eax),%edx
80101738:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010173b:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010173e:	8b 45 08             	mov    0x8(%ebp),%eax
80101741:	8d 50 1c             	lea    0x1c(%eax),%edx
80101744:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101747:	83 c0 0c             	add    $0xc,%eax
8010174a:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101751:	00 
80101752:	89 54 24 04          	mov    %edx,0x4(%esp)
80101756:	89 04 24             	mov    %eax,(%esp)
80101759:	e8 17 3a 00 00       	call   80105175 <memmove>
  log_write(bp);
8010175e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101761:	89 04 24             	mov    %eax,(%esp)
80101764:	e8 4a 1b 00 00       	call   801032b3 <log_write>
  brelse(bp);
80101769:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010176c:	89 04 24             	mov    %eax,(%esp)
8010176f:	e8 a4 ea ff ff       	call   80100218 <brelse>
}
80101774:	c9                   	leave  
80101775:	c3                   	ret    

80101776 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101776:	55                   	push   %ebp
80101777:	89 e5                	mov    %esp,%ebp
80101779:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
8010177c:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101783:	e8 cb 36 00 00       	call   80104e53 <acquire>

  // Is the inode already cached?
  empty = 0;
80101788:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010178f:	c7 45 f0 94 e8 10 80 	movl   $0x8010e894,-0x10(%ebp)
80101796:	eb 59                	jmp    801017f1 <iget+0x7b>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101798:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010179b:	8b 40 08             	mov    0x8(%eax),%eax
8010179e:	85 c0                	test   %eax,%eax
801017a0:	7e 35                	jle    801017d7 <iget+0x61>
801017a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017a5:	8b 00                	mov    (%eax),%eax
801017a7:	3b 45 08             	cmp    0x8(%ebp),%eax
801017aa:	75 2b                	jne    801017d7 <iget+0x61>
801017ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017af:	8b 40 04             	mov    0x4(%eax),%eax
801017b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
801017b5:	75 20                	jne    801017d7 <iget+0x61>
      ip->ref++;
801017b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017ba:	8b 40 08             	mov    0x8(%eax),%eax
801017bd:	8d 50 01             	lea    0x1(%eax),%edx
801017c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017c3:	89 50 08             	mov    %edx,0x8(%eax)
      release(&icache.lock);
801017c6:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
801017cd:	e8 e2 36 00 00       	call   80104eb4 <release>
      return ip;
801017d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017d5:	eb 70                	jmp    80101847 <iget+0xd1>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801017d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801017db:	75 10                	jne    801017ed <iget+0x77>
801017dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017e0:	8b 40 08             	mov    0x8(%eax),%eax
801017e3:	85 c0                	test   %eax,%eax
801017e5:	75 06                	jne    801017ed <iget+0x77>
      empty = ip;
801017e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017ea:	89 45 f4             	mov    %eax,-0xc(%ebp)

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801017ed:	83 45 f0 50          	addl   $0x50,-0x10(%ebp)
801017f1:	b8 34 f8 10 80       	mov    $0x8010f834,%eax
801017f6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
801017f9:	72 9d                	jb     80101798 <iget+0x22>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801017fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801017ff:	75 0c                	jne    8010180d <iget+0x97>
    panic("iget: no inodes");
80101801:	c7 04 24 7b 85 10 80 	movl   $0x8010857b,(%esp)
80101808:	e8 2d ed ff ff       	call   8010053a <panic>

  ip = empty;
8010180d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101810:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ip->dev = dev;
80101813:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101816:	8b 55 08             	mov    0x8(%ebp),%edx
80101819:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
8010181b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010181e:	8b 55 0c             	mov    0xc(%ebp),%edx
80101821:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
80101824:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101827:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->flags = 0;
8010182e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101831:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  release(&icache.lock);
80101838:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
8010183f:	e8 70 36 00 00       	call   80104eb4 <release>

  return ip;
80101844:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80101847:	c9                   	leave  
80101848:	c3                   	ret    

80101849 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101849:	55                   	push   %ebp
8010184a:	89 e5                	mov    %esp,%ebp
8010184c:	83 ec 18             	sub    $0x18,%esp
  acquire(&icache.lock);
8010184f:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101856:	e8 f8 35 00 00       	call   80104e53 <acquire>
  ip->ref++;
8010185b:	8b 45 08             	mov    0x8(%ebp),%eax
8010185e:	8b 40 08             	mov    0x8(%eax),%eax
80101861:	8d 50 01             	lea    0x1(%eax),%edx
80101864:	8b 45 08             	mov    0x8(%ebp),%eax
80101867:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
8010186a:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101871:	e8 3e 36 00 00       	call   80104eb4 <release>
  return ip;
80101876:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101879:	c9                   	leave  
8010187a:	c3                   	ret    

8010187b <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
8010187b:	55                   	push   %ebp
8010187c:	89 e5                	mov    %esp,%ebp
8010187e:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101881:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80101885:	74 0a                	je     80101891 <ilock+0x16>
80101887:	8b 45 08             	mov    0x8(%ebp),%eax
8010188a:	8b 40 08             	mov    0x8(%eax),%eax
8010188d:	85 c0                	test   %eax,%eax
8010188f:	7f 0c                	jg     8010189d <ilock+0x22>
    panic("ilock");
80101891:	c7 04 24 8b 85 10 80 	movl   $0x8010858b,(%esp)
80101898:	e8 9d ec ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
8010189d:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
801018a4:	e8 aa 35 00 00       	call   80104e53 <acquire>
  while(ip->flags & I_BUSY)
801018a9:	eb 13                	jmp    801018be <ilock+0x43>
    sleep(ip, &icache.lock);
801018ab:	c7 44 24 04 60 e8 10 	movl   $0x8010e860,0x4(%esp)
801018b2:	80 
801018b3:	8b 45 08             	mov    0x8(%ebp),%eax
801018b6:	89 04 24             	mov    %eax,(%esp)
801018b9:	e8 bb 32 00 00       	call   80104b79 <sleep>

  if(ip == 0 || ip->ref < 1)
    panic("ilock");

  acquire(&icache.lock);
  while(ip->flags & I_BUSY)
801018be:	8b 45 08             	mov    0x8(%ebp),%eax
801018c1:	8b 40 0c             	mov    0xc(%eax),%eax
801018c4:	83 e0 01             	and    $0x1,%eax
801018c7:	84 c0                	test   %al,%al
801018c9:	75 e0                	jne    801018ab <ilock+0x30>
    sleep(ip, &icache.lock);
  ip->flags |= I_BUSY;
801018cb:	8b 45 08             	mov    0x8(%ebp),%eax
801018ce:	8b 40 0c             	mov    0xc(%eax),%eax
801018d1:	89 c2                	mov    %eax,%edx
801018d3:	83 ca 01             	or     $0x1,%edx
801018d6:	8b 45 08             	mov    0x8(%ebp),%eax
801018d9:	89 50 0c             	mov    %edx,0xc(%eax)
  release(&icache.lock);
801018dc:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
801018e3:	e8 cc 35 00 00       	call   80104eb4 <release>

  if(!(ip->flags & I_VALID)){
801018e8:	8b 45 08             	mov    0x8(%ebp),%eax
801018eb:	8b 40 0c             	mov    0xc(%eax),%eax
801018ee:	83 e0 02             	and    $0x2,%eax
801018f1:	85 c0                	test   %eax,%eax
801018f3:	0f 85 d1 00 00 00    	jne    801019ca <ilock+0x14f>
    bp = bread(ip->dev, IBLOCK(ip->inum));
801018f9:	8b 45 08             	mov    0x8(%ebp),%eax
801018fc:	8b 40 04             	mov    0x4(%eax),%eax
801018ff:	c1 e8 03             	shr    $0x3,%eax
80101902:	8d 50 02             	lea    0x2(%eax),%edx
80101905:	8b 45 08             	mov    0x8(%ebp),%eax
80101908:	8b 00                	mov    (%eax),%eax
8010190a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010190e:	89 04 24             	mov    %eax,(%esp)
80101911:	e8 91 e8 ff ff       	call   801001a7 <bread>
80101916:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101919:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010191c:	83 c0 18             	add    $0x18,%eax
8010191f:	89 c2                	mov    %eax,%edx
80101921:	8b 45 08             	mov    0x8(%ebp),%eax
80101924:	8b 40 04             	mov    0x4(%eax),%eax
80101927:	83 e0 07             	and    $0x7,%eax
8010192a:	c1 e0 06             	shl    $0x6,%eax
8010192d:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101930:	89 45 f4             	mov    %eax,-0xc(%ebp)
    ip->type = dip->type;
80101933:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101936:	0f b7 10             	movzwl (%eax),%edx
80101939:	8b 45 08             	mov    0x8(%ebp),%eax
8010193c:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
80101940:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101943:	0f b7 50 02          	movzwl 0x2(%eax),%edx
80101947:	8b 45 08             	mov    0x8(%ebp),%eax
8010194a:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
8010194e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101951:	0f b7 50 04          	movzwl 0x4(%eax),%edx
80101955:	8b 45 08             	mov    0x8(%ebp),%eax
80101958:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
8010195c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010195f:	0f b7 50 06          	movzwl 0x6(%eax),%edx
80101963:	8b 45 08             	mov    0x8(%ebp),%eax
80101966:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
8010196a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010196d:	8b 50 08             	mov    0x8(%eax),%edx
80101970:	8b 45 08             	mov    0x8(%ebp),%eax
80101973:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101976:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101979:	8d 50 0c             	lea    0xc(%eax),%edx
8010197c:	8b 45 08             	mov    0x8(%ebp),%eax
8010197f:	83 c0 1c             	add    $0x1c,%eax
80101982:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101989:	00 
8010198a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010198e:	89 04 24             	mov    %eax,(%esp)
80101991:	e8 df 37 00 00       	call   80105175 <memmove>
    brelse(bp);
80101996:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101999:	89 04 24             	mov    %eax,(%esp)
8010199c:	e8 77 e8 ff ff       	call   80100218 <brelse>
    ip->flags |= I_VALID;
801019a1:	8b 45 08             	mov    0x8(%ebp),%eax
801019a4:	8b 40 0c             	mov    0xc(%eax),%eax
801019a7:	89 c2                	mov    %eax,%edx
801019a9:	83 ca 02             	or     $0x2,%edx
801019ac:	8b 45 08             	mov    0x8(%ebp),%eax
801019af:	89 50 0c             	mov    %edx,0xc(%eax)
    if(ip->type == 0)
801019b2:	8b 45 08             	mov    0x8(%ebp),%eax
801019b5:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801019b9:	66 85 c0             	test   %ax,%ax
801019bc:	75 0c                	jne    801019ca <ilock+0x14f>
      panic("ilock: no type");
801019be:	c7 04 24 91 85 10 80 	movl   $0x80108591,(%esp)
801019c5:	e8 70 eb ff ff       	call   8010053a <panic>
  }
}
801019ca:	c9                   	leave  
801019cb:	c3                   	ret    

801019cc <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
801019cc:	55                   	push   %ebp
801019cd:	89 e5                	mov    %esp,%ebp
801019cf:	83 ec 18             	sub    $0x18,%esp
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
801019d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801019d6:	74 17                	je     801019ef <iunlock+0x23>
801019d8:	8b 45 08             	mov    0x8(%ebp),%eax
801019db:	8b 40 0c             	mov    0xc(%eax),%eax
801019de:	83 e0 01             	and    $0x1,%eax
801019e1:	85 c0                	test   %eax,%eax
801019e3:	74 0a                	je     801019ef <iunlock+0x23>
801019e5:	8b 45 08             	mov    0x8(%ebp),%eax
801019e8:	8b 40 08             	mov    0x8(%eax),%eax
801019eb:	85 c0                	test   %eax,%eax
801019ed:	7f 0c                	jg     801019fb <iunlock+0x2f>
    panic("iunlock");
801019ef:	c7 04 24 a0 85 10 80 	movl   $0x801085a0,(%esp)
801019f6:	e8 3f eb ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
801019fb:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101a02:	e8 4c 34 00 00       	call   80104e53 <acquire>
  ip->flags &= ~I_BUSY;
80101a07:	8b 45 08             	mov    0x8(%ebp),%eax
80101a0a:	8b 40 0c             	mov    0xc(%eax),%eax
80101a0d:	89 c2                	mov    %eax,%edx
80101a0f:	83 e2 fe             	and    $0xfffffffe,%edx
80101a12:	8b 45 08             	mov    0x8(%ebp),%eax
80101a15:	89 50 0c             	mov    %edx,0xc(%eax)
  wakeup(ip);
80101a18:	8b 45 08             	mov    0x8(%ebp),%eax
80101a1b:	89 04 24             	mov    %eax,(%esp)
80101a1e:	e8 33 32 00 00       	call   80104c56 <wakeup>
  release(&icache.lock);
80101a23:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101a2a:	e8 85 34 00 00       	call   80104eb4 <release>
}
80101a2f:	c9                   	leave  
80101a30:	c3                   	ret    

80101a31 <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
80101a31:	55                   	push   %ebp
80101a32:	89 e5                	mov    %esp,%ebp
80101a34:	83 ec 18             	sub    $0x18,%esp
  acquire(&icache.lock);
80101a37:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101a3e:	e8 10 34 00 00       	call   80104e53 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101a43:	8b 45 08             	mov    0x8(%ebp),%eax
80101a46:	8b 40 08             	mov    0x8(%eax),%eax
80101a49:	83 f8 01             	cmp    $0x1,%eax
80101a4c:	0f 85 93 00 00 00    	jne    80101ae5 <iput+0xb4>
80101a52:	8b 45 08             	mov    0x8(%ebp),%eax
80101a55:	8b 40 0c             	mov    0xc(%eax),%eax
80101a58:	83 e0 02             	and    $0x2,%eax
80101a5b:	85 c0                	test   %eax,%eax
80101a5d:	0f 84 82 00 00 00    	je     80101ae5 <iput+0xb4>
80101a63:	8b 45 08             	mov    0x8(%ebp),%eax
80101a66:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80101a6a:	66 85 c0             	test   %ax,%ax
80101a6d:	75 76                	jne    80101ae5 <iput+0xb4>
    // inode has no links: truncate and free inode.
    if(ip->flags & I_BUSY)
80101a6f:	8b 45 08             	mov    0x8(%ebp),%eax
80101a72:	8b 40 0c             	mov    0xc(%eax),%eax
80101a75:	83 e0 01             	and    $0x1,%eax
80101a78:	84 c0                	test   %al,%al
80101a7a:	74 0c                	je     80101a88 <iput+0x57>
      panic("iput busy");
80101a7c:	c7 04 24 a8 85 10 80 	movl   $0x801085a8,(%esp)
80101a83:	e8 b2 ea ff ff       	call   8010053a <panic>
    ip->flags |= I_BUSY;
80101a88:	8b 45 08             	mov    0x8(%ebp),%eax
80101a8b:	8b 40 0c             	mov    0xc(%eax),%eax
80101a8e:	89 c2                	mov    %eax,%edx
80101a90:	83 ca 01             	or     $0x1,%edx
80101a93:	8b 45 08             	mov    0x8(%ebp),%eax
80101a96:	89 50 0c             	mov    %edx,0xc(%eax)
    release(&icache.lock);
80101a99:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101aa0:	e8 0f 34 00 00       	call   80104eb4 <release>
    itrunc(ip);
80101aa5:	8b 45 08             	mov    0x8(%ebp),%eax
80101aa8:	89 04 24             	mov    %eax,(%esp)
80101aab:	e8 72 01 00 00       	call   80101c22 <itrunc>
    ip->type = 0;
80101ab0:	8b 45 08             	mov    0x8(%ebp),%eax
80101ab3:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
    iupdate(ip);
80101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
80101abc:	89 04 24             	mov    %eax,(%esp)
80101abf:	e8 f7 fb ff ff       	call   801016bb <iupdate>
    acquire(&icache.lock);
80101ac4:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101acb:	e8 83 33 00 00       	call   80104e53 <acquire>
    ip->flags = 0;
80101ad0:	8b 45 08             	mov    0x8(%ebp),%eax
80101ad3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    wakeup(ip);
80101ada:	8b 45 08             	mov    0x8(%ebp),%eax
80101add:	89 04 24             	mov    %eax,(%esp)
80101ae0:	e8 71 31 00 00       	call   80104c56 <wakeup>
  }
  ip->ref--;
80101ae5:	8b 45 08             	mov    0x8(%ebp),%eax
80101ae8:	8b 40 08             	mov    0x8(%eax),%eax
80101aeb:	8d 50 ff             	lea    -0x1(%eax),%edx
80101aee:	8b 45 08             	mov    0x8(%ebp),%eax
80101af1:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
80101af4:	c7 04 24 60 e8 10 80 	movl   $0x8010e860,(%esp)
80101afb:	e8 b4 33 00 00       	call   80104eb4 <release>
}
80101b00:	c9                   	leave  
80101b01:	c3                   	ret    

80101b02 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101b02:	55                   	push   %ebp
80101b03:	89 e5                	mov    %esp,%ebp
80101b05:	83 ec 18             	sub    $0x18,%esp
  iunlock(ip);
80101b08:	8b 45 08             	mov    0x8(%ebp),%eax
80101b0b:	89 04 24             	mov    %eax,(%esp)
80101b0e:	e8 b9 fe ff ff       	call   801019cc <iunlock>
  iput(ip);
80101b13:	8b 45 08             	mov    0x8(%ebp),%eax
80101b16:	89 04 24             	mov    %eax,(%esp)
80101b19:	e8 13 ff ff ff       	call   80101a31 <iput>
}
80101b1e:	c9                   	leave  
80101b1f:	c3                   	ret    

80101b20 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101b20:	55                   	push   %ebp
80101b21:	89 e5                	mov    %esp,%ebp
80101b23:	53                   	push   %ebx
80101b24:	83 ec 24             	sub    $0x24,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
80101b27:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
80101b2b:	77 3e                	ja     80101b6b <bmap+0x4b>
    if((addr = ip->addrs[bn]) == 0)
80101b2d:	8b 55 0c             	mov    0xc(%ebp),%edx
80101b30:	8b 45 08             	mov    0x8(%ebp),%eax
80101b33:	83 c2 04             	add    $0x4,%edx
80101b36:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101b3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b3d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101b41:	75 20                	jne    80101b63 <bmap+0x43>
      ip->addrs[bn] = addr = balloc(ip->dev);
80101b43:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80101b46:	8b 45 08             	mov    0x8(%ebp),%eax
80101b49:	8b 00                	mov    (%eax),%eax
80101b4b:	89 04 24             	mov    %eax,(%esp)
80101b4e:	e8 38 f8 ff ff       	call   8010138b <balloc>
80101b53:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b56:	8b 45 08             	mov    0x8(%ebp),%eax
80101b59:	8d 4b 04             	lea    0x4(%ebx),%ecx
80101b5c:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101b5f:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
80101b63:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101b66:	e9 b1 00 00 00       	jmp    80101c1c <bmap+0xfc>
  }
  bn -= NDIRECT;
80101b6b:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
80101b6f:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
80101b73:	0f 87 97 00 00 00    	ja     80101c10 <bmap+0xf0>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101b79:	8b 45 08             	mov    0x8(%ebp),%eax
80101b7c:	8b 40 4c             	mov    0x4c(%eax),%eax
80101b7f:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b82:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101b86:	75 19                	jne    80101ba1 <bmap+0x81>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101b88:	8b 45 08             	mov    0x8(%ebp),%eax
80101b8b:	8b 00                	mov    (%eax),%eax
80101b8d:	89 04 24             	mov    %eax,(%esp)
80101b90:	e8 f6 f7 ff ff       	call   8010138b <balloc>
80101b95:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b98:	8b 45 08             	mov    0x8(%ebp),%eax
80101b9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101b9e:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread(ip->dev, addr);
80101ba1:	8b 45 08             	mov    0x8(%ebp),%eax
80101ba4:	8b 00                	mov    (%eax),%eax
80101ba6:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101ba9:	89 54 24 04          	mov    %edx,0x4(%esp)
80101bad:	89 04 24             	mov    %eax,(%esp)
80101bb0:	e8 f2 e5 ff ff       	call   801001a7 <bread>
80101bb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    a = (uint*)bp->data;
80101bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101bbb:	83 c0 18             	add    $0x18,%eax
80101bbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((addr = a[bn]) == 0){
80101bc1:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bc4:	c1 e0 02             	shl    $0x2,%eax
80101bc7:	03 45 f0             	add    -0x10(%ebp),%eax
80101bca:	8b 00                	mov    (%eax),%eax
80101bcc:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101bcf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101bd3:	75 2b                	jne    80101c00 <bmap+0xe0>
      a[bn] = addr = balloc(ip->dev);
80101bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bd8:	c1 e0 02             	shl    $0x2,%eax
80101bdb:	89 c3                	mov    %eax,%ebx
80101bdd:	03 5d f0             	add    -0x10(%ebp),%ebx
80101be0:	8b 45 08             	mov    0x8(%ebp),%eax
80101be3:	8b 00                	mov    (%eax),%eax
80101be5:	89 04 24             	mov    %eax,(%esp)
80101be8:	e8 9e f7 ff ff       	call   8010138b <balloc>
80101bed:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101bf0:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101bf3:	89 03                	mov    %eax,(%ebx)
      log_write(bp);
80101bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101bf8:	89 04 24             	mov    %eax,(%esp)
80101bfb:	e8 b3 16 00 00       	call   801032b3 <log_write>
    }
    brelse(bp);
80101c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101c03:	89 04 24             	mov    %eax,(%esp)
80101c06:	e8 0d e6 ff ff       	call   80100218 <brelse>
    return addr;
80101c0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101c0e:	eb 0c                	jmp    80101c1c <bmap+0xfc>
  }

  panic("bmap: out of range");
80101c10:	c7 04 24 b2 85 10 80 	movl   $0x801085b2,(%esp)
80101c17:	e8 1e e9 ff ff       	call   8010053a <panic>
}
80101c1c:	83 c4 24             	add    $0x24,%esp
80101c1f:	5b                   	pop    %ebx
80101c20:	5d                   	pop    %ebp
80101c21:	c3                   	ret    

80101c22 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
80101c22:	55                   	push   %ebp
80101c23:	89 e5                	mov    %esp,%ebp
80101c25:	83 ec 28             	sub    $0x28,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101c28:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80101c2f:	eb 44                	jmp    80101c75 <itrunc+0x53>
    if(ip->addrs[i]){
80101c31:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c34:	8b 45 08             	mov    0x8(%ebp),%eax
80101c37:	83 c2 04             	add    $0x4,%edx
80101c3a:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101c3e:	85 c0                	test   %eax,%eax
80101c40:	74 2f                	je     80101c71 <itrunc+0x4f>
      bfree(ip->dev, ip->addrs[i]);
80101c42:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c45:	8b 45 08             	mov    0x8(%ebp),%eax
80101c48:	83 c2 04             	add    $0x4,%edx
80101c4b:	8b 54 90 0c          	mov    0xc(%eax,%edx,4),%edx
80101c4f:	8b 45 08             	mov    0x8(%ebp),%eax
80101c52:	8b 00                	mov    (%eax),%eax
80101c54:	89 54 24 04          	mov    %edx,0x4(%esp)
80101c58:	89 04 24             	mov    %eax,(%esp)
80101c5b:	e8 86 f8 ff ff       	call   801014e6 <bfree>
      ip->addrs[i] = 0;
80101c60:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c63:	8b 45 08             	mov    0x8(%ebp),%eax
80101c66:	83 c2 04             	add    $0x4,%edx
80101c69:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
80101c70:	00 
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101c71:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
80101c75:	83 7d e8 0b          	cmpl   $0xb,-0x18(%ebp)
80101c79:	7e b6                	jle    80101c31 <itrunc+0xf>
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
80101c7b:	8b 45 08             	mov    0x8(%ebp),%eax
80101c7e:	8b 40 4c             	mov    0x4c(%eax),%eax
80101c81:	85 c0                	test   %eax,%eax
80101c83:	0f 84 8f 00 00 00    	je     80101d18 <itrunc+0xf6>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101c89:	8b 45 08             	mov    0x8(%ebp),%eax
80101c8c:	8b 50 4c             	mov    0x4c(%eax),%edx
80101c8f:	8b 45 08             	mov    0x8(%ebp),%eax
80101c92:	8b 00                	mov    (%eax),%eax
80101c94:	89 54 24 04          	mov    %edx,0x4(%esp)
80101c98:	89 04 24             	mov    %eax,(%esp)
80101c9b:	e8 07 e5 ff ff       	call   801001a7 <bread>
80101ca0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
80101ca3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ca6:	83 c0 18             	add    $0x18,%eax
80101ca9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(j = 0; j < NINDIRECT; j++){
80101cac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101cb3:	eb 2f                	jmp    80101ce4 <itrunc+0xc2>
      if(a[j])
80101cb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101cb8:	c1 e0 02             	shl    $0x2,%eax
80101cbb:	03 45 f4             	add    -0xc(%ebp),%eax
80101cbe:	8b 00                	mov    (%eax),%eax
80101cc0:	85 c0                	test   %eax,%eax
80101cc2:	74 1c                	je     80101ce0 <itrunc+0xbe>
        bfree(ip->dev, a[j]);
80101cc4:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101cc7:	c1 e0 02             	shl    $0x2,%eax
80101cca:	03 45 f4             	add    -0xc(%ebp),%eax
80101ccd:	8b 10                	mov    (%eax),%edx
80101ccf:	8b 45 08             	mov    0x8(%ebp),%eax
80101cd2:	8b 00                	mov    (%eax),%eax
80101cd4:	89 54 24 04          	mov    %edx,0x4(%esp)
80101cd8:	89 04 24             	mov    %eax,(%esp)
80101cdb:	e8 06 f8 ff ff       	call   801014e6 <bfree>
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
80101ce0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80101ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101ce7:	83 f8 7f             	cmp    $0x7f,%eax
80101cea:	76 c9                	jbe    80101cb5 <itrunc+0x93>
      if(a[j])
        bfree(ip->dev, a[j]);
    }
    brelse(bp);
80101cec:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101cef:	89 04 24             	mov    %eax,(%esp)
80101cf2:	e8 21 e5 ff ff       	call   80100218 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101cf7:	8b 45 08             	mov    0x8(%ebp),%eax
80101cfa:	8b 50 4c             	mov    0x4c(%eax),%edx
80101cfd:	8b 45 08             	mov    0x8(%ebp),%eax
80101d00:	8b 00                	mov    (%eax),%eax
80101d02:	89 54 24 04          	mov    %edx,0x4(%esp)
80101d06:	89 04 24             	mov    %eax,(%esp)
80101d09:	e8 d8 f7 ff ff       	call   801014e6 <bfree>
    ip->addrs[NDIRECT] = 0;
80101d0e:	8b 45 08             	mov    0x8(%ebp),%eax
80101d11:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
80101d18:	8b 45 08             	mov    0x8(%ebp),%eax
80101d1b:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
80101d22:	8b 45 08             	mov    0x8(%ebp),%eax
80101d25:	89 04 24             	mov    %eax,(%esp)
80101d28:	e8 8e f9 ff ff       	call   801016bb <iupdate>
}
80101d2d:	c9                   	leave  
80101d2e:	c3                   	ret    

80101d2f <stati>:

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101d2f:	55                   	push   %ebp
80101d30:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
80101d32:	8b 45 08             	mov    0x8(%ebp),%eax
80101d35:	8b 00                	mov    (%eax),%eax
80101d37:	89 c2                	mov    %eax,%edx
80101d39:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d3c:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
80101d3f:	8b 45 08             	mov    0x8(%ebp),%eax
80101d42:	8b 50 04             	mov    0x4(%eax),%edx
80101d45:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d48:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
80101d4b:	8b 45 08             	mov    0x8(%ebp),%eax
80101d4e:	0f b7 50 10          	movzwl 0x10(%eax),%edx
80101d52:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d55:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
80101d58:	8b 45 08             	mov    0x8(%ebp),%eax
80101d5b:	0f b7 50 16          	movzwl 0x16(%eax),%edx
80101d5f:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d62:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
80101d66:	8b 45 08             	mov    0x8(%ebp),%eax
80101d69:	8b 50 18             	mov    0x18(%eax),%edx
80101d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d6f:	89 50 10             	mov    %edx,0x10(%eax)
}
80101d72:	5d                   	pop    %ebp
80101d73:	c3                   	ret    

80101d74 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101d74:	55                   	push   %ebp
80101d75:	89 e5                	mov    %esp,%ebp
80101d77:	53                   	push   %ebx
80101d78:	83 ec 24             	sub    $0x24,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101d7b:	8b 45 08             	mov    0x8(%ebp),%eax
80101d7e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101d82:	66 83 f8 03          	cmp    $0x3,%ax
80101d86:	75 60                	jne    80101de8 <readi+0x74>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101d88:	8b 45 08             	mov    0x8(%ebp),%eax
80101d8b:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101d8f:	66 85 c0             	test   %ax,%ax
80101d92:	78 20                	js     80101db4 <readi+0x40>
80101d94:	8b 45 08             	mov    0x8(%ebp),%eax
80101d97:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101d9b:	66 83 f8 09          	cmp    $0x9,%ax
80101d9f:	7f 13                	jg     80101db4 <readi+0x40>
80101da1:	8b 45 08             	mov    0x8(%ebp),%eax
80101da4:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101da8:	98                   	cwtl   
80101da9:	8b 04 c5 00 e8 10 80 	mov    -0x7fef1800(,%eax,8),%eax
80101db0:	85 c0                	test   %eax,%eax
80101db2:	75 0a                	jne    80101dbe <readi+0x4a>
      return -1;
80101db4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101db9:	e9 1c 01 00 00       	jmp    80101eda <readi+0x166>
    return devsw[ip->major].read(ip, dst, n);
80101dbe:	8b 45 08             	mov    0x8(%ebp),%eax
80101dc1:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101dc5:	98                   	cwtl   
80101dc6:	8b 14 c5 00 e8 10 80 	mov    -0x7fef1800(,%eax,8),%edx
80101dcd:	8b 45 14             	mov    0x14(%ebp),%eax
80101dd0:	89 44 24 08          	mov    %eax,0x8(%esp)
80101dd4:	8b 45 0c             	mov    0xc(%ebp),%eax
80101dd7:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ddb:	8b 45 08             	mov    0x8(%ebp),%eax
80101dde:	89 04 24             	mov    %eax,(%esp)
80101de1:	ff d2                	call   *%edx
80101de3:	e9 f2 00 00 00       	jmp    80101eda <readi+0x166>
  }

  if(off > ip->size || off + n < off)
80101de8:	8b 45 08             	mov    0x8(%ebp),%eax
80101deb:	8b 40 18             	mov    0x18(%eax),%eax
80101dee:	3b 45 10             	cmp    0x10(%ebp),%eax
80101df1:	72 0e                	jb     80101e01 <readi+0x8d>
80101df3:	8b 45 14             	mov    0x14(%ebp),%eax
80101df6:	8b 55 10             	mov    0x10(%ebp),%edx
80101df9:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101dfc:	3b 45 10             	cmp    0x10(%ebp),%eax
80101dff:	73 0a                	jae    80101e0b <readi+0x97>
    return -1;
80101e01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e06:	e9 cf 00 00 00       	jmp    80101eda <readi+0x166>
  if(off + n > ip->size)
80101e0b:	8b 45 14             	mov    0x14(%ebp),%eax
80101e0e:	8b 55 10             	mov    0x10(%ebp),%edx
80101e11:	01 c2                	add    %eax,%edx
80101e13:	8b 45 08             	mov    0x8(%ebp),%eax
80101e16:	8b 40 18             	mov    0x18(%eax),%eax
80101e19:	39 c2                	cmp    %eax,%edx
80101e1b:	76 0c                	jbe    80101e29 <readi+0xb5>
    n = ip->size - off;
80101e1d:	8b 45 08             	mov    0x8(%ebp),%eax
80101e20:	8b 40 18             	mov    0x18(%eax),%eax
80101e23:	2b 45 10             	sub    0x10(%ebp),%eax
80101e26:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101e29:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101e30:	e9 96 00 00 00       	jmp    80101ecb <readi+0x157>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101e35:	8b 45 10             	mov    0x10(%ebp),%eax
80101e38:	c1 e8 09             	shr    $0x9,%eax
80101e3b:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e3f:	8b 45 08             	mov    0x8(%ebp),%eax
80101e42:	89 04 24             	mov    %eax,(%esp)
80101e45:	e8 d6 fc ff ff       	call   80101b20 <bmap>
80101e4a:	8b 55 08             	mov    0x8(%ebp),%edx
80101e4d:	8b 12                	mov    (%edx),%edx
80101e4f:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e53:	89 14 24             	mov    %edx,(%esp)
80101e56:	e8 4c e3 ff ff       	call   801001a7 <bread>
80101e5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101e5e:	8b 45 10             	mov    0x10(%ebp),%eax
80101e61:	89 c2                	mov    %eax,%edx
80101e63:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80101e69:	b8 00 02 00 00       	mov    $0x200,%eax
80101e6e:	89 c1                	mov    %eax,%ecx
80101e70:	29 d1                	sub    %edx,%ecx
80101e72:	89 ca                	mov    %ecx,%edx
80101e74:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101e77:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101e7a:	89 cb                	mov    %ecx,%ebx
80101e7c:	29 c3                	sub    %eax,%ebx
80101e7e:	89 d8                	mov    %ebx,%eax
80101e80:	39 c2                	cmp    %eax,%edx
80101e82:	0f 46 c2             	cmovbe %edx,%eax
80101e85:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
80101e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101e8b:	8d 50 18             	lea    0x18(%eax),%edx
80101e8e:	8b 45 10             	mov    0x10(%ebp),%eax
80101e91:	25 ff 01 00 00       	and    $0x1ff,%eax
80101e96:	01 c2                	add    %eax,%edx
80101e98:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101e9b:	89 44 24 08          	mov    %eax,0x8(%esp)
80101e9f:	89 54 24 04          	mov    %edx,0x4(%esp)
80101ea3:	8b 45 0c             	mov    0xc(%ebp),%eax
80101ea6:	89 04 24             	mov    %eax,(%esp)
80101ea9:	e8 c7 32 00 00       	call   80105175 <memmove>
    brelse(bp);
80101eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101eb1:	89 04 24             	mov    %eax,(%esp)
80101eb4:	e8 5f e3 ff ff       	call   80100218 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ebc:	01 45 ec             	add    %eax,-0x14(%ebp)
80101ebf:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ec2:	01 45 10             	add    %eax,0x10(%ebp)
80101ec5:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ec8:	01 45 0c             	add    %eax,0xc(%ebp)
80101ecb:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101ece:	3b 45 14             	cmp    0x14(%ebp),%eax
80101ed1:	0f 82 5e ff ff ff    	jb     80101e35 <readi+0xc1>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101ed7:	8b 45 14             	mov    0x14(%ebp),%eax
}
80101eda:	83 c4 24             	add    $0x24,%esp
80101edd:	5b                   	pop    %ebx
80101ede:	5d                   	pop    %ebp
80101edf:	c3                   	ret    

80101ee0 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101ee0:	55                   	push   %ebp
80101ee1:	89 e5                	mov    %esp,%ebp
80101ee3:	53                   	push   %ebx
80101ee4:	83 ec 24             	sub    $0x24,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ee7:	8b 45 08             	mov    0x8(%ebp),%eax
80101eea:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101eee:	66 83 f8 03          	cmp    $0x3,%ax
80101ef2:	75 60                	jne    80101f54 <writei+0x74>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101ef4:	8b 45 08             	mov    0x8(%ebp),%eax
80101ef7:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101efb:	66 85 c0             	test   %ax,%ax
80101efe:	78 20                	js     80101f20 <writei+0x40>
80101f00:	8b 45 08             	mov    0x8(%ebp),%eax
80101f03:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101f07:	66 83 f8 09          	cmp    $0x9,%ax
80101f0b:	7f 13                	jg     80101f20 <writei+0x40>
80101f0d:	8b 45 08             	mov    0x8(%ebp),%eax
80101f10:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101f14:	98                   	cwtl   
80101f15:	8b 04 c5 04 e8 10 80 	mov    -0x7fef17fc(,%eax,8),%eax
80101f1c:	85 c0                	test   %eax,%eax
80101f1e:	75 0a                	jne    80101f2a <writei+0x4a>
      return -1;
80101f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f25:	e9 48 01 00 00       	jmp    80102072 <writei+0x192>
    return devsw[ip->major].write(ip, src, n);
80101f2a:	8b 45 08             	mov    0x8(%ebp),%eax
80101f2d:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101f31:	98                   	cwtl   
80101f32:	8b 14 c5 04 e8 10 80 	mov    -0x7fef17fc(,%eax,8),%edx
80101f39:	8b 45 14             	mov    0x14(%ebp),%eax
80101f3c:	89 44 24 08          	mov    %eax,0x8(%esp)
80101f40:	8b 45 0c             	mov    0xc(%ebp),%eax
80101f43:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f47:	8b 45 08             	mov    0x8(%ebp),%eax
80101f4a:	89 04 24             	mov    %eax,(%esp)
80101f4d:	ff d2                	call   *%edx
80101f4f:	e9 1e 01 00 00       	jmp    80102072 <writei+0x192>
  }

  if(off > ip->size || off + n < off)
80101f54:	8b 45 08             	mov    0x8(%ebp),%eax
80101f57:	8b 40 18             	mov    0x18(%eax),%eax
80101f5a:	3b 45 10             	cmp    0x10(%ebp),%eax
80101f5d:	72 0e                	jb     80101f6d <writei+0x8d>
80101f5f:	8b 45 14             	mov    0x14(%ebp),%eax
80101f62:	8b 55 10             	mov    0x10(%ebp),%edx
80101f65:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101f68:	3b 45 10             	cmp    0x10(%ebp),%eax
80101f6b:	73 0a                	jae    80101f77 <writei+0x97>
    return -1;
80101f6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f72:	e9 fb 00 00 00       	jmp    80102072 <writei+0x192>
  if(off + n > MAXFILE*BSIZE)
80101f77:	8b 45 14             	mov    0x14(%ebp),%eax
80101f7a:	8b 55 10             	mov    0x10(%ebp),%edx
80101f7d:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101f80:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101f85:	76 0a                	jbe    80101f91 <writei+0xb1>
    return -1;
80101f87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f8c:	e9 e1 00 00 00       	jmp    80102072 <writei+0x192>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101f91:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101f98:	e9 a1 00 00 00       	jmp    8010203e <writei+0x15e>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101f9d:	8b 45 10             	mov    0x10(%ebp),%eax
80101fa0:	c1 e8 09             	shr    $0x9,%eax
80101fa3:	89 44 24 04          	mov    %eax,0x4(%esp)
80101fa7:	8b 45 08             	mov    0x8(%ebp),%eax
80101faa:	89 04 24             	mov    %eax,(%esp)
80101fad:	e8 6e fb ff ff       	call   80101b20 <bmap>
80101fb2:	8b 55 08             	mov    0x8(%ebp),%edx
80101fb5:	8b 12                	mov    (%edx),%edx
80101fb7:	89 44 24 04          	mov    %eax,0x4(%esp)
80101fbb:	89 14 24             	mov    %edx,(%esp)
80101fbe:	e8 e4 e1 ff ff       	call   801001a7 <bread>
80101fc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101fc6:	8b 45 10             	mov    0x10(%ebp),%eax
80101fc9:	89 c2                	mov    %eax,%edx
80101fcb:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80101fd1:	b8 00 02 00 00       	mov    $0x200,%eax
80101fd6:	89 c1                	mov    %eax,%ecx
80101fd8:	29 d1                	sub    %edx,%ecx
80101fda:	89 ca                	mov    %ecx,%edx
80101fdc:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101fdf:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101fe2:	89 cb                	mov    %ecx,%ebx
80101fe4:	29 c3                	sub    %eax,%ebx
80101fe6:	89 d8                	mov    %ebx,%eax
80101fe8:	39 c2                	cmp    %eax,%edx
80101fea:	0f 46 c2             	cmovbe %edx,%eax
80101fed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
80101ff0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101ff3:	8d 50 18             	lea    0x18(%eax),%edx
80101ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80101ff9:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ffe:	01 c2                	add    %eax,%edx
80102000:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102003:	89 44 24 08          	mov    %eax,0x8(%esp)
80102007:	8b 45 0c             	mov    0xc(%ebp),%eax
8010200a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010200e:	89 14 24             	mov    %edx,(%esp)
80102011:	e8 5f 31 00 00       	call   80105175 <memmove>
    log_write(bp);
80102016:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102019:	89 04 24             	mov    %eax,(%esp)
8010201c:	e8 92 12 00 00       	call   801032b3 <log_write>
    brelse(bp);
80102021:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102024:	89 04 24             	mov    %eax,(%esp)
80102027:	e8 ec e1 ff ff       	call   80100218 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
8010202c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010202f:	01 45 ec             	add    %eax,-0x14(%ebp)
80102032:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102035:	01 45 10             	add    %eax,0x10(%ebp)
80102038:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010203b:	01 45 0c             	add    %eax,0xc(%ebp)
8010203e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102041:	3b 45 14             	cmp    0x14(%ebp),%eax
80102044:	0f 82 53 ff ff ff    	jb     80101f9d <writei+0xbd>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
8010204a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
8010204e:	74 1f                	je     8010206f <writei+0x18f>
80102050:	8b 45 08             	mov    0x8(%ebp),%eax
80102053:	8b 40 18             	mov    0x18(%eax),%eax
80102056:	3b 45 10             	cmp    0x10(%ebp),%eax
80102059:	73 14                	jae    8010206f <writei+0x18f>
    ip->size = off;
8010205b:	8b 45 08             	mov    0x8(%ebp),%eax
8010205e:	8b 55 10             	mov    0x10(%ebp),%edx
80102061:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
80102064:	8b 45 08             	mov    0x8(%ebp),%eax
80102067:	89 04 24             	mov    %eax,(%esp)
8010206a:	e8 4c f6 ff ff       	call   801016bb <iupdate>
  }
  return n;
8010206f:	8b 45 14             	mov    0x14(%ebp),%eax
}
80102072:	83 c4 24             	add    $0x24,%esp
80102075:	5b                   	pop    %ebx
80102076:	5d                   	pop    %ebp
80102077:	c3                   	ret    

80102078 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80102078:	55                   	push   %ebp
80102079:	89 e5                	mov    %esp,%ebp
8010207b:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
8010207e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80102085:	00 
80102086:	8b 45 0c             	mov    0xc(%ebp),%eax
80102089:	89 44 24 04          	mov    %eax,0x4(%esp)
8010208d:	8b 45 08             	mov    0x8(%ebp),%eax
80102090:	89 04 24             	mov    %eax,(%esp)
80102093:	e8 85 31 00 00       	call   8010521d <strncmp>
}
80102098:	c9                   	leave  
80102099:	c3                   	ret    

8010209a <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
8010209a:	55                   	push   %ebp
8010209b:	89 e5                	mov    %esp,%ebp
8010209d:	83 ec 38             	sub    $0x38,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
801020a0:	8b 45 08             	mov    0x8(%ebp),%eax
801020a3:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801020a7:	66 83 f8 01          	cmp    $0x1,%ax
801020ab:	74 0c                	je     801020b9 <dirlookup+0x1f>
    panic("dirlookup not DIR");
801020ad:	c7 04 24 c5 85 10 80 	movl   $0x801085c5,(%esp)
801020b4:	e8 81 e4 ff ff       	call   8010053a <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
801020b9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801020c0:	e9 87 00 00 00       	jmp    8010214c <dirlookup+0xb2>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801020c5:	8d 45 e0             	lea    -0x20(%ebp),%eax
801020c8:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801020cf:	00 
801020d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
801020d3:	89 54 24 08          	mov    %edx,0x8(%esp)
801020d7:	89 44 24 04          	mov    %eax,0x4(%esp)
801020db:	8b 45 08             	mov    0x8(%ebp),%eax
801020de:	89 04 24             	mov    %eax,(%esp)
801020e1:	e8 8e fc ff ff       	call   80101d74 <readi>
801020e6:	83 f8 10             	cmp    $0x10,%eax
801020e9:	74 0c                	je     801020f7 <dirlookup+0x5d>
      panic("dirlink read");
801020eb:	c7 04 24 d7 85 10 80 	movl   $0x801085d7,(%esp)
801020f2:	e8 43 e4 ff ff       	call   8010053a <panic>
    if(de.inum == 0)
801020f7:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801020fb:	66 85 c0             	test   %ax,%ax
801020fe:	74 47                	je     80102147 <dirlookup+0xad>
      continue;
    if(namecmp(name, de.name) == 0){
80102100:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102103:	83 c0 02             	add    $0x2,%eax
80102106:	89 44 24 04          	mov    %eax,0x4(%esp)
8010210a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010210d:	89 04 24             	mov    %eax,(%esp)
80102110:	e8 63 ff ff ff       	call   80102078 <namecmp>
80102115:	85 c0                	test   %eax,%eax
80102117:	75 2f                	jne    80102148 <dirlookup+0xae>
      // entry matches path element
      if(poff)
80102119:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010211d:	74 08                	je     80102127 <dirlookup+0x8d>
        *poff = off;
8010211f:	8b 45 10             	mov    0x10(%ebp),%eax
80102122:	8b 55 f0             	mov    -0x10(%ebp),%edx
80102125:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
80102127:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
8010212b:	0f b7 c0             	movzwl %ax,%eax
8010212e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return iget(dp->dev, inum);
80102131:	8b 45 08             	mov    0x8(%ebp),%eax
80102134:	8b 00                	mov    (%eax),%eax
80102136:	8b 55 f4             	mov    -0xc(%ebp),%edx
80102139:	89 54 24 04          	mov    %edx,0x4(%esp)
8010213d:	89 04 24             	mov    %eax,(%esp)
80102140:	e8 31 f6 ff ff       	call   80101776 <iget>
80102145:	eb 19                	jmp    80102160 <dirlookup+0xc6>

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
80102147:	90                   	nop
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80102148:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
8010214c:	8b 45 08             	mov    0x8(%ebp),%eax
8010214f:	8b 40 18             	mov    0x18(%eax),%eax
80102152:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80102155:	0f 87 6a ff ff ff    	ja     801020c5 <dirlookup+0x2b>
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
8010215b:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102160:	c9                   	leave  
80102161:	c3                   	ret    

80102162 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80102162:	55                   	push   %ebp
80102163:	89 e5                	mov    %esp,%ebp
80102165:	83 ec 38             	sub    $0x38,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80102168:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010216f:	00 
80102170:	8b 45 0c             	mov    0xc(%ebp),%eax
80102173:	89 44 24 04          	mov    %eax,0x4(%esp)
80102177:	8b 45 08             	mov    0x8(%ebp),%eax
8010217a:	89 04 24             	mov    %eax,(%esp)
8010217d:	e8 18 ff ff ff       	call   8010209a <dirlookup>
80102182:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102185:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80102189:	74 15                	je     801021a0 <dirlink+0x3e>
    iput(ip);
8010218b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010218e:	89 04 24             	mov    %eax,(%esp)
80102191:	e8 9b f8 ff ff       	call   80101a31 <iput>
    return -1;
80102196:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010219b:	e9 b8 00 00 00       	jmp    80102258 <dirlink+0xf6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
801021a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801021a7:	eb 44                	jmp    801021ed <dirlink+0x8b>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801021a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
801021ac:	8d 45 e0             	lea    -0x20(%ebp),%eax
801021af:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801021b6:	00 
801021b7:	89 54 24 08          	mov    %edx,0x8(%esp)
801021bb:	89 44 24 04          	mov    %eax,0x4(%esp)
801021bf:	8b 45 08             	mov    0x8(%ebp),%eax
801021c2:	89 04 24             	mov    %eax,(%esp)
801021c5:	e8 aa fb ff ff       	call   80101d74 <readi>
801021ca:	83 f8 10             	cmp    $0x10,%eax
801021cd:	74 0c                	je     801021db <dirlink+0x79>
      panic("dirlink read");
801021cf:	c7 04 24 d7 85 10 80 	movl   $0x801085d7,(%esp)
801021d6:	e8 5f e3 ff ff       	call   8010053a <panic>
    if(de.inum == 0)
801021db:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801021df:	66 85 c0             	test   %ax,%ax
801021e2:	74 18                	je     801021fc <dirlink+0x9a>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
801021e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801021e7:	83 c0 10             	add    $0x10,%eax
801021ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
801021ed:	8b 55 f0             	mov    -0x10(%ebp),%edx
801021f0:	8b 45 08             	mov    0x8(%ebp),%eax
801021f3:	8b 40 18             	mov    0x18(%eax),%eax
801021f6:	39 c2                	cmp    %eax,%edx
801021f8:	72 af                	jb     801021a9 <dirlink+0x47>
801021fa:	eb 01                	jmp    801021fd <dirlink+0x9b>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      break;
801021fc:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
801021fd:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80102204:	00 
80102205:	8b 45 0c             	mov    0xc(%ebp),%eax
80102208:	89 44 24 04          	mov    %eax,0x4(%esp)
8010220c:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010220f:	83 c0 02             	add    $0x2,%eax
80102212:	89 04 24             	mov    %eax,(%esp)
80102215:	e8 5b 30 00 00       	call   80105275 <strncpy>
  de.inum = inum;
8010221a:	8b 45 10             	mov    0x10(%ebp),%eax
8010221d:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102221:	8b 55 f0             	mov    -0x10(%ebp),%edx
80102224:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102227:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
8010222e:	00 
8010222f:	89 54 24 08          	mov    %edx,0x8(%esp)
80102233:	89 44 24 04          	mov    %eax,0x4(%esp)
80102237:	8b 45 08             	mov    0x8(%ebp),%eax
8010223a:	89 04 24             	mov    %eax,(%esp)
8010223d:	e8 9e fc ff ff       	call   80101ee0 <writei>
80102242:	83 f8 10             	cmp    $0x10,%eax
80102245:	74 0c                	je     80102253 <dirlink+0xf1>
    panic("dirlink");
80102247:	c7 04 24 e4 85 10 80 	movl   $0x801085e4,(%esp)
8010224e:	e8 e7 e2 ff ff       	call   8010053a <panic>
  
  return 0;
80102253:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102258:	c9                   	leave  
80102259:	c3                   	ret    

8010225a <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
8010225a:	55                   	push   %ebp
8010225b:	89 e5                	mov    %esp,%ebp
8010225d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int len;

  while(*path == '/')
80102260:	eb 04                	jmp    80102266 <skipelem+0xc>
    path++;
80102262:	83 45 08 01          	addl   $0x1,0x8(%ebp)
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80102266:	8b 45 08             	mov    0x8(%ebp),%eax
80102269:	0f b6 00             	movzbl (%eax),%eax
8010226c:	3c 2f                	cmp    $0x2f,%al
8010226e:	74 f2                	je     80102262 <skipelem+0x8>
    path++;
  if(*path == 0)
80102270:	8b 45 08             	mov    0x8(%ebp),%eax
80102273:	0f b6 00             	movzbl (%eax),%eax
80102276:	84 c0                	test   %al,%al
80102278:	75 0a                	jne    80102284 <skipelem+0x2a>
    return 0;
8010227a:	b8 00 00 00 00       	mov    $0x0,%eax
8010227f:	e9 86 00 00 00       	jmp    8010230a <skipelem+0xb0>
  s = path;
80102284:	8b 45 08             	mov    0x8(%ebp),%eax
80102287:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(*path != '/' && *path != 0)
8010228a:	eb 04                	jmp    80102290 <skipelem+0x36>
    path++;
8010228c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80102290:	8b 45 08             	mov    0x8(%ebp),%eax
80102293:	0f b6 00             	movzbl (%eax),%eax
80102296:	3c 2f                	cmp    $0x2f,%al
80102298:	74 0a                	je     801022a4 <skipelem+0x4a>
8010229a:	8b 45 08             	mov    0x8(%ebp),%eax
8010229d:	0f b6 00             	movzbl (%eax),%eax
801022a0:	84 c0                	test   %al,%al
801022a2:	75 e8                	jne    8010228c <skipelem+0x32>
    path++;
  len = path - s;
801022a4:	8b 55 08             	mov    0x8(%ebp),%edx
801022a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801022aa:	89 d1                	mov    %edx,%ecx
801022ac:	29 c1                	sub    %eax,%ecx
801022ae:	89 c8                	mov    %ecx,%eax
801022b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(len >= DIRSIZ)
801022b3:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
801022b7:	7e 1c                	jle    801022d5 <skipelem+0x7b>
    memmove(name, s, DIRSIZ);
801022b9:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
801022c0:	00 
801022c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801022c4:	89 44 24 04          	mov    %eax,0x4(%esp)
801022c8:	8b 45 0c             	mov    0xc(%ebp),%eax
801022cb:	89 04 24             	mov    %eax,(%esp)
801022ce:	e8 a2 2e 00 00       	call   80105175 <memmove>
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
801022d3:	eb 28                	jmp    801022fd <skipelem+0xa3>
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
801022d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801022d8:	89 44 24 08          	mov    %eax,0x8(%esp)
801022dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
801022df:	89 44 24 04          	mov    %eax,0x4(%esp)
801022e3:	8b 45 0c             	mov    0xc(%ebp),%eax
801022e6:	89 04 24             	mov    %eax,(%esp)
801022e9:	e8 87 2e 00 00       	call   80105175 <memmove>
    name[len] = 0;
801022ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
801022f1:	03 45 0c             	add    0xc(%ebp),%eax
801022f4:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
801022f7:	eb 04                	jmp    801022fd <skipelem+0xa3>
    path++;
801022f9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
801022fd:	8b 45 08             	mov    0x8(%ebp),%eax
80102300:	0f b6 00             	movzbl (%eax),%eax
80102303:	3c 2f                	cmp    $0x2f,%al
80102305:	74 f2                	je     801022f9 <skipelem+0x9f>
    path++;
  return path;
80102307:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010230a:	c9                   	leave  
8010230b:	c3                   	ret    

8010230c <namex>:
// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
static struct inode*
namex(char *path, int nameiparent, char *name)
{
8010230c:	55                   	push   %ebp
8010230d:	89 e5                	mov    %esp,%ebp
8010230f:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *next;

  if(*path == '/')
80102312:	8b 45 08             	mov    0x8(%ebp),%eax
80102315:	0f b6 00             	movzbl (%eax),%eax
80102318:	3c 2f                	cmp    $0x2f,%al
8010231a:	75 1c                	jne    80102338 <namex+0x2c>
    ip = iget(ROOTDEV, ROOTINO);
8010231c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102323:	00 
80102324:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010232b:	e8 46 f4 ff ff       	call   80101776 <iget>
80102330:	89 45 f0             	mov    %eax,-0x10(%ebp)
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
80102333:	e9 af 00 00 00       	jmp    801023e7 <namex+0xdb>
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80102338:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010233e:	8b 40 68             	mov    0x68(%eax),%eax
80102341:	89 04 24             	mov    %eax,(%esp)
80102344:	e8 00 f5 ff ff       	call   80101849 <idup>
80102349:	89 45 f0             	mov    %eax,-0x10(%ebp)

  while((path = skipelem(path, name)) != 0){
8010234c:	e9 96 00 00 00       	jmp    801023e7 <namex+0xdb>
    ilock(ip);
80102351:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102354:	89 04 24             	mov    %eax,(%esp)
80102357:	e8 1f f5 ff ff       	call   8010187b <ilock>
    if(ip->type != T_DIR){
8010235c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010235f:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80102363:	66 83 f8 01          	cmp    $0x1,%ax
80102367:	74 15                	je     8010237e <namex+0x72>
      iunlockput(ip);
80102369:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010236c:	89 04 24             	mov    %eax,(%esp)
8010236f:	e8 8e f7 ff ff       	call   80101b02 <iunlockput>
      return 0;
80102374:	b8 00 00 00 00       	mov    $0x0,%eax
80102379:	e9 a3 00 00 00       	jmp    80102421 <namex+0x115>
    }
    if(nameiparent && *path == '\0'){
8010237e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80102382:	74 1d                	je     801023a1 <namex+0x95>
80102384:	8b 45 08             	mov    0x8(%ebp),%eax
80102387:	0f b6 00             	movzbl (%eax),%eax
8010238a:	84 c0                	test   %al,%al
8010238c:	75 13                	jne    801023a1 <namex+0x95>
      // Stop one level early.
      iunlock(ip);
8010238e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102391:	89 04 24             	mov    %eax,(%esp)
80102394:	e8 33 f6 ff ff       	call   801019cc <iunlock>
      return ip;
80102399:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010239c:	e9 80 00 00 00       	jmp    80102421 <namex+0x115>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
801023a1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801023a8:	00 
801023a9:	8b 45 10             	mov    0x10(%ebp),%eax
801023ac:	89 44 24 04          	mov    %eax,0x4(%esp)
801023b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023b3:	89 04 24             	mov    %eax,(%esp)
801023b6:	e8 df fc ff ff       	call   8010209a <dirlookup>
801023bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
801023be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801023c2:	75 12                	jne    801023d6 <namex+0xca>
      iunlockput(ip);
801023c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023c7:	89 04 24             	mov    %eax,(%esp)
801023ca:	e8 33 f7 ff ff       	call   80101b02 <iunlockput>
      return 0;
801023cf:	b8 00 00 00 00       	mov    $0x0,%eax
801023d4:	eb 4b                	jmp    80102421 <namex+0x115>
    }
    iunlockput(ip);
801023d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023d9:	89 04 24             	mov    %eax,(%esp)
801023dc:	e8 21 f7 ff ff       	call   80101b02 <iunlockput>
    ip = next;
801023e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801023e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
801023e7:	8b 45 10             	mov    0x10(%ebp),%eax
801023ea:	89 44 24 04          	mov    %eax,0x4(%esp)
801023ee:	8b 45 08             	mov    0x8(%ebp),%eax
801023f1:	89 04 24             	mov    %eax,(%esp)
801023f4:	e8 61 fe ff ff       	call   8010225a <skipelem>
801023f9:	89 45 08             	mov    %eax,0x8(%ebp)
801023fc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80102400:	0f 85 4b ff ff ff    	jne    80102351 <namex+0x45>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80102406:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
8010240a:	74 12                	je     8010241e <namex+0x112>
    iput(ip);
8010240c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010240f:	89 04 24             	mov    %eax,(%esp)
80102412:	e8 1a f6 ff ff       	call   80101a31 <iput>
    return 0;
80102417:	b8 00 00 00 00       	mov    $0x0,%eax
8010241c:	eb 03                	jmp    80102421 <namex+0x115>
  }
  return ip;
8010241e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80102421:	c9                   	leave  
80102422:	c3                   	ret    

80102423 <namei>:

struct inode*
namei(char *path)
{
80102423:	55                   	push   %ebp
80102424:	89 e5                	mov    %esp,%ebp
80102426:	83 ec 28             	sub    $0x28,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80102429:	8d 45 ea             	lea    -0x16(%ebp),%eax
8010242c:	89 44 24 08          	mov    %eax,0x8(%esp)
80102430:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102437:	00 
80102438:	8b 45 08             	mov    0x8(%ebp),%eax
8010243b:	89 04 24             	mov    %eax,(%esp)
8010243e:	e8 c9 fe ff ff       	call   8010230c <namex>
}
80102443:	c9                   	leave  
80102444:	c3                   	ret    

80102445 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102445:	55                   	push   %ebp
80102446:	89 e5                	mov    %esp,%ebp
80102448:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 1, name);
8010244b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010244e:	89 44 24 08          	mov    %eax,0x8(%esp)
80102452:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102459:	00 
8010245a:	8b 45 08             	mov    0x8(%ebp),%eax
8010245d:	89 04 24             	mov    %eax,(%esp)
80102460:	e8 a7 fe ff ff       	call   8010230c <namex>
}
80102465:	c9                   	leave  
80102466:	c3                   	ret    
	...

80102468 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
80102468:	55                   	push   %ebp
80102469:	89 e5                	mov    %esp,%ebp
8010246b:	83 ec 14             	sub    $0x14,%esp
8010246e:	8b 45 08             	mov    0x8(%ebp),%eax
80102471:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102475:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80102479:	89 c2                	mov    %eax,%edx
8010247b:	ec                   	in     (%dx),%al
8010247c:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
8010247f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80102483:	c9                   	leave  
80102484:	c3                   	ret    

80102485 <insl>:

static inline void
insl(int port, void *addr, int cnt)
{
80102485:	55                   	push   %ebp
80102486:	89 e5                	mov    %esp,%ebp
80102488:	57                   	push   %edi
80102489:	53                   	push   %ebx
  asm volatile("cld; rep insl" :
8010248a:	8b 55 08             	mov    0x8(%ebp),%edx
8010248d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102490:	8b 45 10             	mov    0x10(%ebp),%eax
80102493:	89 cb                	mov    %ecx,%ebx
80102495:	89 df                	mov    %ebx,%edi
80102497:	89 c1                	mov    %eax,%ecx
80102499:	fc                   	cld    
8010249a:	f3 6d                	rep insl (%dx),%es:(%edi)
8010249c:	89 c8                	mov    %ecx,%eax
8010249e:	89 fb                	mov    %edi,%ebx
801024a0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
801024a3:	89 45 10             	mov    %eax,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "memory", "cc");
}
801024a6:	5b                   	pop    %ebx
801024a7:	5f                   	pop    %edi
801024a8:	5d                   	pop    %ebp
801024a9:	c3                   	ret    

801024aa <outb>:

static inline void
outb(ushort port, uchar data)
{
801024aa:	55                   	push   %ebp
801024ab:	89 e5                	mov    %esp,%ebp
801024ad:	83 ec 08             	sub    $0x8,%esp
801024b0:	8b 55 08             	mov    0x8(%ebp),%edx
801024b3:	8b 45 0c             	mov    0xc(%ebp),%eax
801024b6:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801024ba:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801024bd:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801024c1:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801024c5:	ee                   	out    %al,(%dx)
}
801024c6:	c9                   	leave  
801024c7:	c3                   	ret    

801024c8 <outsl>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

static inline void
outsl(int port, const void *addr, int cnt)
{
801024c8:	55                   	push   %ebp
801024c9:	89 e5                	mov    %esp,%ebp
801024cb:	56                   	push   %esi
801024cc:	53                   	push   %ebx
  asm volatile("cld; rep outsl" :
801024cd:	8b 55 08             	mov    0x8(%ebp),%edx
801024d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801024d3:	8b 45 10             	mov    0x10(%ebp),%eax
801024d6:	89 cb                	mov    %ecx,%ebx
801024d8:	89 de                	mov    %ebx,%esi
801024da:	89 c1                	mov    %eax,%ecx
801024dc:	fc                   	cld    
801024dd:	f3 6f                	rep outsl %ds:(%esi),(%dx)
801024df:	89 c8                	mov    %ecx,%eax
801024e1:	89 f3                	mov    %esi,%ebx
801024e3:	89 5d 0c             	mov    %ebx,0xc(%ebp)
801024e6:	89 45 10             	mov    %eax,0x10(%ebp)
               "=S" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "cc");
}
801024e9:	5b                   	pop    %ebx
801024ea:	5e                   	pop    %esi
801024eb:	5d                   	pop    %ebp
801024ec:	c3                   	ret    

801024ed <idewait>:
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
{
801024ed:	55                   	push   %ebp
801024ee:	89 e5                	mov    %esp,%ebp
801024f0:	83 ec 14             	sub    $0x14,%esp
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
801024f3:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801024fa:	e8 69 ff ff ff       	call   80102468 <inb>
801024ff:	0f b6 c0             	movzbl %al,%eax
80102502:	89 45 fc             	mov    %eax,-0x4(%ebp)
80102505:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102508:	25 c0 00 00 00       	and    $0xc0,%eax
8010250d:	83 f8 40             	cmp    $0x40,%eax
80102510:	75 e1                	jne    801024f3 <idewait+0x6>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102512:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80102516:	74 11                	je     80102529 <idewait+0x3c>
80102518:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010251b:	83 e0 21             	and    $0x21,%eax
8010251e:	85 c0                	test   %eax,%eax
80102520:	74 07                	je     80102529 <idewait+0x3c>
    return -1;
80102522:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102527:	eb 05                	jmp    8010252e <idewait+0x41>
  return 0;
80102529:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010252e:	c9                   	leave  
8010252f:	c3                   	ret    

80102530 <ideinit>:

void
ideinit(void)
{
80102530:	55                   	push   %ebp
80102531:	89 e5                	mov    %esp,%ebp
80102533:	83 ec 28             	sub    $0x28,%esp
  int i;

  initlock(&idelock, "ide");
80102536:	c7 44 24 04 ec 85 10 	movl   $0x801085ec,0x4(%esp)
8010253d:	80 
8010253e:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
80102545:	e8 e8 28 00 00       	call   80104e32 <initlock>
  picenable(IRQ_IDE);
8010254a:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102551:	e8 37 15 00 00       	call   80103a8d <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102556:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
8010255b:	83 e8 01             	sub    $0x1,%eax
8010255e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102562:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102569:	e8 10 04 00 00       	call   8010297e <ioapicenable>
  idewait(0);
8010256e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80102575:	e8 73 ff ff ff       	call   801024ed <idewait>
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
8010257a:	c7 44 24 04 f0 00 00 	movl   $0xf0,0x4(%esp)
80102581:	00 
80102582:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
80102589:	e8 1c ff ff ff       	call   801024aa <outb>
  for(i=0; i<1000; i++){
8010258e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102595:	eb 20                	jmp    801025b7 <ideinit+0x87>
    if(inb(0x1f7) != 0){
80102597:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
8010259e:	e8 c5 fe ff ff       	call   80102468 <inb>
801025a3:	84 c0                	test   %al,%al
801025a5:	74 0c                	je     801025b3 <ideinit+0x83>
      havedisk1 = 1;
801025a7:	c7 05 38 b6 10 80 01 	movl   $0x1,0x8010b638
801025ae:	00 00 00 
      break;
801025b1:	eb 0d                	jmp    801025c0 <ideinit+0x90>
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
801025b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801025b7:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
801025be:	7e d7                	jle    80102597 <ideinit+0x67>
      break;
    }
  }
  
  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
801025c0:	c7 44 24 04 e0 00 00 	movl   $0xe0,0x4(%esp)
801025c7:	00 
801025c8:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
801025cf:	e8 d6 fe ff ff       	call   801024aa <outb>
}
801025d4:	c9                   	leave  
801025d5:	c3                   	ret    

801025d6 <idestart>:

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
801025d6:	55                   	push   %ebp
801025d7:	89 e5                	mov    %esp,%ebp
801025d9:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
801025dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801025e0:	75 0c                	jne    801025ee <idestart+0x18>
    panic("idestart");
801025e2:	c7 04 24 f0 85 10 80 	movl   $0x801085f0,(%esp)
801025e9:	e8 4c df ff ff       	call   8010053a <panic>

  idewait(0);
801025ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801025f5:	e8 f3 fe ff ff       	call   801024ed <idewait>
  outb(0x3f6, 0);  // generate interrupt
801025fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102601:	00 
80102602:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
80102609:	e8 9c fe ff ff       	call   801024aa <outb>
  outb(0x1f2, 1);  // number of sectors
8010260e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102615:	00 
80102616:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
8010261d:	e8 88 fe ff ff       	call   801024aa <outb>
  outb(0x1f3, b->sector & 0xff);
80102622:	8b 45 08             	mov    0x8(%ebp),%eax
80102625:	8b 40 08             	mov    0x8(%eax),%eax
80102628:	0f b6 c0             	movzbl %al,%eax
8010262b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010262f:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
80102636:	e8 6f fe ff ff       	call   801024aa <outb>
  outb(0x1f4, (b->sector >> 8) & 0xff);
8010263b:	8b 45 08             	mov    0x8(%ebp),%eax
8010263e:	8b 40 08             	mov    0x8(%eax),%eax
80102641:	c1 e8 08             	shr    $0x8,%eax
80102644:	0f b6 c0             	movzbl %al,%eax
80102647:	89 44 24 04          	mov    %eax,0x4(%esp)
8010264b:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
80102652:	e8 53 fe ff ff       	call   801024aa <outb>
  outb(0x1f5, (b->sector >> 16) & 0xff);
80102657:	8b 45 08             	mov    0x8(%ebp),%eax
8010265a:	8b 40 08             	mov    0x8(%eax),%eax
8010265d:	c1 e8 10             	shr    $0x10,%eax
80102660:	0f b6 c0             	movzbl %al,%eax
80102663:	89 44 24 04          	mov    %eax,0x4(%esp)
80102667:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
8010266e:	e8 37 fe ff ff       	call   801024aa <outb>
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((b->sector>>24)&0x0f));
80102673:	8b 45 08             	mov    0x8(%ebp),%eax
80102676:	8b 40 04             	mov    0x4(%eax),%eax
80102679:	83 e0 01             	and    $0x1,%eax
8010267c:	89 c2                	mov    %eax,%edx
8010267e:	c1 e2 04             	shl    $0x4,%edx
80102681:	8b 45 08             	mov    0x8(%ebp),%eax
80102684:	8b 40 08             	mov    0x8(%eax),%eax
80102687:	c1 e8 18             	shr    $0x18,%eax
8010268a:	83 e0 0f             	and    $0xf,%eax
8010268d:	09 d0                	or     %edx,%eax
8010268f:	83 c8 e0             	or     $0xffffffe0,%eax
80102692:	0f b6 c0             	movzbl %al,%eax
80102695:	89 44 24 04          	mov    %eax,0x4(%esp)
80102699:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
801026a0:	e8 05 fe ff ff       	call   801024aa <outb>
  if(b->flags & B_DIRTY){
801026a5:	8b 45 08             	mov    0x8(%ebp),%eax
801026a8:	8b 00                	mov    (%eax),%eax
801026aa:	83 e0 04             	and    $0x4,%eax
801026ad:	85 c0                	test   %eax,%eax
801026af:	74 34                	je     801026e5 <idestart+0x10f>
    outb(0x1f7, IDE_CMD_WRITE);
801026b1:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
801026b8:	00 
801026b9:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801026c0:	e8 e5 fd ff ff       	call   801024aa <outb>
    outsl(0x1f0, b->data, 512/4);
801026c5:	8b 45 08             	mov    0x8(%ebp),%eax
801026c8:	83 c0 18             	add    $0x18,%eax
801026cb:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
801026d2:	00 
801026d3:	89 44 24 04          	mov    %eax,0x4(%esp)
801026d7:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
801026de:	e8 e5 fd ff ff       	call   801024c8 <outsl>
801026e3:	eb 14                	jmp    801026f9 <idestart+0x123>
  } else {
    outb(0x1f7, IDE_CMD_READ);
801026e5:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
801026ec:	00 
801026ed:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801026f4:	e8 b1 fd ff ff       	call   801024aa <outb>
  }
}
801026f9:	c9                   	leave  
801026fa:	c3                   	ret    

801026fb <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801026fb:	55                   	push   %ebp
801026fc:	89 e5                	mov    %esp,%ebp
801026fe:	83 ec 28             	sub    $0x28,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102701:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
80102708:	e8 46 27 00 00       	call   80104e53 <acquire>
  if((b = idequeue) == 0){
8010270d:	a1 34 b6 10 80       	mov    0x8010b634,%eax
80102712:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102715:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80102719:	75 11                	jne    8010272c <ideintr+0x31>
    release(&idelock);
8010271b:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
80102722:	e8 8d 27 00 00       	call   80104eb4 <release>
    // cprintf("spurious IDE interrupt\n");
    return;
80102727:	e9 90 00 00 00       	jmp    801027bc <ideintr+0xc1>
  }
  idequeue = b->qnext;
8010272c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010272f:	8b 40 14             	mov    0x14(%eax),%eax
80102732:	a3 34 b6 10 80       	mov    %eax,0x8010b634

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102737:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010273a:	8b 00                	mov    (%eax),%eax
8010273c:	83 e0 04             	and    $0x4,%eax
8010273f:	85 c0                	test   %eax,%eax
80102741:	75 2e                	jne    80102771 <ideintr+0x76>
80102743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010274a:	e8 9e fd ff ff       	call   801024ed <idewait>
8010274f:	85 c0                	test   %eax,%eax
80102751:	78 1e                	js     80102771 <ideintr+0x76>
    insl(0x1f0, b->data, 512/4);
80102753:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102756:	83 c0 18             	add    $0x18,%eax
80102759:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80102760:	00 
80102761:	89 44 24 04          	mov    %eax,0x4(%esp)
80102765:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
8010276c:	e8 14 fd ff ff       	call   80102485 <insl>
  
  // Wake process waiting for this buf.
  b->flags |= B_VALID;
80102771:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102774:	8b 00                	mov    (%eax),%eax
80102776:	89 c2                	mov    %eax,%edx
80102778:	83 ca 02             	or     $0x2,%edx
8010277b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010277e:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
80102780:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102783:	8b 00                	mov    (%eax),%eax
80102785:	89 c2                	mov    %eax,%edx
80102787:	83 e2 fb             	and    $0xfffffffb,%edx
8010278a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010278d:	89 10                	mov    %edx,(%eax)
  wakeup(b);
8010278f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102792:	89 04 24             	mov    %eax,(%esp)
80102795:	e8 bc 24 00 00       	call   80104c56 <wakeup>
  
  // Start disk on next buf in queue.
  if(idequeue != 0)
8010279a:	a1 34 b6 10 80       	mov    0x8010b634,%eax
8010279f:	85 c0                	test   %eax,%eax
801027a1:	74 0d                	je     801027b0 <ideintr+0xb5>
    idestart(idequeue);
801027a3:	a1 34 b6 10 80       	mov    0x8010b634,%eax
801027a8:	89 04 24             	mov    %eax,(%esp)
801027ab:	e8 26 fe ff ff       	call   801025d6 <idestart>

  release(&idelock);
801027b0:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
801027b7:	e8 f8 26 00 00       	call   80104eb4 <release>
}
801027bc:	c9                   	leave  
801027bd:	c3                   	ret    

801027be <iderw>:
// Sync buf with disk. 
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801027be:	55                   	push   %ebp
801027bf:	89 e5                	mov    %esp,%ebp
801027c1:	83 ec 28             	sub    $0x28,%esp
  struct buf **pp;

  if(!(b->flags & B_BUSY))
801027c4:	8b 45 08             	mov    0x8(%ebp),%eax
801027c7:	8b 00                	mov    (%eax),%eax
801027c9:	83 e0 01             	and    $0x1,%eax
801027cc:	85 c0                	test   %eax,%eax
801027ce:	75 0c                	jne    801027dc <iderw+0x1e>
    panic("iderw: buf not busy");
801027d0:	c7 04 24 f9 85 10 80 	movl   $0x801085f9,(%esp)
801027d7:	e8 5e dd ff ff       	call   8010053a <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801027dc:	8b 45 08             	mov    0x8(%ebp),%eax
801027df:	8b 00                	mov    (%eax),%eax
801027e1:	83 e0 06             	and    $0x6,%eax
801027e4:	83 f8 02             	cmp    $0x2,%eax
801027e7:	75 0c                	jne    801027f5 <iderw+0x37>
    panic("iderw: nothing to do");
801027e9:	c7 04 24 0d 86 10 80 	movl   $0x8010860d,(%esp)
801027f0:	e8 45 dd ff ff       	call   8010053a <panic>
  if(b->dev != 0 && !havedisk1)
801027f5:	8b 45 08             	mov    0x8(%ebp),%eax
801027f8:	8b 40 04             	mov    0x4(%eax),%eax
801027fb:	85 c0                	test   %eax,%eax
801027fd:	74 15                	je     80102814 <iderw+0x56>
801027ff:	a1 38 b6 10 80       	mov    0x8010b638,%eax
80102804:	85 c0                	test   %eax,%eax
80102806:	75 0c                	jne    80102814 <iderw+0x56>
    panic("iderw: ide disk 1 not present");
80102808:	c7 04 24 22 86 10 80 	movl   $0x80108622,(%esp)
8010280f:	e8 26 dd ff ff       	call   8010053a <panic>

  acquire(&idelock);  //DOC:acquire-lock
80102814:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
8010281b:	e8 33 26 00 00       	call   80104e53 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
80102820:	8b 45 08             	mov    0x8(%ebp),%eax
80102823:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010282a:	c7 45 f4 34 b6 10 80 	movl   $0x8010b634,-0xc(%ebp)
80102831:	eb 0b                	jmp    8010283e <iderw+0x80>
80102833:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102836:	8b 00                	mov    (%eax),%eax
80102838:	83 c0 14             	add    $0x14,%eax
8010283b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010283e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102841:	8b 00                	mov    (%eax),%eax
80102843:	85 c0                	test   %eax,%eax
80102845:	75 ec                	jne    80102833 <iderw+0x75>
    ;
  *pp = b;
80102847:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010284a:	8b 55 08             	mov    0x8(%ebp),%edx
8010284d:	89 10                	mov    %edx,(%eax)
  
  // Start disk if necessary.
  if(idequeue == b)
8010284f:	a1 34 b6 10 80       	mov    0x8010b634,%eax
80102854:	3b 45 08             	cmp    0x8(%ebp),%eax
80102857:	75 22                	jne    8010287b <iderw+0xbd>
    idestart(b);
80102859:	8b 45 08             	mov    0x8(%ebp),%eax
8010285c:	89 04 24             	mov    %eax,(%esp)
8010285f:	e8 72 fd ff ff       	call   801025d6 <idestart>
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102864:	eb 16                	jmp    8010287c <iderw+0xbe>
    sleep(b, &idelock);
80102866:	c7 44 24 04 00 b6 10 	movl   $0x8010b600,0x4(%esp)
8010286d:	80 
8010286e:	8b 45 08             	mov    0x8(%ebp),%eax
80102871:	89 04 24             	mov    %eax,(%esp)
80102874:	e8 00 23 00 00       	call   80104b79 <sleep>
80102879:	eb 01                	jmp    8010287c <iderw+0xbe>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010287b:	90                   	nop
8010287c:	8b 45 08             	mov    0x8(%ebp),%eax
8010287f:	8b 00                	mov    (%eax),%eax
80102881:	83 e0 06             	and    $0x6,%eax
80102884:	83 f8 02             	cmp    $0x2,%eax
80102887:	75 dd                	jne    80102866 <iderw+0xa8>
    sleep(b, &idelock);
  }

  release(&idelock);
80102889:	c7 04 24 00 b6 10 80 	movl   $0x8010b600,(%esp)
80102890:	e8 1f 26 00 00       	call   80104eb4 <release>
}
80102895:	c9                   	leave  
80102896:	c3                   	ret    
	...

80102898 <ioapicread>:
  uint data;
};

static uint
ioapicread(int reg)
{
80102898:	55                   	push   %ebp
80102899:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
8010289b:	a1 34 f8 10 80       	mov    0x8010f834,%eax
801028a0:	8b 55 08             	mov    0x8(%ebp),%edx
801028a3:	89 10                	mov    %edx,(%eax)
  return ioapic->data;
801028a5:	a1 34 f8 10 80       	mov    0x8010f834,%eax
801028aa:	8b 40 10             	mov    0x10(%eax),%eax
}
801028ad:	5d                   	pop    %ebp
801028ae:	c3                   	ret    

801028af <ioapicwrite>:

static void
ioapicwrite(int reg, uint data)
{
801028af:	55                   	push   %ebp
801028b0:	89 e5                	mov    %esp,%ebp
  ioapic->reg = reg;
801028b2:	a1 34 f8 10 80       	mov    0x8010f834,%eax
801028b7:	8b 55 08             	mov    0x8(%ebp),%edx
801028ba:	89 10                	mov    %edx,(%eax)
  ioapic->data = data;
801028bc:	a1 34 f8 10 80       	mov    0x8010f834,%eax
801028c1:	8b 55 0c             	mov    0xc(%ebp),%edx
801028c4:	89 50 10             	mov    %edx,0x10(%eax)
}
801028c7:	5d                   	pop    %ebp
801028c8:	c3                   	ret    

801028c9 <ioapicinit>:

void
ioapicinit(void)
{
801028c9:	55                   	push   %ebp
801028ca:	89 e5                	mov    %esp,%ebp
801028cc:	83 ec 28             	sub    $0x28,%esp
  int i, id, maxintr;

  if(!ismp)
801028cf:	a1 04 f9 10 80       	mov    0x8010f904,%eax
801028d4:	85 c0                	test   %eax,%eax
801028d6:	0f 84 9f 00 00 00    	je     8010297b <ioapicinit+0xb2>
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
801028dc:	c7 05 34 f8 10 80 00 	movl   $0xfec00000,0x8010f834
801028e3:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801028e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801028ed:	e8 a6 ff ff ff       	call   80102898 <ioapicread>
801028f2:	c1 e8 10             	shr    $0x10,%eax
801028f5:	25 ff 00 00 00       	and    $0xff,%eax
801028fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  id = ioapicread(REG_ID) >> 24;
801028fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80102904:	e8 8f ff ff ff       	call   80102898 <ioapicread>
80102909:	c1 e8 18             	shr    $0x18,%eax
8010290c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(id != ioapicid)
8010290f:	0f b6 05 00 f9 10 80 	movzbl 0x8010f900,%eax
80102916:	0f b6 c0             	movzbl %al,%eax
80102919:	3b 45 f0             	cmp    -0x10(%ebp),%eax
8010291c:	74 0c                	je     8010292a <ioapicinit+0x61>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
8010291e:	c7 04 24 40 86 10 80 	movl   $0x80108640,(%esp)
80102925:	e8 70 da ff ff       	call   8010039a <cprintf>

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010292a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80102931:	eb 3e                	jmp    80102971 <ioapicinit+0xa8>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102933:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102936:	83 c0 20             	add    $0x20,%eax
80102939:	0d 00 00 01 00       	or     $0x10000,%eax
8010293e:	8b 55 ec             	mov    -0x14(%ebp),%edx
80102941:	83 c2 08             	add    $0x8,%edx
80102944:	01 d2                	add    %edx,%edx
80102946:	89 44 24 04          	mov    %eax,0x4(%esp)
8010294a:	89 14 24             	mov    %edx,(%esp)
8010294d:	e8 5d ff ff ff       	call   801028af <ioapicwrite>
    ioapicwrite(REG_TABLE+2*i+1, 0);
80102952:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102955:	83 c0 08             	add    $0x8,%eax
80102958:	01 c0                	add    %eax,%eax
8010295a:	83 c0 01             	add    $0x1,%eax
8010295d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102964:	00 
80102965:	89 04 24             	mov    %eax,(%esp)
80102968:	e8 42 ff ff ff       	call   801028af <ioapicwrite>
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010296d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80102971:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102974:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80102977:	7e ba                	jle    80102933 <ioapicinit+0x6a>
80102979:	eb 01                	jmp    8010297c <ioapicinit+0xb3>
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
    return;
8010297b:	90                   	nop
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010297c:	c9                   	leave  
8010297d:	c3                   	ret    

8010297e <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
8010297e:	55                   	push   %ebp
8010297f:	89 e5                	mov    %esp,%ebp
80102981:	83 ec 08             	sub    $0x8,%esp
  if(!ismp)
80102984:	a1 04 f9 10 80       	mov    0x8010f904,%eax
80102989:	85 c0                	test   %eax,%eax
8010298b:	74 39                	je     801029c6 <ioapicenable+0x48>
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010298d:	8b 45 08             	mov    0x8(%ebp),%eax
80102990:	83 c0 20             	add    $0x20,%eax
80102993:	8b 55 08             	mov    0x8(%ebp),%edx
80102996:	83 c2 08             	add    $0x8,%edx
80102999:	01 d2                	add    %edx,%edx
8010299b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010299f:	89 14 24             	mov    %edx,(%esp)
801029a2:	e8 08 ff ff ff       	call   801028af <ioapicwrite>
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801029a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801029aa:	c1 e0 18             	shl    $0x18,%eax
801029ad:	8b 55 08             	mov    0x8(%ebp),%edx
801029b0:	83 c2 08             	add    $0x8,%edx
801029b3:	01 d2                	add    %edx,%edx
801029b5:	83 c2 01             	add    $0x1,%edx
801029b8:	89 44 24 04          	mov    %eax,0x4(%esp)
801029bc:	89 14 24             	mov    %edx,(%esp)
801029bf:	e8 eb fe ff ff       	call   801028af <ioapicwrite>
801029c4:	eb 01                	jmp    801029c7 <ioapicenable+0x49>

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
    return;
801029c6:	90                   	nop
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
801029c7:	c9                   	leave  
801029c8:	c3                   	ret    
801029c9:	00 00                	add    %al,(%eax)
	...

801029cc <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
801029cc:	55                   	push   %ebp
801029cd:	89 e5                	mov    %esp,%ebp
801029cf:	8b 45 08             	mov    0x8(%ebp),%eax
801029d2:	2d 00 00 00 80       	sub    $0x80000000,%eax
801029d7:	5d                   	pop    %ebp
801029d8:	c3                   	ret    

801029d9 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801029d9:	55                   	push   %ebp
801029da:	89 e5                	mov    %esp,%ebp
801029dc:	83 ec 18             	sub    $0x18,%esp
  initlock(&kmem.lock, "kmem");
801029df:	c7 44 24 04 72 86 10 	movl   $0x80108672,0x4(%esp)
801029e6:	80 
801029e7:	c7 04 24 40 f8 10 80 	movl   $0x8010f840,(%esp)
801029ee:	e8 3f 24 00 00       	call   80104e32 <initlock>
  kmem.use_lock = 0;
801029f3:	c7 05 74 f8 10 80 00 	movl   $0x0,0x8010f874
801029fa:	00 00 00 
  freerange(vstart, vend);
801029fd:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a00:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a04:	8b 45 08             	mov    0x8(%ebp),%eax
80102a07:	89 04 24             	mov    %eax,(%esp)
80102a0a:	e8 26 00 00 00       	call   80102a35 <freerange>
}
80102a0f:	c9                   	leave  
80102a10:	c3                   	ret    

80102a11 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102a11:	55                   	push   %ebp
80102a12:	89 e5                	mov    %esp,%ebp
80102a14:	83 ec 18             	sub    $0x18,%esp
  freerange(vstart, vend);
80102a17:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a1e:	8b 45 08             	mov    0x8(%ebp),%eax
80102a21:	89 04 24             	mov    %eax,(%esp)
80102a24:	e8 0c 00 00 00       	call   80102a35 <freerange>
  kmem.use_lock = 1;
80102a29:	c7 05 74 f8 10 80 01 	movl   $0x1,0x8010f874
80102a30:	00 00 00 
}
80102a33:	c9                   	leave  
80102a34:	c3                   	ret    

80102a35 <freerange>:

void
freerange(void *vstart, void *vend)
{
80102a35:	55                   	push   %ebp
80102a36:	89 e5                	mov    %esp,%ebp
80102a38:	83 ec 28             	sub    $0x28,%esp
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102a3b:	8b 45 08             	mov    0x8(%ebp),%eax
80102a3e:	05 ff 0f 00 00       	add    $0xfff,%eax
80102a43:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80102a48:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102a4b:	eb 12                	jmp    80102a5f <freerange+0x2a>
    kfree(p);
80102a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102a50:	89 04 24             	mov    %eax,(%esp)
80102a53:	e8 19 00 00 00       	call   80102a71 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102a58:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80102a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102a62:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
80102a68:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a6b:	39 c2                	cmp    %eax,%edx
80102a6d:	76 de                	jbe    80102a4d <freerange+0x18>
    kfree(p);
}
80102a6f:	c9                   	leave  
80102a70:	c3                   	ret    

80102a71 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102a71:	55                   	push   %ebp
80102a72:	89 e5                	mov    %esp,%ebp
80102a74:	83 ec 28             	sub    $0x28,%esp
  struct run *r;

  if((uint)v % PGSIZE || v < end || v2p(v) >= PHYSTOP)
80102a77:	8b 45 08             	mov    0x8(%ebp),%eax
80102a7a:	25 ff 0f 00 00       	and    $0xfff,%eax
80102a7f:	85 c0                	test   %eax,%eax
80102a81:	75 1b                	jne    80102a9e <kfree+0x2d>
80102a83:	81 7d 08 fc 28 11 80 	cmpl   $0x801128fc,0x8(%ebp)
80102a8a:	72 12                	jb     80102a9e <kfree+0x2d>
80102a8c:	8b 45 08             	mov    0x8(%ebp),%eax
80102a8f:	89 04 24             	mov    %eax,(%esp)
80102a92:	e8 35 ff ff ff       	call   801029cc <v2p>
80102a97:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102a9c:	76 0c                	jbe    80102aaa <kfree+0x39>
    panic("kfree");
80102a9e:	c7 04 24 77 86 10 80 	movl   $0x80108677,(%esp)
80102aa5:	e8 90 da ff ff       	call   8010053a <panic>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102aaa:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80102ab1:	00 
80102ab2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102ab9:	00 
80102aba:	8b 45 08             	mov    0x8(%ebp),%eax
80102abd:	89 04 24             	mov    %eax,(%esp)
80102ac0:	e8 dd 25 00 00       	call   801050a2 <memset>

  if(kmem.use_lock)
80102ac5:	a1 74 f8 10 80       	mov    0x8010f874,%eax
80102aca:	85 c0                	test   %eax,%eax
80102acc:	74 0c                	je     80102ada <kfree+0x69>
    acquire(&kmem.lock);
80102ace:	c7 04 24 40 f8 10 80 	movl   $0x8010f840,(%esp)
80102ad5:	e8 79 23 00 00       	call   80104e53 <acquire>
  r = (struct run*)v;
80102ada:	8b 45 08             	mov    0x8(%ebp),%eax
80102add:	89 45 f4             	mov    %eax,-0xc(%ebp)
  r->next = kmem.freelist;
80102ae0:	8b 15 78 f8 10 80    	mov    0x8010f878,%edx
80102ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102ae9:	89 10                	mov    %edx,(%eax)
  kmem.freelist = r;
80102aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102aee:	a3 78 f8 10 80       	mov    %eax,0x8010f878
  if(kmem.use_lock)
80102af3:	a1 74 f8 10 80       	mov    0x8010f874,%eax
80102af8:	85 c0                	test   %eax,%eax
80102afa:	74 0c                	je     80102b08 <kfree+0x97>
    release(&kmem.lock);
80102afc:	c7 04 24 40 f8 10 80 	movl   $0x8010f840,(%esp)
80102b03:	e8 ac 23 00 00       	call   80104eb4 <release>
}
80102b08:	c9                   	leave  
80102b09:	c3                   	ret    

80102b0a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102b0a:	55                   	push   %ebp
80102b0b:	89 e5                	mov    %esp,%ebp
80102b0d:	83 ec 28             	sub    $0x28,%esp
  struct run *r;

  if(kmem.use_lock)
80102b10:	a1 74 f8 10 80       	mov    0x8010f874,%eax
80102b15:	85 c0                	test   %eax,%eax
80102b17:	74 0c                	je     80102b25 <kalloc+0x1b>
    acquire(&kmem.lock);
80102b19:	c7 04 24 40 f8 10 80 	movl   $0x8010f840,(%esp)
80102b20:	e8 2e 23 00 00       	call   80104e53 <acquire>
  r = kmem.freelist;
80102b25:	a1 78 f8 10 80       	mov    0x8010f878,%eax
80102b2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(r)
80102b2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80102b31:	74 0a                	je     80102b3d <kalloc+0x33>
    kmem.freelist = r->next;
80102b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b36:	8b 00                	mov    (%eax),%eax
80102b38:	a3 78 f8 10 80       	mov    %eax,0x8010f878
  if(kmem.use_lock)
80102b3d:	a1 74 f8 10 80       	mov    0x8010f874,%eax
80102b42:	85 c0                	test   %eax,%eax
80102b44:	74 0c                	je     80102b52 <kalloc+0x48>
    release(&kmem.lock);
80102b46:	c7 04 24 40 f8 10 80 	movl   $0x8010f840,(%esp)
80102b4d:	e8 62 23 00 00       	call   80104eb4 <release>
  return (char*)r;
80102b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80102b55:	c9                   	leave  
80102b56:	c3                   	ret    
	...

80102b58 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
80102b58:	55                   	push   %ebp
80102b59:	89 e5                	mov    %esp,%ebp
80102b5b:	83 ec 14             	sub    $0x14,%esp
80102b5e:	8b 45 08             	mov    0x8(%ebp),%eax
80102b61:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b65:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80102b69:	89 c2                	mov    %eax,%edx
80102b6b:	ec                   	in     (%dx),%al
80102b6c:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80102b6f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80102b73:	c9                   	leave  
80102b74:	c3                   	ret    

80102b75 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102b75:	55                   	push   %ebp
80102b76:	89 e5                	mov    %esp,%ebp
80102b78:	83 ec 14             	sub    $0x14,%esp
  static uchar *charcode[4] = {
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
80102b7b:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
80102b82:	e8 d1 ff ff ff       	call   80102b58 <inb>
80102b87:	0f b6 c0             	movzbl %al,%eax
80102b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((st & KBS_DIB) == 0)
80102b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b90:	83 e0 01             	and    $0x1,%eax
80102b93:	85 c0                	test   %eax,%eax
80102b95:	75 0a                	jne    80102ba1 <kbdgetc+0x2c>
    return -1;
80102b97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102b9c:	e9 20 01 00 00       	jmp    80102cc1 <kbdgetc+0x14c>
  data = inb(KBDATAP);
80102ba1:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
80102ba8:	e8 ab ff ff ff       	call   80102b58 <inb>
80102bad:	0f b6 c0             	movzbl %al,%eax
80102bb0:	89 45 f8             	mov    %eax,-0x8(%ebp)

  if(data == 0xE0){
80102bb3:	81 7d f8 e0 00 00 00 	cmpl   $0xe0,-0x8(%ebp)
80102bba:	75 17                	jne    80102bd3 <kbdgetc+0x5e>
    shift |= E0ESC;
80102bbc:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102bc1:	83 c8 40             	or     $0x40,%eax
80102bc4:	a3 3c b6 10 80       	mov    %eax,0x8010b63c
    return 0;
80102bc9:	b8 00 00 00 00       	mov    $0x0,%eax
80102bce:	e9 ee 00 00 00       	jmp    80102cc1 <kbdgetc+0x14c>
  } else if(data & 0x80){
80102bd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bd6:	25 80 00 00 00       	and    $0x80,%eax
80102bdb:	85 c0                	test   %eax,%eax
80102bdd:	74 44                	je     80102c23 <kbdgetc+0xae>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102bdf:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102be4:	83 e0 40             	and    $0x40,%eax
80102be7:	85 c0                	test   %eax,%eax
80102be9:	75 08                	jne    80102bf3 <kbdgetc+0x7e>
80102beb:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bee:	83 e0 7f             	and    $0x7f,%eax
80102bf1:	eb 03                	jmp    80102bf6 <kbdgetc+0x81>
80102bf3:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bf6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    shift &= ~(shiftcode[data] | E0ESC);
80102bf9:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bfc:	0f b6 80 20 90 10 80 	movzbl -0x7fef6fe0(%eax),%eax
80102c03:	83 c8 40             	or     $0x40,%eax
80102c06:	0f b6 c0             	movzbl %al,%eax
80102c09:	f7 d0                	not    %eax
80102c0b:	89 c2                	mov    %eax,%edx
80102c0d:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c12:	21 d0                	and    %edx,%eax
80102c14:	a3 3c b6 10 80       	mov    %eax,0x8010b63c
    return 0;
80102c19:	b8 00 00 00 00       	mov    $0x0,%eax
80102c1e:	e9 9e 00 00 00       	jmp    80102cc1 <kbdgetc+0x14c>
  } else if(shift & E0ESC){
80102c23:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c28:	83 e0 40             	and    $0x40,%eax
80102c2b:	85 c0                	test   %eax,%eax
80102c2d:	74 14                	je     80102c43 <kbdgetc+0xce>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102c2f:	81 4d f8 80 00 00 00 	orl    $0x80,-0x8(%ebp)
    shift &= ~E0ESC;
80102c36:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c3b:	83 e0 bf             	and    $0xffffffbf,%eax
80102c3e:	a3 3c b6 10 80       	mov    %eax,0x8010b63c
  }

  shift |= shiftcode[data];
80102c43:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102c46:	0f b6 80 20 90 10 80 	movzbl -0x7fef6fe0(%eax),%eax
80102c4d:	0f b6 d0             	movzbl %al,%edx
80102c50:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c55:	09 d0                	or     %edx,%eax
80102c57:	a3 3c b6 10 80       	mov    %eax,0x8010b63c
  shift ^= togglecode[data];
80102c5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102c5f:	0f b6 80 20 91 10 80 	movzbl -0x7fef6ee0(%eax),%eax
80102c66:	0f b6 d0             	movzbl %al,%edx
80102c69:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c6e:	31 d0                	xor    %edx,%eax
80102c70:	a3 3c b6 10 80       	mov    %eax,0x8010b63c
  c = charcode[shift & (CTL | SHIFT)][data];
80102c75:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c7a:	83 e0 03             	and    $0x3,%eax
80102c7d:	8b 04 85 20 95 10 80 	mov    -0x7fef6ae0(,%eax,4),%eax
80102c84:	03 45 f8             	add    -0x8(%ebp),%eax
80102c87:	0f b6 00             	movzbl (%eax),%eax
80102c8a:	0f b6 c0             	movzbl %al,%eax
80102c8d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(shift & CAPSLOCK){
80102c90:	a1 3c b6 10 80       	mov    0x8010b63c,%eax
80102c95:	83 e0 08             	and    $0x8,%eax
80102c98:	85 c0                	test   %eax,%eax
80102c9a:	74 22                	je     80102cbe <kbdgetc+0x149>
    if('a' <= c && c <= 'z')
80102c9c:	83 7d fc 60          	cmpl   $0x60,-0x4(%ebp)
80102ca0:	76 0c                	jbe    80102cae <kbdgetc+0x139>
80102ca2:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%ebp)
80102ca6:	77 06                	ja     80102cae <kbdgetc+0x139>
      c += 'A' - 'a';
80102ca8:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
80102cac:	eb 10                	jmp    80102cbe <kbdgetc+0x149>
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
80102cae:	83 7d fc 40          	cmpl   $0x40,-0x4(%ebp)
80102cb2:	76 0a                	jbe    80102cbe <kbdgetc+0x149>
80102cb4:	83 7d fc 5a          	cmpl   $0x5a,-0x4(%ebp)
80102cb8:	77 04                	ja     80102cbe <kbdgetc+0x149>
      c += 'a' - 'A';
80102cba:	83 45 fc 20          	addl   $0x20,-0x4(%ebp)
  }
  return c;
80102cbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80102cc1:	c9                   	leave  
80102cc2:	c3                   	ret    

80102cc3 <kbdintr>:

void
kbdintr(void)
{
80102cc3:	55                   	push   %ebp
80102cc4:	89 e5                	mov    %esp,%ebp
80102cc6:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
80102cc9:	c7 04 24 75 2b 10 80 	movl   $0x80102b75,(%esp)
80102cd0:	e8 d6 da ff ff       	call   801007ab <consoleintr>
}
80102cd5:	c9                   	leave  
80102cd6:	c3                   	ret    
	...

80102cd8 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80102cd8:	55                   	push   %ebp
80102cd9:	89 e5                	mov    %esp,%ebp
80102cdb:	83 ec 08             	sub    $0x8,%esp
80102cde:	8b 55 08             	mov    0x8(%ebp),%edx
80102ce1:	8b 45 0c             	mov    0xc(%ebp),%eax
80102ce4:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80102ce8:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ceb:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80102cef:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80102cf3:	ee                   	out    %al,(%dx)
}
80102cf4:	c9                   	leave  
80102cf5:	c3                   	ret    

80102cf6 <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80102cf6:	55                   	push   %ebp
80102cf7:	89 e5                	mov    %esp,%ebp
80102cf9:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102cfc:	9c                   	pushf  
80102cfd:	58                   	pop    %eax
80102cfe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80102d01:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80102d04:	c9                   	leave  
80102d05:	c3                   	ret    

80102d06 <lapicw>:

volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
80102d06:	55                   	push   %ebp
80102d07:	89 e5                	mov    %esp,%ebp
  lapic[index] = value;
80102d09:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102d0e:	8b 55 08             	mov    0x8(%ebp),%edx
80102d11:	c1 e2 02             	shl    $0x2,%edx
80102d14:	8d 14 10             	lea    (%eax,%edx,1),%edx
80102d17:	8b 45 0c             	mov    0xc(%ebp),%eax
80102d1a:	89 02                	mov    %eax,(%edx)
  lapic[ID];  // wait for write to finish, by reading
80102d1c:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102d21:	83 c0 20             	add    $0x20,%eax
80102d24:	8b 00                	mov    (%eax),%eax
}
80102d26:	5d                   	pop    %ebp
80102d27:	c3                   	ret    

80102d28 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
80102d28:	55                   	push   %ebp
80102d29:	89 e5                	mov    %esp,%ebp
80102d2b:	83 ec 08             	sub    $0x8,%esp
  if(!lapic) 
80102d2e:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102d33:	85 c0                	test   %eax,%eax
80102d35:	0f 84 46 01 00 00    	je     80102e81 <lapicinit+0x159>
    return;

  // Enable local APIC; set spurious interrupt vector.
  lapicw(SVR, ENABLE | (T_IRQ0 + IRQ_SPURIOUS));
80102d3b:	c7 44 24 04 3f 01 00 	movl   $0x13f,0x4(%esp)
80102d42:	00 
80102d43:	c7 04 24 3c 00 00 00 	movl   $0x3c,(%esp)
80102d4a:	e8 b7 ff ff ff       	call   80102d06 <lapicw>

  // The timer repeatedly counts down at bus frequency
  // from lapic[TICR] and then issues an interrupt.  
  // If xv6 cared more about precise timekeeping,
  // TICR would be calibrated using an external time source.
  lapicw(TDCR, X1);
80102d4f:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
80102d56:	00 
80102d57:	c7 04 24 f8 00 00 00 	movl   $0xf8,(%esp)
80102d5e:	e8 a3 ff ff ff       	call   80102d06 <lapicw>
  lapicw(TIMER, PERIODIC | (T_IRQ0 + IRQ_TIMER));
80102d63:	c7 44 24 04 20 00 02 	movl   $0x20020,0x4(%esp)
80102d6a:	00 
80102d6b:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102d72:	e8 8f ff ff ff       	call   80102d06 <lapicw>
  lapicw(TICR, 10000000); 
80102d77:	c7 44 24 04 80 96 98 	movl   $0x989680,0x4(%esp)
80102d7e:	00 
80102d7f:	c7 04 24 e0 00 00 00 	movl   $0xe0,(%esp)
80102d86:	e8 7b ff ff ff       	call   80102d06 <lapicw>

  // Disable logical interrupt lines.
  lapicw(LINT0, MASKED);
80102d8b:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102d92:	00 
80102d93:	c7 04 24 d4 00 00 00 	movl   $0xd4,(%esp)
80102d9a:	e8 67 ff ff ff       	call   80102d06 <lapicw>
  lapicw(LINT1, MASKED);
80102d9f:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102da6:	00 
80102da7:	c7 04 24 d8 00 00 00 	movl   $0xd8,(%esp)
80102dae:	e8 53 ff ff ff       	call   80102d06 <lapicw>

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
80102db3:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102db8:	83 c0 30             	add    $0x30,%eax
80102dbb:	8b 00                	mov    (%eax),%eax
80102dbd:	c1 e8 10             	shr    $0x10,%eax
80102dc0:	25 ff 00 00 00       	and    $0xff,%eax
80102dc5:	83 f8 03             	cmp    $0x3,%eax
80102dc8:	76 14                	jbe    80102dde <lapicinit+0xb6>
    lapicw(PCINT, MASKED);
80102dca:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102dd1:	00 
80102dd2:	c7 04 24 d0 00 00 00 	movl   $0xd0,(%esp)
80102dd9:	e8 28 ff ff ff       	call   80102d06 <lapicw>

  // Map error interrupt to IRQ_ERROR.
  lapicw(ERROR, T_IRQ0 + IRQ_ERROR);
80102dde:	c7 44 24 04 33 00 00 	movl   $0x33,0x4(%esp)
80102de5:	00 
80102de6:	c7 04 24 dc 00 00 00 	movl   $0xdc,(%esp)
80102ded:	e8 14 ff ff ff       	call   80102d06 <lapicw>

  // Clear error status register (requires back-to-back writes).
  lapicw(ESR, 0);
80102df2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102df9:	00 
80102dfa:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80102e01:	e8 00 ff ff ff       	call   80102d06 <lapicw>
  lapicw(ESR, 0);
80102e06:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e0d:	00 
80102e0e:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80102e15:	e8 ec fe ff ff       	call   80102d06 <lapicw>

  // Ack any outstanding interrupts.
  lapicw(EOI, 0);
80102e1a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e21:	00 
80102e22:	c7 04 24 2c 00 00 00 	movl   $0x2c,(%esp)
80102e29:	e8 d8 fe ff ff       	call   80102d06 <lapicw>

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
80102e2e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e35:	00 
80102e36:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102e3d:	e8 c4 fe ff ff       	call   80102d06 <lapicw>
  lapicw(ICRLO, BCAST | INIT | LEVEL);
80102e42:	c7 44 24 04 00 85 08 	movl   $0x88500,0x4(%esp)
80102e49:	00 
80102e4a:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102e51:	e8 b0 fe ff ff       	call   80102d06 <lapicw>
  while(lapic[ICRLO] & DELIVS)
80102e56:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102e5b:	05 00 03 00 00       	add    $0x300,%eax
80102e60:	8b 00                	mov    (%eax),%eax
80102e62:	25 00 10 00 00       	and    $0x1000,%eax
80102e67:	85 c0                	test   %eax,%eax
80102e69:	75 eb                	jne    80102e56 <lapicinit+0x12e>
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
80102e6b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e72:	00 
80102e73:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80102e7a:	e8 87 fe ff ff       	call   80102d06 <lapicw>
80102e7f:	eb 01                	jmp    80102e82 <lapicinit+0x15a>

void
lapicinit(void)
{
  if(!lapic) 
    return;
80102e81:	90                   	nop
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102e82:	c9                   	leave  
80102e83:	c3                   	ret    

80102e84 <cpunum>:

int
cpunum(void)
{
80102e84:	55                   	push   %ebp
80102e85:	89 e5                	mov    %esp,%ebp
80102e87:	83 ec 18             	sub    $0x18,%esp
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102e8a:	e8 67 fe ff ff       	call   80102cf6 <readeflags>
80102e8f:	25 00 02 00 00       	and    $0x200,%eax
80102e94:	85 c0                	test   %eax,%eax
80102e96:	74 29                	je     80102ec1 <cpunum+0x3d>
    static int n;
    if(n++ == 0)
80102e98:	a1 40 b6 10 80       	mov    0x8010b640,%eax
80102e9d:	85 c0                	test   %eax,%eax
80102e9f:	0f 94 c2             	sete   %dl
80102ea2:	83 c0 01             	add    $0x1,%eax
80102ea5:	a3 40 b6 10 80       	mov    %eax,0x8010b640
80102eaa:	84 d2                	test   %dl,%dl
80102eac:	74 13                	je     80102ec1 <cpunum+0x3d>
      cprintf("cpu called from %x with interrupts enabled\n",
80102eae:	8b 45 04             	mov    0x4(%ebp),%eax
80102eb1:	89 44 24 04          	mov    %eax,0x4(%esp)
80102eb5:	c7 04 24 80 86 10 80 	movl   $0x80108680,(%esp)
80102ebc:	e8 d9 d4 ff ff       	call   8010039a <cprintf>
        __builtin_return_address(0));
  }

  if(lapic)
80102ec1:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102ec6:	85 c0                	test   %eax,%eax
80102ec8:	74 0f                	je     80102ed9 <cpunum+0x55>
    return lapic[ID]>>24;
80102eca:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102ecf:	83 c0 20             	add    $0x20,%eax
80102ed2:	8b 00                	mov    (%eax),%eax
80102ed4:	c1 e8 18             	shr    $0x18,%eax
80102ed7:	eb 05                	jmp    80102ede <cpunum+0x5a>
  return 0;
80102ed9:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102ede:	c9                   	leave  
80102edf:	c3                   	ret    

80102ee0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102ee0:	55                   	push   %ebp
80102ee1:	89 e5                	mov    %esp,%ebp
80102ee3:	83 ec 08             	sub    $0x8,%esp
  if(lapic)
80102ee6:	a1 7c f8 10 80       	mov    0x8010f87c,%eax
80102eeb:	85 c0                	test   %eax,%eax
80102eed:	74 14                	je     80102f03 <lapiceoi+0x23>
    lapicw(EOI, 0);
80102eef:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102ef6:	00 
80102ef7:	c7 04 24 2c 00 00 00 	movl   $0x2c,(%esp)
80102efe:	e8 03 fe ff ff       	call   80102d06 <lapicw>
}
80102f03:	c9                   	leave  
80102f04:	c3                   	ret    

80102f05 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102f05:	55                   	push   %ebp
80102f06:	89 e5                	mov    %esp,%ebp
}
80102f08:	5d                   	pop    %ebp
80102f09:	c3                   	ret    

80102f0a <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102f0a:	55                   	push   %ebp
80102f0b:	89 e5                	mov    %esp,%ebp
80102f0d:	83 ec 1c             	sub    $0x1c,%esp
80102f10:	8b 45 08             	mov    0x8(%ebp),%eax
80102f13:	88 45 ec             	mov    %al,-0x14(%ebp)
  ushort *wrv;
  
  // "The BSP must initialize CMOS shutdown code to 0AH
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(IO_RTC, 0xF);  // offset 0xF is shutdown code
80102f16:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80102f1d:	00 
80102f1e:	c7 04 24 70 00 00 00 	movl   $0x70,(%esp)
80102f25:	e8 ae fd ff ff       	call   80102cd8 <outb>
  outb(IO_RTC+1, 0x0A);
80102f2a:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80102f31:	00 
80102f32:	c7 04 24 71 00 00 00 	movl   $0x71,(%esp)
80102f39:	e8 9a fd ff ff       	call   80102cd8 <outb>
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
80102f3e:	c7 45 fc 67 04 00 80 	movl   $0x80000467,-0x4(%ebp)
  wrv[0] = 0;
80102f45:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102f48:	66 c7 00 00 00       	movw   $0x0,(%eax)
  wrv[1] = addr >> 4;
80102f4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102f50:	8d 50 02             	lea    0x2(%eax),%edx
80102f53:	8b 45 0c             	mov    0xc(%ebp),%eax
80102f56:	c1 e8 04             	shr    $0x4,%eax
80102f59:	66 89 02             	mov    %ax,(%edx)

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102f5c:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102f60:	c1 e0 18             	shl    $0x18,%eax
80102f63:	89 44 24 04          	mov    %eax,0x4(%esp)
80102f67:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102f6e:	e8 93 fd ff ff       	call   80102d06 <lapicw>
  lapicw(ICRLO, INIT | LEVEL | ASSERT);
80102f73:	c7 44 24 04 00 c5 00 	movl   $0xc500,0x4(%esp)
80102f7a:	00 
80102f7b:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102f82:	e8 7f fd ff ff       	call   80102d06 <lapicw>
  microdelay(200);
80102f87:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102f8e:	e8 72 ff ff ff       	call   80102f05 <microdelay>
  lapicw(ICRLO, INIT | LEVEL);
80102f93:	c7 44 24 04 00 85 00 	movl   $0x8500,0x4(%esp)
80102f9a:	00 
80102f9b:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102fa2:	e8 5f fd ff ff       	call   80102d06 <lapicw>
  microdelay(100);    // should be 10ms, but too slow in Bochs!
80102fa7:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
80102fae:	e8 52 ff ff ff       	call   80102f05 <microdelay>
  // Send startup IPI (twice!) to enter code.
  // Regular hardware is supposed to only accept a STARTUP
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
80102fb3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
80102fba:	eb 40                	jmp    80102ffc <lapicstartap+0xf2>
    lapicw(ICRHI, apicid<<24);
80102fbc:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102fc0:	c1 e0 18             	shl    $0x18,%eax
80102fc3:	89 44 24 04          	mov    %eax,0x4(%esp)
80102fc7:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102fce:	e8 33 fd ff ff       	call   80102d06 <lapicw>
    lapicw(ICRLO, STARTUP | (addr>>12));
80102fd3:	8b 45 0c             	mov    0xc(%ebp),%eax
80102fd6:	c1 e8 0c             	shr    $0xc,%eax
80102fd9:	80 cc 06             	or     $0x6,%ah
80102fdc:	89 44 24 04          	mov    %eax,0x4(%esp)
80102fe0:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102fe7:	e8 1a fd ff ff       	call   80102d06 <lapicw>
    microdelay(200);
80102fec:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102ff3:	e8 0d ff ff ff       	call   80102f05 <microdelay>
  // Send startup IPI (twice!) to enter code.
  // Regular hardware is supposed to only accept a STARTUP
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
80102ff8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80102ffc:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
80103000:	7e ba                	jle    80102fbc <lapicstartap+0xb2>
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
80103002:	c9                   	leave  
80103003:	c3                   	ret    

80103004 <initlog>:

static void recover_from_log(void);

void
initlog(void)
{
80103004:	55                   	push   %ebp
80103005:	89 e5                	mov    %esp,%ebp
80103007:	83 ec 28             	sub    $0x28,%esp
  if (sizeof(struct logheader) >= BSIZE)
8010300a:	90                   	nop
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
8010300b:	c7 44 24 04 ac 86 10 	movl   $0x801086ac,0x4(%esp)
80103012:	80 
80103013:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
8010301a:	e8 13 1e 00 00       	call   80104e32 <initlock>
  readsb(ROOTDEV, &sb);
8010301f:	8d 45 e8             	lea    -0x18(%ebp),%eax
80103022:	89 44 24 04          	mov    %eax,0x4(%esp)
80103026:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010302d:	e8 c2 e2 ff ff       	call   801012f4 <readsb>
  log.start = sb.size - sb.nlog;
80103032:	8b 55 e8             	mov    -0x18(%ebp),%edx
80103035:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103038:	89 d1                	mov    %edx,%ecx
8010303a:	29 c1                	sub    %eax,%ecx
8010303c:	89 c8                	mov    %ecx,%eax
8010303e:	a3 b4 f8 10 80       	mov    %eax,0x8010f8b4
  log.size = sb.nlog;
80103043:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103046:	a3 b8 f8 10 80       	mov    %eax,0x8010f8b8
  log.dev = ROOTDEV;
8010304b:	c7 05 c0 f8 10 80 01 	movl   $0x1,0x8010f8c0
80103052:	00 00 00 
  recover_from_log();
80103055:	e8 97 01 00 00       	call   801031f1 <recover_from_log>
}
8010305a:	c9                   	leave  
8010305b:	c3                   	ret    

8010305c <install_trans>:

// Copy committed blocks from log to their home location
static void 
install_trans(void)
{
8010305c:	55                   	push   %ebp
8010305d:	89 e5                	mov    %esp,%ebp
8010305f:	83 ec 28             	sub    $0x28,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80103062:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80103069:	e9 89 00 00 00       	jmp    801030f7 <install_trans+0x9b>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
8010306e:	a1 b4 f8 10 80       	mov    0x8010f8b4,%eax
80103073:	03 45 ec             	add    -0x14(%ebp),%eax
80103076:	83 c0 01             	add    $0x1,%eax
80103079:	89 c2                	mov    %eax,%edx
8010307b:	a1 c0 f8 10 80       	mov    0x8010f8c0,%eax
80103080:	89 54 24 04          	mov    %edx,0x4(%esp)
80103084:	89 04 24             	mov    %eax,(%esp)
80103087:	e8 1b d1 ff ff       	call   801001a7 <bread>
8010308c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    struct buf *dbuf = bread(log.dev, log.lh.sector[tail]); // read dst
8010308f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103092:	83 c0 10             	add    $0x10,%eax
80103095:	8b 04 85 88 f8 10 80 	mov    -0x7fef0778(,%eax,4),%eax
8010309c:	89 c2                	mov    %eax,%edx
8010309e:	a1 c0 f8 10 80       	mov    0x8010f8c0,%eax
801030a3:	89 54 24 04          	mov    %edx,0x4(%esp)
801030a7:	89 04 24             	mov    %eax,(%esp)
801030aa:	e8 f8 d0 ff ff       	call   801001a7 <bread>
801030af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801030b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801030b5:	8d 50 18             	lea    0x18(%eax),%edx
801030b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030bb:	83 c0 18             	add    $0x18,%eax
801030be:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801030c5:	00 
801030c6:	89 54 24 04          	mov    %edx,0x4(%esp)
801030ca:	89 04 24             	mov    %eax,(%esp)
801030cd:	e8 a3 20 00 00       	call   80105175 <memmove>
    bwrite(dbuf);  // write dst to disk
801030d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030d5:	89 04 24             	mov    %eax,(%esp)
801030d8:	e8 01 d1 ff ff       	call   801001de <bwrite>
    brelse(lbuf); 
801030dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
801030e0:	89 04 24             	mov    %eax,(%esp)
801030e3:	e8 30 d1 ff ff       	call   80100218 <brelse>
    brelse(dbuf);
801030e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030eb:	89 04 24             	mov    %eax,(%esp)
801030ee:	e8 25 d1 ff ff       	call   80100218 <brelse>
static void 
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801030f3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
801030f7:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
801030fc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801030ff:	0f 8f 69 ff ff ff    	jg     8010306e <install_trans+0x12>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf); 
    brelse(dbuf);
  }
}
80103105:	c9                   	leave  
80103106:	c3                   	ret    

80103107 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
80103107:	55                   	push   %ebp
80103108:	89 e5                	mov    %esp,%ebp
8010310a:	83 ec 28             	sub    $0x28,%esp
  struct buf *buf = bread(log.dev, log.start);
8010310d:	a1 b4 f8 10 80       	mov    0x8010f8b4,%eax
80103112:	89 c2                	mov    %eax,%edx
80103114:	a1 c0 f8 10 80       	mov    0x8010f8c0,%eax
80103119:	89 54 24 04          	mov    %edx,0x4(%esp)
8010311d:	89 04 24             	mov    %eax,(%esp)
80103120:	e8 82 d0 ff ff       	call   801001a7 <bread>
80103125:	89 45 ec             	mov    %eax,-0x14(%ebp)
  struct logheader *lh = (struct logheader *) (buf->data);
80103128:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010312b:	83 c0 18             	add    $0x18,%eax
8010312e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int i;
  log.lh.n = lh->n;
80103131:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103134:	8b 00                	mov    (%eax),%eax
80103136:	a3 c4 f8 10 80       	mov    %eax,0x8010f8c4
  for (i = 0; i < log.lh.n; i++) {
8010313b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103142:	eb 1b                	jmp    8010315f <read_head+0x58>
    log.lh.sector[i] = lh->sector[i];
80103144:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80103147:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010314a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010314d:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
80103151:	8d 51 10             	lea    0x10(%ecx),%edx
80103154:	89 04 95 88 f8 10 80 	mov    %eax,-0x7fef0778(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
8010315b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010315f:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
80103164:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80103167:	7f db                	jg     80103144 <read_head+0x3d>
    log.lh.sector[i] = lh->sector[i];
  }
  brelse(buf);
80103169:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010316c:	89 04 24             	mov    %eax,(%esp)
8010316f:	e8 a4 d0 ff ff       	call   80100218 <brelse>
}
80103174:	c9                   	leave  
80103175:	c3                   	ret    

80103176 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80103176:	55                   	push   %ebp
80103177:	89 e5                	mov    %esp,%ebp
80103179:	83 ec 28             	sub    $0x28,%esp
  struct buf *buf = bread(log.dev, log.start);
8010317c:	a1 b4 f8 10 80       	mov    0x8010f8b4,%eax
80103181:	89 c2                	mov    %eax,%edx
80103183:	a1 c0 f8 10 80       	mov    0x8010f8c0,%eax
80103188:	89 54 24 04          	mov    %edx,0x4(%esp)
8010318c:	89 04 24             	mov    %eax,(%esp)
8010318f:	e8 13 d0 ff ff       	call   801001a7 <bread>
80103194:	89 45 ec             	mov    %eax,-0x14(%ebp)
  struct logheader *hb = (struct logheader *) (buf->data);
80103197:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010319a:	83 c0 18             	add    $0x18,%eax
8010319d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  int i;
  hb->n = log.lh.n;
801031a0:	8b 15 c4 f8 10 80    	mov    0x8010f8c4,%edx
801031a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801031a9:	89 10                	mov    %edx,(%eax)
  for (i = 0; i < log.lh.n; i++) {
801031ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801031b2:	eb 1b                	jmp    801031cf <write_head+0x59>
    hb->sector[i] = log.lh.sector[i];
801031b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
801031b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031ba:	83 c0 10             	add    $0x10,%eax
801031bd:	8b 0c 85 88 f8 10 80 	mov    -0x7fef0778(,%eax,4),%ecx
801031c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801031c7:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
801031cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801031cf:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
801031d4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801031d7:	7f db                	jg     801031b4 <write_head+0x3e>
    hb->sector[i] = log.lh.sector[i];
  }
  bwrite(buf);
801031d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
801031dc:	89 04 24             	mov    %eax,(%esp)
801031df:	e8 fa cf ff ff       	call   801001de <bwrite>
  brelse(buf);
801031e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
801031e7:	89 04 24             	mov    %eax,(%esp)
801031ea:	e8 29 d0 ff ff       	call   80100218 <brelse>
}
801031ef:	c9                   	leave  
801031f0:	c3                   	ret    

801031f1 <recover_from_log>:

static void
recover_from_log(void)
{
801031f1:	55                   	push   %ebp
801031f2:	89 e5                	mov    %esp,%ebp
801031f4:	83 ec 08             	sub    $0x8,%esp
  read_head();      
801031f7:	e8 0b ff ff ff       	call   80103107 <read_head>
  install_trans(); // if committed, copy from log to disk
801031fc:	e8 5b fe ff ff       	call   8010305c <install_trans>
  log.lh.n = 0;
80103201:	c7 05 c4 f8 10 80 00 	movl   $0x0,0x8010f8c4
80103208:	00 00 00 
  write_head(); // clear the log
8010320b:	e8 66 ff ff ff       	call   80103176 <write_head>
}
80103210:	c9                   	leave  
80103211:	c3                   	ret    

80103212 <begin_trans>:

void
begin_trans(void)
{
80103212:	55                   	push   %ebp
80103213:	89 e5                	mov    %esp,%ebp
80103215:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80103218:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
8010321f:	e8 2f 1c 00 00       	call   80104e53 <acquire>
  while (log.busy) {
80103224:	eb 14                	jmp    8010323a <begin_trans+0x28>
    sleep(&log, &log.lock);
80103226:	c7 44 24 04 80 f8 10 	movl   $0x8010f880,0x4(%esp)
8010322d:	80 
8010322e:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
80103235:	e8 3f 19 00 00       	call   80104b79 <sleep>

void
begin_trans(void)
{
  acquire(&log.lock);
  while (log.busy) {
8010323a:	a1 bc f8 10 80       	mov    0x8010f8bc,%eax
8010323f:	85 c0                	test   %eax,%eax
80103241:	75 e3                	jne    80103226 <begin_trans+0x14>
    sleep(&log, &log.lock);
  }
  log.busy = 1;
80103243:	c7 05 bc f8 10 80 01 	movl   $0x1,0x8010f8bc
8010324a:	00 00 00 
  release(&log.lock);
8010324d:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
80103254:	e8 5b 1c 00 00       	call   80104eb4 <release>
}
80103259:	c9                   	leave  
8010325a:	c3                   	ret    

8010325b <commit_trans>:

void
commit_trans(void)
{
8010325b:	55                   	push   %ebp
8010325c:	89 e5                	mov    %esp,%ebp
8010325e:	83 ec 18             	sub    $0x18,%esp
  if (log.lh.n > 0) {
80103261:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
80103266:	85 c0                	test   %eax,%eax
80103268:	7e 19                	jle    80103283 <commit_trans+0x28>
    write_head();    // Write header to disk -- the real commit
8010326a:	e8 07 ff ff ff       	call   80103176 <write_head>
    install_trans(); // Now install writes to home locations
8010326f:	e8 e8 fd ff ff       	call   8010305c <install_trans>
    log.lh.n = 0; 
80103274:	c7 05 c4 f8 10 80 00 	movl   $0x0,0x8010f8c4
8010327b:	00 00 00 
    write_head();    // Erase the transaction from the log
8010327e:	e8 f3 fe ff ff       	call   80103176 <write_head>
  }
  
  acquire(&log.lock);
80103283:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
8010328a:	e8 c4 1b 00 00       	call   80104e53 <acquire>
  log.busy = 0;
8010328f:	c7 05 bc f8 10 80 00 	movl   $0x0,0x8010f8bc
80103296:	00 00 00 
  wakeup(&log);
80103299:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
801032a0:	e8 b1 19 00 00       	call   80104c56 <wakeup>
  release(&log.lock);
801032a5:	c7 04 24 80 f8 10 80 	movl   $0x8010f880,(%esp)
801032ac:	e8 03 1c 00 00       	call   80104eb4 <release>
}
801032b1:	c9                   	leave  
801032b2:	c3                   	ret    

801032b3 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
801032b3:	55                   	push   %ebp
801032b4:	89 e5                	mov    %esp,%ebp
801032b6:	83 ec 28             	sub    $0x28,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
801032b9:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
801032be:	83 f8 09             	cmp    $0x9,%eax
801032c1:	7f 12                	jg     801032d5 <log_write+0x22>
801032c3:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
801032c8:	8b 15 b8 f8 10 80    	mov    0x8010f8b8,%edx
801032ce:	83 ea 01             	sub    $0x1,%edx
801032d1:	39 d0                	cmp    %edx,%eax
801032d3:	7c 0c                	jl     801032e1 <log_write+0x2e>
    panic("too big a transaction");
801032d5:	c7 04 24 b0 86 10 80 	movl   $0x801086b0,(%esp)
801032dc:	e8 59 d2 ff ff       	call   8010053a <panic>
  if (!log.busy)
801032e1:	a1 bc f8 10 80       	mov    0x8010f8bc,%eax
801032e6:	85 c0                	test   %eax,%eax
801032e8:	75 0c                	jne    801032f6 <log_write+0x43>
    panic("write outside of trans");
801032ea:	c7 04 24 c6 86 10 80 	movl   $0x801086c6,(%esp)
801032f1:	e8 44 d2 ff ff       	call   8010053a <panic>

  for (i = 0; i < log.lh.n; i++) {
801032f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801032fd:	eb 1d                	jmp    8010331c <log_write+0x69>
    if (log.lh.sector[i] == b->sector)   // log absorbtion?
801032ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103302:	83 c0 10             	add    $0x10,%eax
80103305:	8b 04 85 88 f8 10 80 	mov    -0x7fef0778(,%eax,4),%eax
8010330c:	89 c2                	mov    %eax,%edx
8010330e:	8b 45 08             	mov    0x8(%ebp),%eax
80103311:	8b 40 08             	mov    0x8(%eax),%eax
80103314:	39 c2                	cmp    %eax,%edx
80103316:	74 10                	je     80103328 <log_write+0x75>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
  if (!log.busy)
    panic("write outside of trans");

  for (i = 0; i < log.lh.n; i++) {
80103318:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
8010331c:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
80103321:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80103324:	7f d9                	jg     801032ff <log_write+0x4c>
80103326:	eb 01                	jmp    80103329 <log_write+0x76>
    if (log.lh.sector[i] == b->sector)   // log absorbtion?
      break;
80103328:	90                   	nop
  }
  log.lh.sector[i] = b->sector;
80103329:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010332c:	8b 45 08             	mov    0x8(%ebp),%eax
8010332f:	8b 40 08             	mov    0x8(%eax),%eax
80103332:	83 c2 10             	add    $0x10,%edx
80103335:	89 04 95 88 f8 10 80 	mov    %eax,-0x7fef0778(,%edx,4)
  struct buf *lbuf = bread(b->dev, log.start+i+1);
8010333c:	a1 b4 f8 10 80       	mov    0x8010f8b4,%eax
80103341:	03 45 f0             	add    -0x10(%ebp),%eax
80103344:	83 c0 01             	add    $0x1,%eax
80103347:	89 c2                	mov    %eax,%edx
80103349:	8b 45 08             	mov    0x8(%ebp),%eax
8010334c:	8b 40 04             	mov    0x4(%eax),%eax
8010334f:	89 54 24 04          	mov    %edx,0x4(%esp)
80103353:	89 04 24             	mov    %eax,(%esp)
80103356:	e8 4c ce ff ff       	call   801001a7 <bread>
8010335b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(lbuf->data, b->data, BSIZE);
8010335e:	8b 45 08             	mov    0x8(%ebp),%eax
80103361:	8d 50 18             	lea    0x18(%eax),%edx
80103364:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103367:	83 c0 18             	add    $0x18,%eax
8010336a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80103371:	00 
80103372:	89 54 24 04          	mov    %edx,0x4(%esp)
80103376:	89 04 24             	mov    %eax,(%esp)
80103379:	e8 f7 1d 00 00       	call   80105175 <memmove>
  bwrite(lbuf);
8010337e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103381:	89 04 24             	mov    %eax,(%esp)
80103384:	e8 55 ce ff ff       	call   801001de <bwrite>
  brelse(lbuf);
80103389:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010338c:	89 04 24             	mov    %eax,(%esp)
8010338f:	e8 84 ce ff ff       	call   80100218 <brelse>
  if (i == log.lh.n)
80103394:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
80103399:	3b 45 f0             	cmp    -0x10(%ebp),%eax
8010339c:	75 0d                	jne    801033ab <log_write+0xf8>
    log.lh.n++;
8010339e:	a1 c4 f8 10 80       	mov    0x8010f8c4,%eax
801033a3:	83 c0 01             	add    $0x1,%eax
801033a6:	a3 c4 f8 10 80       	mov    %eax,0x8010f8c4
  b->flags |= B_DIRTY; // XXX prevent eviction
801033ab:	8b 45 08             	mov    0x8(%ebp),%eax
801033ae:	8b 00                	mov    (%eax),%eax
801033b0:	89 c2                	mov    %eax,%edx
801033b2:	83 ca 04             	or     $0x4,%edx
801033b5:	8b 45 08             	mov    0x8(%ebp),%eax
801033b8:	89 10                	mov    %edx,(%eax)
}
801033ba:	c9                   	leave  
801033bb:	c3                   	ret    

801033bc <v2p>:
801033bc:	55                   	push   %ebp
801033bd:	89 e5                	mov    %esp,%ebp
801033bf:	8b 45 08             	mov    0x8(%ebp),%eax
801033c2:	2d 00 00 00 80       	sub    $0x80000000,%eax
801033c7:	5d                   	pop    %ebp
801033c8:	c3                   	ret    

801033c9 <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
801033c9:	55                   	push   %ebp
801033ca:	89 e5                	mov    %esp,%ebp
801033cc:	8b 45 08             	mov    0x8(%ebp),%eax
801033cf:	2d 00 00 00 80       	sub    $0x80000000,%eax
801033d4:	5d                   	pop    %ebp
801033d5:	c3                   	ret    

801033d6 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
801033d6:	55                   	push   %ebp
801033d7:	89 e5                	mov    %esp,%ebp
801033d9:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801033dc:	8b 55 08             	mov    0x8(%ebp),%edx
801033df:	8b 45 0c             	mov    0xc(%ebp),%eax
801033e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
801033e5:	f0 87 02             	lock xchg %eax,(%edx)
801033e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
801033eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801033ee:	c9                   	leave  
801033ef:	c3                   	ret    

801033f0 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
801033f0:	55                   	push   %ebp
801033f1:	89 e5                	mov    %esp,%ebp
801033f3:	83 e4 f0             	and    $0xfffffff0,%esp
801033f6:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
801033f9:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80103400:	80 
80103401:	c7 04 24 fc 28 11 80 	movl   $0x801128fc,(%esp)
80103408:	e8 cc f5 ff ff       	call   801029d9 <kinit1>
  kvmalloc();      // kernel page table
8010340d:	e8 e5 48 00 00       	call   80107cf7 <kvmalloc>
  mpinit();        // collect info about this machine
80103412:	e8 45 04 00 00       	call   8010385c <mpinit>
  lapicinit();
80103417:	e8 0c f9 ff ff       	call   80102d28 <lapicinit>
  seginit();       // set up segments
8010341c:	e8 78 42 00 00       	call   80107699 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpu->id);
80103421:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103427:	0f b6 00             	movzbl (%eax),%eax
8010342a:	0f b6 c0             	movzbl %al,%eax
8010342d:	89 44 24 04          	mov    %eax,0x4(%esp)
80103431:	c7 04 24 dd 86 10 80 	movl   $0x801086dd,(%esp)
80103438:	e8 5d cf ff ff       	call   8010039a <cprintf>
  picinit();       // interrupt controller
8010343d:	e8 80 06 00 00       	call   80103ac2 <picinit>
  ioapicinit();    // another interrupt controller
80103442:	e8 82 f4 ff ff       	call   801028c9 <ioapicinit>
  consoleinit();   // I/O devices & their interrupts
80103447:	e8 3c d6 ff ff       	call   80100a88 <consoleinit>
  uartinit();      // serial port
8010344c:	e8 92 35 00 00       	call   801069e3 <uartinit>
  pinit();         // process table
80103451:	e8 03 0c 00 00       	call   80104059 <pinit>
  tvinit();        // trap vectors
80103456:	e8 3b 31 00 00       	call   80106596 <tvinit>
  binit();         // buffer cache
8010345b:	e8 d4 cb ff ff       	call   80100034 <binit>
  fileinit();      // file table
80103460:	e8 a3 da ff ff       	call   80100f08 <fileinit>
  iinit();         // inode cache
80103465:	e8 58 e1 ff ff       	call   801015c2 <iinit>
  ideinit();       // disk
8010346a:	e8 c1 f0 ff ff       	call   80102530 <ideinit>
  if(!ismp)
8010346f:	a1 04 f9 10 80       	mov    0x8010f904,%eax
80103474:	85 c0                	test   %eax,%eax
80103476:	75 05                	jne    8010347d <main+0x8d>
    timerinit();   // uniprocessor timer
80103478:	e8 61 30 00 00       	call   801064de <timerinit>
  startothers();   // start other processors
8010347d:	e8 7f 00 00 00       	call   80103501 <startothers>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103482:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80103489:	8e 
8010348a:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80103491:	e8 7b f5 ff ff       	call   80102a11 <kinit2>
  userinit();      // first user process
80103496:	e8 dd 0c 00 00       	call   80104178 <userinit>
  // Finish setting up this processor in mpmain.
  mpmain();
8010349b:	e8 1a 00 00 00       	call   801034ba <mpmain>

801034a0 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
801034a0:	55                   	push   %ebp
801034a1:	89 e5                	mov    %esp,%ebp
801034a3:	83 ec 08             	sub    $0x8,%esp
  switchkvm(); 
801034a6:	e8 63 48 00 00       	call   80107d0e <switchkvm>
  seginit();
801034ab:	e8 e9 41 00 00       	call   80107699 <seginit>
  lapicinit();
801034b0:	e8 73 f8 ff ff       	call   80102d28 <lapicinit>
  mpmain();
801034b5:	e8 00 00 00 00       	call   801034ba <mpmain>

801034ba <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
801034ba:	55                   	push   %ebp
801034bb:	89 e5                	mov    %esp,%ebp
801034bd:	83 ec 18             	sub    $0x18,%esp
  cprintf("cpu%d: starting\n", cpu->id);
801034c0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801034c6:	0f b6 00             	movzbl (%eax),%eax
801034c9:	0f b6 c0             	movzbl %al,%eax
801034cc:	89 44 24 04          	mov    %eax,0x4(%esp)
801034d0:	c7 04 24 f4 86 10 80 	movl   $0x801086f4,(%esp)
801034d7:	e8 be ce ff ff       	call   8010039a <cprintf>
  idtinit();       // load idt register
801034dc:	e8 25 32 00 00       	call   80106706 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
801034e1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801034e7:	05 a8 00 00 00       	add    $0xa8,%eax
801034ec:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801034f3:	00 
801034f4:	89 04 24             	mov    %eax,(%esp)
801034f7:	e8 da fe ff ff       	call   801033d6 <xchg>
  scheduler();     // start running processes
801034fc:	e8 cb 14 00 00       	call   801049cc <scheduler>

80103501 <startothers>:
pde_t entrypgdir[];  // For entry.S

// Start the non-boot (AP) processors.
static void
startothers(void)
{
80103501:	55                   	push   %ebp
80103502:	89 e5                	mov    %esp,%ebp
80103504:	53                   	push   %ebx
80103505:	83 ec 24             	sub    $0x24,%esp
  char *stack;

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
80103508:	c7 04 24 00 70 00 00 	movl   $0x7000,(%esp)
8010350f:	e8 b5 fe ff ff       	call   801033c9 <p2v>
80103514:	89 45 ec             	mov    %eax,-0x14(%ebp)
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103517:	b8 8a 00 00 00       	mov    $0x8a,%eax
8010351c:	89 44 24 08          	mov    %eax,0x8(%esp)
80103520:	c7 44 24 04 0c b5 10 	movl   $0x8010b50c,0x4(%esp)
80103527:	80 
80103528:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010352b:	89 04 24             	mov    %eax,(%esp)
8010352e:	e8 42 1c 00 00       	call   80105175 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103533:	c7 45 f0 20 f9 10 80 	movl   $0x8010f920,-0x10(%ebp)
8010353a:	e9 85 00 00 00       	jmp    801035c4 <startothers+0xc3>
    if(c == cpus+cpunum())  // We've started already.
8010353f:	e8 40 f9 ff ff       	call   80102e84 <cpunum>
80103544:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010354a:	05 20 f9 10 80       	add    $0x8010f920,%eax
8010354f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80103552:	74 68                	je     801035bc <startothers+0xbb>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what 
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103554:	e8 b1 f5 ff ff       	call   80102b0a <kalloc>
80103559:	89 45 f4             	mov    %eax,-0xc(%ebp)
    *(void**)(code-4) = stack + KSTACKSIZE;
8010355c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010355f:	83 e8 04             	sub    $0x4,%eax
80103562:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103565:	81 c2 00 10 00 00    	add    $0x1000,%edx
8010356b:	89 10                	mov    %edx,(%eax)
    *(void**)(code-8) = mpenter;
8010356d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103570:	83 e8 08             	sub    $0x8,%eax
80103573:	c7 00 a0 34 10 80    	movl   $0x801034a0,(%eax)
    *(int**)(code-12) = (void *) v2p(entrypgdir);
80103579:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010357c:	8d 58 f4             	lea    -0xc(%eax),%ebx
8010357f:	c7 04 24 00 a0 10 80 	movl   $0x8010a000,(%esp)
80103586:	e8 31 fe ff ff       	call   801033bc <v2p>
8010358b:	89 03                	mov    %eax,(%ebx)

    lapicstartap(c->id, v2p(code));
8010358d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103590:	89 04 24             	mov    %eax,(%esp)
80103593:	e8 24 fe ff ff       	call   801033bc <v2p>
80103598:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010359b:	0f b6 12             	movzbl (%edx),%edx
8010359e:	0f b6 d2             	movzbl %dl,%edx
801035a1:	89 44 24 04          	mov    %eax,0x4(%esp)
801035a5:	89 14 24             	mov    %edx,(%esp)
801035a8:	e8 5d f9 ff ff       	call   80102f0a <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801035ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
801035b0:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801035b6:	85 c0                	test   %eax,%eax
801035b8:	74 f3                	je     801035ad <startothers+0xac>
801035ba:	eb 01                	jmp    801035bd <startothers+0xbc>
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
    if(c == cpus+cpunum())  // We've started already.
      continue;
801035bc:	90                   	nop
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
801035bd:	81 45 f0 bc 00 00 00 	addl   $0xbc,-0x10(%ebp)
801035c4:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
801035c9:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801035cf:	05 20 f9 10 80       	add    $0x8010f920,%eax
801035d4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801035d7:	0f 87 62 ff ff ff    	ja     8010353f <startothers+0x3e>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
      ;
  }
}
801035dd:	83 c4 24             	add    $0x24,%esp
801035e0:	5b                   	pop    %ebx
801035e1:	5d                   	pop    %ebp
801035e2:	c3                   	ret    
	...

801035e4 <p2v>:
801035e4:	55                   	push   %ebp
801035e5:	89 e5                	mov    %esp,%ebp
801035e7:	8b 45 08             	mov    0x8(%ebp),%eax
801035ea:	2d 00 00 00 80       	sub    $0x80000000,%eax
801035ef:	5d                   	pop    %ebp
801035f0:	c3                   	ret    

801035f1 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801035f1:	55                   	push   %ebp
801035f2:	89 e5                	mov    %esp,%ebp
801035f4:	83 ec 14             	sub    $0x14,%esp
801035f7:	8b 45 08             	mov    0x8(%ebp),%eax
801035fa:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801035fe:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80103602:	89 c2                	mov    %eax,%edx
80103604:	ec                   	in     (%dx),%al
80103605:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80103608:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
8010360c:	c9                   	leave  
8010360d:	c3                   	ret    

8010360e <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
8010360e:	55                   	push   %ebp
8010360f:	89 e5                	mov    %esp,%ebp
80103611:	83 ec 08             	sub    $0x8,%esp
80103614:	8b 55 08             	mov    0x8(%ebp),%edx
80103617:	8b 45 0c             	mov    0xc(%ebp),%eax
8010361a:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
8010361e:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103621:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80103625:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80103629:	ee                   	out    %al,(%dx)
}
8010362a:	c9                   	leave  
8010362b:	c3                   	ret    

8010362c <mpbcpu>:
int ncpu;
uchar ioapicid;

int
mpbcpu(void)
{
8010362c:	55                   	push   %ebp
8010362d:	89 e5                	mov    %esp,%ebp
  return bcpu-cpus;
8010362f:	a1 44 b6 10 80       	mov    0x8010b644,%eax
80103634:	89 c2                	mov    %eax,%edx
80103636:	b8 20 f9 10 80       	mov    $0x8010f920,%eax
8010363b:	89 d1                	mov    %edx,%ecx
8010363d:	29 c1                	sub    %eax,%ecx
8010363f:	89 c8                	mov    %ecx,%eax
80103641:	c1 f8 02             	sar    $0x2,%eax
80103644:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
}
8010364a:	5d                   	pop    %ebp
8010364b:	c3                   	ret    

8010364c <sum>:

static uchar
sum(uchar *addr, int len)
{
8010364c:	55                   	push   %ebp
8010364d:	89 e5                	mov    %esp,%ebp
8010364f:	83 ec 10             	sub    $0x10,%esp
  int i, sum;
  
  sum = 0;
80103652:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  for(i=0; i<len; i++)
80103659:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
80103660:	eb 13                	jmp    80103675 <sum+0x29>
    sum += addr[i];
80103662:	8b 45 f8             	mov    -0x8(%ebp),%eax
80103665:	03 45 08             	add    0x8(%ebp),%eax
80103668:	0f b6 00             	movzbl (%eax),%eax
8010366b:	0f b6 c0             	movzbl %al,%eax
8010366e:	01 45 fc             	add    %eax,-0x4(%ebp)
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
80103671:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80103675:	8b 45 f8             	mov    -0x8(%ebp),%eax
80103678:	3b 45 0c             	cmp    0xc(%ebp),%eax
8010367b:	7c e5                	jl     80103662 <sum+0x16>
    sum += addr[i];
  return sum;
8010367d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80103680:	c9                   	leave  
80103681:	c3                   	ret    

80103682 <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103682:	55                   	push   %ebp
80103683:	89 e5                	mov    %esp,%ebp
80103685:	83 ec 28             	sub    $0x28,%esp
  uchar *e, *p, *addr;

  addr = p2v(a);
80103688:	8b 45 08             	mov    0x8(%ebp),%eax
8010368b:	89 04 24             	mov    %eax,(%esp)
8010368e:	e8 51 ff ff ff       	call   801035e4 <p2v>
80103693:	89 45 f4             	mov    %eax,-0xc(%ebp)
  e = addr+len;
80103696:	8b 45 0c             	mov    0xc(%ebp),%eax
80103699:	03 45 f4             	add    -0xc(%ebp),%eax
8010369c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
8010369f:	8b 45 f4             	mov    -0xc(%ebp),%eax
801036a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
801036a5:	eb 3f                	jmp    801036e6 <mpsearch1+0x64>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801036a7:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801036ae:	00 
801036af:	c7 44 24 04 08 87 10 	movl   $0x80108708,0x4(%esp)
801036b6:	80 
801036b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036ba:	89 04 24             	mov    %eax,(%esp)
801036bd:	e8 57 1a 00 00       	call   80105119 <memcmp>
801036c2:	85 c0                	test   %eax,%eax
801036c4:	75 1c                	jne    801036e2 <mpsearch1+0x60>
801036c6:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
801036cd:	00 
801036ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036d1:	89 04 24             	mov    %eax,(%esp)
801036d4:	e8 73 ff ff ff       	call   8010364c <sum>
801036d9:	84 c0                	test   %al,%al
801036db:	75 05                	jne    801036e2 <mpsearch1+0x60>
      return (struct mp*)p;
801036dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036e0:	eb 11                	jmp    801036f3 <mpsearch1+0x71>
{
  uchar *e, *p, *addr;

  addr = p2v(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801036e2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
801036e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036e9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801036ec:	72 b9                	jb     801036a7 <mpsearch1+0x25>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801036ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
801036f3:	c9                   	leave  
801036f4:	c3                   	ret    

801036f5 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
801036f5:	55                   	push   %ebp
801036f6:	89 e5                	mov    %esp,%ebp
801036f8:	83 ec 28             	sub    $0x28,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
801036fb:	c7 45 ec 00 04 00 80 	movl   $0x80000400,-0x14(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103702:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103705:	83 c0 0f             	add    $0xf,%eax
80103708:	0f b6 00             	movzbl (%eax),%eax
8010370b:	0f b6 c0             	movzbl %al,%eax
8010370e:	89 c2                	mov    %eax,%edx
80103710:	c1 e2 08             	shl    $0x8,%edx
80103713:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103716:	83 c0 0e             	add    $0xe,%eax
80103719:	0f b6 00             	movzbl (%eax),%eax
8010371c:	0f b6 c0             	movzbl %al,%eax
8010371f:	09 d0                	or     %edx,%eax
80103721:	c1 e0 04             	shl    $0x4,%eax
80103724:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103727:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010372b:	74 21                	je     8010374e <mpsearch+0x59>
    if((mp = mpsearch1(p, 1024)))
8010372d:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
80103734:	00 
80103735:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103738:	89 04 24             	mov    %eax,(%esp)
8010373b:	e8 42 ff ff ff       	call   80103682 <mpsearch1>
80103740:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103743:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103747:	74 50                	je     80103799 <mpsearch+0xa4>
      return mp;
80103749:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010374c:	eb 5f                	jmp    801037ad <mpsearch+0xb8>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
8010374e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103751:	83 c0 14             	add    $0x14,%eax
80103754:	0f b6 00             	movzbl (%eax),%eax
80103757:	0f b6 c0             	movzbl %al,%eax
8010375a:	89 c2                	mov    %eax,%edx
8010375c:	c1 e2 08             	shl    $0x8,%edx
8010375f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103762:	83 c0 13             	add    $0x13,%eax
80103765:	0f b6 00             	movzbl (%eax),%eax
80103768:	0f b6 c0             	movzbl %al,%eax
8010376b:	09 d0                	or     %edx,%eax
8010376d:	c1 e0 0a             	shl    $0xa,%eax
80103770:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
80103773:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103776:	2d 00 04 00 00       	sub    $0x400,%eax
8010377b:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
80103782:	00 
80103783:	89 04 24             	mov    %eax,(%esp)
80103786:	e8 f7 fe ff ff       	call   80103682 <mpsearch1>
8010378b:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010378e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103792:	74 05                	je     80103799 <mpsearch+0xa4>
      return mp;
80103794:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103797:	eb 14                	jmp    801037ad <mpsearch+0xb8>
  }
  return mpsearch1(0xF0000, 0x10000);
80103799:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
801037a0:	00 
801037a1:	c7 04 24 00 00 0f 00 	movl   $0xf0000,(%esp)
801037a8:	e8 d5 fe ff ff       	call   80103682 <mpsearch1>
}
801037ad:	c9                   	leave  
801037ae:	c3                   	ret    

801037af <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
801037af:	55                   	push   %ebp
801037b0:	89 e5                	mov    %esp,%ebp
801037b2:	83 ec 28             	sub    $0x28,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801037b5:	e8 3b ff ff ff       	call   801036f5 <mpsearch>
801037ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
801037bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801037c1:	74 0a                	je     801037cd <mpconfig+0x1e>
801037c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801037c6:	8b 40 04             	mov    0x4(%eax),%eax
801037c9:	85 c0                	test   %eax,%eax
801037cb:	75 0a                	jne    801037d7 <mpconfig+0x28>
    return 0;
801037cd:	b8 00 00 00 00       	mov    $0x0,%eax
801037d2:	e9 83 00 00 00       	jmp    8010385a <mpconfig+0xab>
  conf = (struct mpconf*) p2v((uint) mp->physaddr);
801037d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801037da:	8b 40 04             	mov    0x4(%eax),%eax
801037dd:	89 04 24             	mov    %eax,(%esp)
801037e0:	e8 ff fd ff ff       	call   801035e4 <p2v>
801037e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801037e8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801037ef:	00 
801037f0:	c7 44 24 04 0d 87 10 	movl   $0x8010870d,0x4(%esp)
801037f7:	80 
801037f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801037fb:	89 04 24             	mov    %eax,(%esp)
801037fe:	e8 16 19 00 00       	call   80105119 <memcmp>
80103803:	85 c0                	test   %eax,%eax
80103805:	74 07                	je     8010380e <mpconfig+0x5f>
    return 0;
80103807:	b8 00 00 00 00       	mov    $0x0,%eax
8010380c:	eb 4c                	jmp    8010385a <mpconfig+0xab>
  if(conf->version != 1 && conf->version != 4)
8010380e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103811:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103815:	3c 01                	cmp    $0x1,%al
80103817:	74 12                	je     8010382b <mpconfig+0x7c>
80103819:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010381c:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103820:	3c 04                	cmp    $0x4,%al
80103822:	74 07                	je     8010382b <mpconfig+0x7c>
    return 0;
80103824:	b8 00 00 00 00       	mov    $0x0,%eax
80103829:	eb 2f                	jmp    8010385a <mpconfig+0xab>
  if(sum((uchar*)conf, conf->length) != 0)
8010382b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010382e:	0f b7 40 04          	movzwl 0x4(%eax),%eax
80103832:	0f b7 d0             	movzwl %ax,%edx
80103835:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103838:	89 54 24 04          	mov    %edx,0x4(%esp)
8010383c:	89 04 24             	mov    %eax,(%esp)
8010383f:	e8 08 fe ff ff       	call   8010364c <sum>
80103844:	84 c0                	test   %al,%al
80103846:	74 07                	je     8010384f <mpconfig+0xa0>
    return 0;
80103848:	b8 00 00 00 00       	mov    $0x0,%eax
8010384d:	eb 0b                	jmp    8010385a <mpconfig+0xab>
  *pmp = mp;
8010384f:	8b 45 08             	mov    0x8(%ebp),%eax
80103852:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103855:	89 10                	mov    %edx,(%eax)
  return conf;
80103857:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
8010385a:	c9                   	leave  
8010385b:	c3                   	ret    

8010385c <mpinit>:

void
mpinit(void)
{
8010385c:	55                   	push   %ebp
8010385d:	89 e5                	mov    %esp,%ebp
8010385f:	83 ec 38             	sub    $0x38,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
80103862:	c7 05 44 b6 10 80 20 	movl   $0x8010f920,0x8010b644
80103869:	f9 10 80 
  if((conf = mpconfig(&mp)) == 0)
8010386c:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010386f:	89 04 24             	mov    %eax,(%esp)
80103872:	e8 38 ff ff ff       	call   801037af <mpconfig>
80103877:	89 45 ec             	mov    %eax,-0x14(%ebp)
8010387a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010387e:	0f 84 9d 01 00 00    	je     80103a21 <mpinit+0x1c5>
    return;
  ismp = 1;
80103884:	c7 05 04 f9 10 80 01 	movl   $0x1,0x8010f904
8010388b:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
8010388e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103891:	8b 40 24             	mov    0x24(%eax),%eax
80103894:	a3 7c f8 10 80       	mov    %eax,0x8010f87c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103899:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010389c:	83 c0 2c             	add    $0x2c,%eax
8010389f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801038a2:	8b 55 ec             	mov    -0x14(%ebp),%edx
801038a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801038a8:	0f b7 40 04          	movzwl 0x4(%eax),%eax
801038ac:	0f b7 c0             	movzwl %ax,%eax
801038af:	8d 04 02             	lea    (%edx,%eax,1),%eax
801038b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
801038b5:	e9 f2 00 00 00       	jmp    801039ac <mpinit+0x150>
    switch(*p){
801038ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801038bd:	0f b6 00             	movzbl (%eax),%eax
801038c0:	0f b6 c0             	movzbl %al,%eax
801038c3:	83 f8 04             	cmp    $0x4,%eax
801038c6:	0f 87 bd 00 00 00    	ja     80103989 <mpinit+0x12d>
801038cc:	8b 04 85 50 87 10 80 	mov    -0x7fef78b0(,%eax,4),%eax
801038d3:	ff e0                	jmp    *%eax
    case MPPROC:
      proc = (struct mpproc*)p;
801038d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801038d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(ncpu != proc->apicid){
801038db:	8b 45 f0             	mov    -0x10(%ebp),%eax
801038de:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801038e2:	0f b6 d0             	movzbl %al,%edx
801038e5:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
801038ea:	39 c2                	cmp    %eax,%edx
801038ec:	74 2d                	je     8010391b <mpinit+0xbf>
        cprintf("mpinit: ncpu=%d apicid=%d\n", ncpu, proc->apicid);
801038ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
801038f1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801038f5:	0f b6 d0             	movzbl %al,%edx
801038f8:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
801038fd:	89 54 24 08          	mov    %edx,0x8(%esp)
80103901:	89 44 24 04          	mov    %eax,0x4(%esp)
80103905:	c7 04 24 12 87 10 80 	movl   $0x80108712,(%esp)
8010390c:	e8 89 ca ff ff       	call   8010039a <cprintf>
        ismp = 0;
80103911:	c7 05 04 f9 10 80 00 	movl   $0x0,0x8010f904
80103918:	00 00 00 
      }
      if(proc->flags & MPBOOT)
8010391b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010391e:	0f b6 40 03          	movzbl 0x3(%eax),%eax
80103922:	0f b6 c0             	movzbl %al,%eax
80103925:	83 e0 02             	and    $0x2,%eax
80103928:	85 c0                	test   %eax,%eax
8010392a:	74 15                	je     80103941 <mpinit+0xe5>
        bcpu = &cpus[ncpu];
8010392c:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
80103931:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80103937:	05 20 f9 10 80       	add    $0x8010f920,%eax
8010393c:	a3 44 b6 10 80       	mov    %eax,0x8010b644
      cpus[ncpu].id = ncpu;
80103941:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
80103946:	8b 15 00 ff 10 80    	mov    0x8010ff00,%edx
8010394c:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80103952:	88 90 20 f9 10 80    	mov    %dl,-0x7fef06e0(%eax)
      ncpu++;
80103958:	a1 00 ff 10 80       	mov    0x8010ff00,%eax
8010395d:	83 c0 01             	add    $0x1,%eax
80103960:	a3 00 ff 10 80       	mov    %eax,0x8010ff00
      p += sizeof(struct mpproc);
80103965:	83 45 e4 14          	addl   $0x14,-0x1c(%ebp)
      continue;
80103969:	eb 41                	jmp    801039ac <mpinit+0x150>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
8010396b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010396e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      ioapicid = ioapic->apicno;
80103971:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103974:	0f b6 40 01          	movzbl 0x1(%eax),%eax
80103978:	a2 00 f9 10 80       	mov    %al,0x8010f900
      p += sizeof(struct mpioapic);
8010397d:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
      continue;
80103981:	eb 29                	jmp    801039ac <mpinit+0x150>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103983:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
      continue;
80103987:	eb 23                	jmp    801039ac <mpinit+0x150>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
80103989:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010398c:	0f b6 00             	movzbl (%eax),%eax
8010398f:	0f b6 c0             	movzbl %al,%eax
80103992:	89 44 24 04          	mov    %eax,0x4(%esp)
80103996:	c7 04 24 30 87 10 80 	movl   $0x80108730,(%esp)
8010399d:	e8 f8 c9 ff ff       	call   8010039a <cprintf>
      ismp = 0;
801039a2:	c7 05 04 f9 10 80 00 	movl   $0x0,0x8010f904
801039a9:	00 00 00 
  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801039ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801039af:	3b 45 e8             	cmp    -0x18(%ebp),%eax
801039b2:	0f 82 02 ff ff ff    	jb     801038ba <mpinit+0x5e>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
      ismp = 0;
    }
  }
  if(!ismp){
801039b8:	a1 04 f9 10 80       	mov    0x8010f904,%eax
801039bd:	85 c0                	test   %eax,%eax
801039bf:	75 1d                	jne    801039de <mpinit+0x182>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
801039c1:	c7 05 00 ff 10 80 01 	movl   $0x1,0x8010ff00
801039c8:	00 00 00 
    lapic = 0;
801039cb:	c7 05 7c f8 10 80 00 	movl   $0x0,0x8010f87c
801039d2:	00 00 00 
    ioapicid = 0;
801039d5:	c6 05 00 f9 10 80 00 	movb   $0x0,0x8010f900
    return;
801039dc:	eb 44                	jmp    80103a22 <mpinit+0x1c6>
  }

  if(mp->imcrp){
801039de:	8b 45 e0             	mov    -0x20(%ebp),%eax
801039e1:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
801039e5:	84 c0                	test   %al,%al
801039e7:	74 39                	je     80103a22 <mpinit+0x1c6>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
801039e9:	c7 44 24 04 70 00 00 	movl   $0x70,0x4(%esp)
801039f0:	00 
801039f1:	c7 04 24 22 00 00 00 	movl   $0x22,(%esp)
801039f8:	e8 11 fc ff ff       	call   8010360e <outb>
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801039fd:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
80103a04:	e8 e8 fb ff ff       	call   801035f1 <inb>
80103a09:	83 c8 01             	or     $0x1,%eax
80103a0c:	0f b6 c0             	movzbl %al,%eax
80103a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a13:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
80103a1a:	e8 ef fb ff ff       	call   8010360e <outb>
80103a1f:	eb 01                	jmp    80103a22 <mpinit+0x1c6>
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
80103a21:	90                   	nop
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103a22:	c9                   	leave  
80103a23:	c3                   	ret    

80103a24 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80103a24:	55                   	push   %ebp
80103a25:	89 e5                	mov    %esp,%ebp
80103a27:	83 ec 08             	sub    $0x8,%esp
80103a2a:	8b 55 08             	mov    0x8(%ebp),%edx
80103a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
80103a30:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80103a34:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103a37:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80103a3b:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80103a3f:	ee                   	out    %al,(%dx)
}
80103a40:	c9                   	leave  
80103a41:	c3                   	ret    

80103a42 <picsetmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
80103a42:	55                   	push   %ebp
80103a43:	89 e5                	mov    %esp,%ebp
80103a45:	83 ec 0c             	sub    $0xc,%esp
80103a48:	8b 45 08             	mov    0x8(%ebp),%eax
80103a4b:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  irqmask = mask;
80103a4f:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a53:	66 a3 00 b0 10 80    	mov    %ax,0x8010b000
  outb(IO_PIC1+1, mask);
80103a59:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a5d:	0f b6 c0             	movzbl %al,%eax
80103a60:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a64:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103a6b:	e8 b4 ff ff ff       	call   80103a24 <outb>
  outb(IO_PIC2+1, mask >> 8);
80103a70:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a74:	66 c1 e8 08          	shr    $0x8,%ax
80103a78:	0f b6 c0             	movzbl %al,%eax
80103a7b:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a7f:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103a86:	e8 99 ff ff ff       	call   80103a24 <outb>
}
80103a8b:	c9                   	leave  
80103a8c:	c3                   	ret    

80103a8d <picenable>:

void
picenable(int irq)
{
80103a8d:	55                   	push   %ebp
80103a8e:	89 e5                	mov    %esp,%ebp
80103a90:	53                   	push   %ebx
80103a91:	83 ec 04             	sub    $0x4,%esp
  picsetmask(irqmask & ~(1<<irq));
80103a94:	8b 45 08             	mov    0x8(%ebp),%eax
80103a97:	ba 01 00 00 00       	mov    $0x1,%edx
80103a9c:	89 d3                	mov    %edx,%ebx
80103a9e:	89 c1                	mov    %eax,%ecx
80103aa0:	d3 e3                	shl    %cl,%ebx
80103aa2:	89 d8                	mov    %ebx,%eax
80103aa4:	89 c2                	mov    %eax,%edx
80103aa6:	f7 d2                	not    %edx
80103aa8:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103aaf:	21 d0                	and    %edx,%eax
80103ab1:	0f b7 c0             	movzwl %ax,%eax
80103ab4:	89 04 24             	mov    %eax,(%esp)
80103ab7:	e8 86 ff ff ff       	call   80103a42 <picsetmask>
}
80103abc:	83 c4 04             	add    $0x4,%esp
80103abf:	5b                   	pop    %ebx
80103ac0:	5d                   	pop    %ebp
80103ac1:	c3                   	ret    

80103ac2 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
80103ac2:	55                   	push   %ebp
80103ac3:	89 e5                	mov    %esp,%ebp
80103ac5:	83 ec 08             	sub    $0x8,%esp
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
80103ac8:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
80103acf:	00 
80103ad0:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103ad7:	e8 48 ff ff ff       	call   80103a24 <outb>
  outb(IO_PIC2+1, 0xFF);
80103adc:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
80103ae3:	00 
80103ae4:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103aeb:	e8 34 ff ff ff       	call   80103a24 <outb>

  // ICW1:  0001g0hi
  //    g:  0 = edge triggering, 1 = level triggering
  //    h:  0 = cascaded PICs, 1 = master only
  //    i:  0 = no ICW4, 1 = ICW4 required
  outb(IO_PIC1, 0x11);
80103af0:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
80103af7:	00 
80103af8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103aff:	e8 20 ff ff ff       	call   80103a24 <outb>

  // ICW2:  Vector offset
  outb(IO_PIC1+1, T_IRQ0);
80103b04:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
80103b0b:	00 
80103b0c:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b13:	e8 0c ff ff ff       	call   80103a24 <outb>

  // ICW3:  (master PIC) bit mask of IR lines connected to slaves
  //        (slave PIC) 3-bit # of slave's connection to master
  outb(IO_PIC1+1, 1<<IRQ_SLAVE);
80103b18:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
80103b1f:	00 
80103b20:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b27:	e8 f8 fe ff ff       	call   80103a24 <outb>
  //    m:  0 = slave PIC, 1 = master PIC
  //      (ignored when b is 0, as the master/slave role
  //      can be hardwired).
  //    a:  1 = Automatic EOI mode
  //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
  outb(IO_PIC1+1, 0x3);
80103b2c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80103b33:	00 
80103b34:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b3b:	e8 e4 fe ff ff       	call   80103a24 <outb>

  // Set up slave (8259A-2)
  outb(IO_PIC2, 0x11);                  // ICW1
80103b40:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
80103b47:	00 
80103b48:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103b4f:	e8 d0 fe ff ff       	call   80103a24 <outb>
  outb(IO_PIC2+1, T_IRQ0 + 8);      // ICW2
80103b54:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
80103b5b:	00 
80103b5c:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b63:	e8 bc fe ff ff       	call   80103a24 <outb>
  outb(IO_PIC2+1, IRQ_SLAVE);           // ICW3
80103b68:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
80103b6f:	00 
80103b70:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b77:	e8 a8 fe ff ff       	call   80103a24 <outb>
  // NB Automatic EOI mode doesn't tend to work on the slave.
  // Linux source code says it's "to be investigated".
  outb(IO_PIC2+1, 0x3);                 // ICW4
80103b7c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80103b83:	00 
80103b84:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b8b:	e8 94 fe ff ff       	call   80103a24 <outb>

  // OCW3:  0ef01prs
  //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
  //    p:  0 = no polling, 1 = polling mode
  //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
  outb(IO_PIC1, 0x68);             // clear specific mask
80103b90:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
80103b97:	00 
80103b98:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103b9f:	e8 80 fe ff ff       	call   80103a24 <outb>
  outb(IO_PIC1, 0x0a);             // read IRR by default
80103ba4:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80103bab:	00 
80103bac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103bb3:	e8 6c fe ff ff       	call   80103a24 <outb>

  outb(IO_PIC2, 0x68);             // OCW3
80103bb8:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
80103bbf:	00 
80103bc0:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103bc7:	e8 58 fe ff ff       	call   80103a24 <outb>
  outb(IO_PIC2, 0x0a);             // OCW3
80103bcc:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80103bd3:	00 
80103bd4:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103bdb:	e8 44 fe ff ff       	call   80103a24 <outb>

  if(irqmask != 0xFFFF)
80103be0:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103be7:	66 83 f8 ff          	cmp    $0xffffffff,%ax
80103beb:	74 12                	je     80103bff <picinit+0x13d>
    picsetmask(irqmask);
80103bed:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103bf4:	0f b7 c0             	movzwl %ax,%eax
80103bf7:	89 04 24             	mov    %eax,(%esp)
80103bfa:	e8 43 fe ff ff       	call   80103a42 <picsetmask>
}
80103bff:	c9                   	leave  
80103c00:	c3                   	ret    
80103c01:	00 00                	add    %al,(%eax)
	...

80103c04 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103c04:	55                   	push   %ebp
80103c05:	89 e5                	mov    %esp,%ebp
80103c07:	83 ec 28             	sub    $0x28,%esp
  struct pipe *p;

  p = 0;
80103c0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  *f0 = *f1 = 0;
80103c11:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c14:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103c1a:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c1d:	8b 10                	mov    (%eax),%edx
80103c1f:	8b 45 08             	mov    0x8(%ebp),%eax
80103c22:	89 10                	mov    %edx,(%eax)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
80103c24:	e8 fb d2 ff ff       	call   80100f24 <filealloc>
80103c29:	8b 55 08             	mov    0x8(%ebp),%edx
80103c2c:	89 02                	mov    %eax,(%edx)
80103c2e:	8b 45 08             	mov    0x8(%ebp),%eax
80103c31:	8b 00                	mov    (%eax),%eax
80103c33:	85 c0                	test   %eax,%eax
80103c35:	0f 84 c8 00 00 00    	je     80103d03 <pipealloc+0xff>
80103c3b:	e8 e4 d2 ff ff       	call   80100f24 <filealloc>
80103c40:	8b 55 0c             	mov    0xc(%ebp),%edx
80103c43:	89 02                	mov    %eax,(%edx)
80103c45:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c48:	8b 00                	mov    (%eax),%eax
80103c4a:	85 c0                	test   %eax,%eax
80103c4c:	0f 84 b1 00 00 00    	je     80103d03 <pipealloc+0xff>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103c52:	e8 b3 ee ff ff       	call   80102b0a <kalloc>
80103c57:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103c5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103c5e:	0f 84 9e 00 00 00    	je     80103d02 <pipealloc+0xfe>
    goto bad;
  p->readopen = 1;
80103c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c67:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103c6e:	00 00 00 
  p->writeopen = 1;
80103c71:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c74:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103c7b:	00 00 00 
  p->nwrite = 0;
80103c7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c81:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103c88:	00 00 00 
  p->nread = 0;
80103c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c8e:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103c95:	00 00 00 
  initlock(&p->lock, "pipe");
80103c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c9b:	c7 44 24 04 64 87 10 	movl   $0x80108764,0x4(%esp)
80103ca2:	80 
80103ca3:	89 04 24             	mov    %eax,(%esp)
80103ca6:	e8 87 11 00 00       	call   80104e32 <initlock>
  (*f0)->type = FD_PIPE;
80103cab:	8b 45 08             	mov    0x8(%ebp),%eax
80103cae:	8b 00                	mov    (%eax),%eax
80103cb0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103cb6:	8b 45 08             	mov    0x8(%ebp),%eax
80103cb9:	8b 00                	mov    (%eax),%eax
80103cbb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103cbf:	8b 45 08             	mov    0x8(%ebp),%eax
80103cc2:	8b 00                	mov    (%eax),%eax
80103cc4:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103cc8:	8b 45 08             	mov    0x8(%ebp),%eax
80103ccb:	8b 00                	mov    (%eax),%eax
80103ccd:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103cd0:	89 50 0c             	mov    %edx,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103cd3:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cd6:	8b 00                	mov    (%eax),%eax
80103cd8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103cde:	8b 45 0c             	mov    0xc(%ebp),%eax
80103ce1:	8b 00                	mov    (%eax),%eax
80103ce3:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103ce7:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cea:	8b 00                	mov    (%eax),%eax
80103cec:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cf3:	8b 00                	mov    (%eax),%eax
80103cf5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103cf8:	89 50 0c             	mov    %edx,0xc(%eax)
  return 0;
80103cfb:	b8 00 00 00 00       	mov    $0x0,%eax
80103d00:	eb 43                	jmp    80103d45 <pipealloc+0x141>
  p = 0;
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
80103d02:	90                   	nop
  (*f1)->pipe = p;
  return 0;

//PAGEBREAK: 20
 bad:
  if(p)
80103d03:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103d07:	74 0b                	je     80103d14 <pipealloc+0x110>
    kfree((char*)p);
80103d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103d0c:	89 04 24             	mov    %eax,(%esp)
80103d0f:	e8 5d ed ff ff       	call   80102a71 <kfree>
  if(*f0)
80103d14:	8b 45 08             	mov    0x8(%ebp),%eax
80103d17:	8b 00                	mov    (%eax),%eax
80103d19:	85 c0                	test   %eax,%eax
80103d1b:	74 0d                	je     80103d2a <pipealloc+0x126>
    fileclose(*f0);
80103d1d:	8b 45 08             	mov    0x8(%ebp),%eax
80103d20:	8b 00                	mov    (%eax),%eax
80103d22:	89 04 24             	mov    %eax,(%esp)
80103d25:	e8 a3 d2 ff ff       	call   80100fcd <fileclose>
  if(*f1)
80103d2a:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d2d:	8b 00                	mov    (%eax),%eax
80103d2f:	85 c0                	test   %eax,%eax
80103d31:	74 0d                	je     80103d40 <pipealloc+0x13c>
    fileclose(*f1);
80103d33:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d36:	8b 00                	mov    (%eax),%eax
80103d38:	89 04 24             	mov    %eax,(%esp)
80103d3b:	e8 8d d2 ff ff       	call   80100fcd <fileclose>
  return -1;
80103d40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103d45:	c9                   	leave  
80103d46:	c3                   	ret    

80103d47 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103d47:	55                   	push   %ebp
80103d48:	89 e5                	mov    %esp,%ebp
80103d4a:	83 ec 18             	sub    $0x18,%esp
  acquire(&p->lock);
80103d4d:	8b 45 08             	mov    0x8(%ebp),%eax
80103d50:	89 04 24             	mov    %eax,(%esp)
80103d53:	e8 fb 10 00 00       	call   80104e53 <acquire>
  if(writable){
80103d58:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80103d5c:	74 1f                	je     80103d7d <pipeclose+0x36>
    p->writeopen = 0;
80103d5e:	8b 45 08             	mov    0x8(%ebp),%eax
80103d61:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
80103d68:	00 00 00 
    wakeup(&p->nread);
80103d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80103d6e:	05 34 02 00 00       	add    $0x234,%eax
80103d73:	89 04 24             	mov    %eax,(%esp)
80103d76:	e8 db 0e 00 00       	call   80104c56 <wakeup>
80103d7b:	eb 1d                	jmp    80103d9a <pipeclose+0x53>
  } else {
    p->readopen = 0;
80103d7d:	8b 45 08             	mov    0x8(%ebp),%eax
80103d80:	c7 80 3c 02 00 00 00 	movl   $0x0,0x23c(%eax)
80103d87:	00 00 00 
    wakeup(&p->nwrite);
80103d8a:	8b 45 08             	mov    0x8(%ebp),%eax
80103d8d:	05 38 02 00 00       	add    $0x238,%eax
80103d92:	89 04 24             	mov    %eax,(%esp)
80103d95:	e8 bc 0e 00 00       	call   80104c56 <wakeup>
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103d9a:	8b 45 08             	mov    0x8(%ebp),%eax
80103d9d:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
80103da3:	85 c0                	test   %eax,%eax
80103da5:	75 25                	jne    80103dcc <pipeclose+0x85>
80103da7:	8b 45 08             	mov    0x8(%ebp),%eax
80103daa:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
80103db0:	85 c0                	test   %eax,%eax
80103db2:	75 18                	jne    80103dcc <pipeclose+0x85>
    release(&p->lock);
80103db4:	8b 45 08             	mov    0x8(%ebp),%eax
80103db7:	89 04 24             	mov    %eax,(%esp)
80103dba:	e8 f5 10 00 00       	call   80104eb4 <release>
    kfree((char*)p);
80103dbf:	8b 45 08             	mov    0x8(%ebp),%eax
80103dc2:	89 04 24             	mov    %eax,(%esp)
80103dc5:	e8 a7 ec ff ff       	call   80102a71 <kfree>
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103dca:	eb 0b                	jmp    80103dd7 <pipeclose+0x90>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103dcc:	8b 45 08             	mov    0x8(%ebp),%eax
80103dcf:	89 04 24             	mov    %eax,(%esp)
80103dd2:	e8 dd 10 00 00       	call   80104eb4 <release>
}
80103dd7:	c9                   	leave  
80103dd8:	c3                   	ret    

80103dd9 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103dd9:	55                   	push   %ebp
80103dda:	89 e5                	mov    %esp,%ebp
80103ddc:	53                   	push   %ebx
80103ddd:	83 ec 24             	sub    $0x24,%esp
  int i;

  acquire(&p->lock);
80103de0:	8b 45 08             	mov    0x8(%ebp),%eax
80103de3:	89 04 24             	mov    %eax,(%esp)
80103de6:	e8 68 10 00 00       	call   80104e53 <acquire>
  for(i = 0; i < n; i++){
80103deb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103df2:	e9 a6 00 00 00       	jmp    80103e9d <pipewrite+0xc4>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
80103df7:	8b 45 08             	mov    0x8(%ebp),%eax
80103dfa:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
80103e00:	85 c0                	test   %eax,%eax
80103e02:	74 0d                	je     80103e11 <pipewrite+0x38>
80103e04:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e0a:	8b 40 24             	mov    0x24(%eax),%eax
80103e0d:	85 c0                	test   %eax,%eax
80103e0f:	74 15                	je     80103e26 <pipewrite+0x4d>
        release(&p->lock);
80103e11:	8b 45 08             	mov    0x8(%ebp),%eax
80103e14:	89 04 24             	mov    %eax,(%esp)
80103e17:	e8 98 10 00 00       	call   80104eb4 <release>
        return -1;
80103e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e21:	e9 9d 00 00 00       	jmp    80103ec3 <pipewrite+0xea>
      }
      wakeup(&p->nread);
80103e26:	8b 45 08             	mov    0x8(%ebp),%eax
80103e29:	05 34 02 00 00       	add    $0x234,%eax
80103e2e:	89 04 24             	mov    %eax,(%esp)
80103e31:	e8 20 0e 00 00       	call   80104c56 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103e36:	8b 45 08             	mov    0x8(%ebp),%eax
80103e39:	8b 55 08             	mov    0x8(%ebp),%edx
80103e3c:	81 c2 38 02 00 00    	add    $0x238,%edx
80103e42:	89 44 24 04          	mov    %eax,0x4(%esp)
80103e46:	89 14 24             	mov    %edx,(%esp)
80103e49:	e8 2b 0d 00 00       	call   80104b79 <sleep>
80103e4e:	eb 01                	jmp    80103e51 <pipewrite+0x78>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103e50:	90                   	nop
80103e51:	8b 45 08             	mov    0x8(%ebp),%eax
80103e54:	8b 90 38 02 00 00    	mov    0x238(%eax),%edx
80103e5a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e5d:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
80103e63:	05 00 02 00 00       	add    $0x200,%eax
80103e68:	39 c2                	cmp    %eax,%edx
80103e6a:	74 8b                	je     80103df7 <pipewrite+0x1e>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103e6c:	8b 45 08             	mov    0x8(%ebp),%eax
80103e6f:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103e75:	89 c3                	mov    %eax,%ebx
80103e77:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
80103e7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103e80:	03 55 0c             	add    0xc(%ebp),%edx
80103e83:	0f b6 0a             	movzbl (%edx),%ecx
80103e86:	8b 55 08             	mov    0x8(%ebp),%edx
80103e89:	88 4c 1a 34          	mov    %cl,0x34(%edx,%ebx,1)
80103e8d:	8d 50 01             	lea    0x1(%eax),%edx
80103e90:	8b 45 08             	mov    0x8(%ebp),%eax
80103e93:	89 90 38 02 00 00    	mov    %edx,0x238(%eax)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103e99:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103e9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103ea0:	3b 45 10             	cmp    0x10(%ebp),%eax
80103ea3:	7c ab                	jl     80103e50 <pipewrite+0x77>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103ea5:	8b 45 08             	mov    0x8(%ebp),%eax
80103ea8:	05 34 02 00 00       	add    $0x234,%eax
80103ead:	89 04 24             	mov    %eax,(%esp)
80103eb0:	e8 a1 0d 00 00       	call   80104c56 <wakeup>
  release(&p->lock);
80103eb5:	8b 45 08             	mov    0x8(%ebp),%eax
80103eb8:	89 04 24             	mov    %eax,(%esp)
80103ebb:	e8 f4 0f 00 00       	call   80104eb4 <release>
  return n;
80103ec0:	8b 45 10             	mov    0x10(%ebp),%eax
}
80103ec3:	83 c4 24             	add    $0x24,%esp
80103ec6:	5b                   	pop    %ebx
80103ec7:	5d                   	pop    %ebp
80103ec8:	c3                   	ret    

80103ec9 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103ec9:	55                   	push   %ebp
80103eca:	89 e5                	mov    %esp,%ebp
80103ecc:	53                   	push   %ebx
80103ecd:	83 ec 24             	sub    $0x24,%esp
  int i;

  acquire(&p->lock);
80103ed0:	8b 45 08             	mov    0x8(%ebp),%eax
80103ed3:	89 04 24             	mov    %eax,(%esp)
80103ed6:	e8 78 0f 00 00       	call   80104e53 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103edb:	eb 3a                	jmp    80103f17 <piperead+0x4e>
    if(proc->killed){
80103edd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ee3:	8b 40 24             	mov    0x24(%eax),%eax
80103ee6:	85 c0                	test   %eax,%eax
80103ee8:	74 15                	je     80103eff <piperead+0x36>
      release(&p->lock);
80103eea:	8b 45 08             	mov    0x8(%ebp),%eax
80103eed:	89 04 24             	mov    %eax,(%esp)
80103ef0:	e8 bf 0f 00 00       	call   80104eb4 <release>
      return -1;
80103ef5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103efa:	e9 b6 00 00 00       	jmp    80103fb5 <piperead+0xec>
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103eff:	8b 45 08             	mov    0x8(%ebp),%eax
80103f02:	8b 55 08             	mov    0x8(%ebp),%edx
80103f05:	81 c2 34 02 00 00    	add    $0x234,%edx
80103f0b:	89 44 24 04          	mov    %eax,0x4(%esp)
80103f0f:	89 14 24             	mov    %edx,(%esp)
80103f12:	e8 62 0c 00 00       	call   80104b79 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103f17:	8b 45 08             	mov    0x8(%ebp),%eax
80103f1a:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
80103f20:	8b 45 08             	mov    0x8(%ebp),%eax
80103f23:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103f29:	39 c2                	cmp    %eax,%edx
80103f2b:	75 0d                	jne    80103f3a <piperead+0x71>
80103f2d:	8b 45 08             	mov    0x8(%ebp),%eax
80103f30:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
80103f36:	85 c0                	test   %eax,%eax
80103f38:	75 a3                	jne    80103edd <piperead+0x14>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103f3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103f41:	eb 49                	jmp    80103f8c <piperead+0xc3>
    if(p->nread == p->nwrite)
80103f43:	8b 45 08             	mov    0x8(%ebp),%eax
80103f46:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
80103f4c:	8b 45 08             	mov    0x8(%ebp),%eax
80103f4f:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103f55:	39 c2                	cmp    %eax,%edx
80103f57:	74 3d                	je     80103f96 <piperead+0xcd>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f5c:	89 c2                	mov    %eax,%edx
80103f5e:	03 55 0c             	add    0xc(%ebp),%edx
80103f61:	8b 45 08             	mov    0x8(%ebp),%eax
80103f64:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
80103f6a:	89 c3                	mov    %eax,%ebx
80103f6c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
80103f72:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103f75:	0f b6 4c 19 34       	movzbl 0x34(%ecx,%ebx,1),%ecx
80103f7a:	88 0a                	mov    %cl,(%edx)
80103f7c:	8d 50 01             	lea    0x1(%eax),%edx
80103f7f:	8b 45 08             	mov    0x8(%ebp),%eax
80103f82:	89 90 34 02 00 00    	mov    %edx,0x234(%eax)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103f88:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f8f:	3b 45 10             	cmp    0x10(%ebp),%eax
80103f92:	7c af                	jl     80103f43 <piperead+0x7a>
80103f94:	eb 01                	jmp    80103f97 <piperead+0xce>
    if(p->nread == p->nwrite)
      break;
80103f96:	90                   	nop
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103f97:	8b 45 08             	mov    0x8(%ebp),%eax
80103f9a:	05 38 02 00 00       	add    $0x238,%eax
80103f9f:	89 04 24             	mov    %eax,(%esp)
80103fa2:	e8 af 0c 00 00       	call   80104c56 <wakeup>
  release(&p->lock);
80103fa7:	8b 45 08             	mov    0x8(%ebp),%eax
80103faa:	89 04 24             	mov    %eax,(%esp)
80103fad:	e8 02 0f 00 00       	call   80104eb4 <release>
  return i;
80103fb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80103fb5:	83 c4 24             	add    $0x24,%esp
80103fb8:	5b                   	pop    %ebx
80103fb9:	5d                   	pop    %ebp
80103fba:	c3                   	ret    
	...

80103fbc <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80103fbc:	55                   	push   %ebp
80103fbd:	89 e5                	mov    %esp,%ebp
80103fbf:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103fc2:	9c                   	pushf  
80103fc3:	58                   	pop    %eax
80103fc4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80103fc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80103fca:	c9                   	leave  
80103fcb:	c3                   	ret    

80103fcc <sti>:
  asm volatile("cli");
}

static inline void
sti(void)
{
80103fcc:	55                   	push   %ebp
80103fcd:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80103fcf:	fb                   	sti    
}
80103fd0:	5d                   	pop    %ebp
80103fd1:	c3                   	ret    

80103fd2 <memcop>:

static void wakeup1(void *chan);

    void*
memcop(void *dst, void *src, uint n)
{
80103fd2:	55                   	push   %ebp
80103fd3:	89 e5                	mov    %esp,%ebp
80103fd5:	83 ec 10             	sub    $0x10,%esp
    const char *s;
    char *d;

    s = src;
80103fd8:	8b 45 0c             	mov    0xc(%ebp),%eax
80103fdb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    d = dst;
80103fde:	8b 45 08             	mov    0x8(%ebp),%eax
80103fe1:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if(s < d && s + n > d){
80103fe4:	8b 45 f8             	mov    -0x8(%ebp),%eax
80103fe7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
80103fea:	73 55                	jae    80104041 <memcop+0x6f>
80103fec:	8b 45 10             	mov    0x10(%ebp),%eax
80103fef:	8b 55 f8             	mov    -0x8(%ebp),%edx
80103ff2:	8d 04 02             	lea    (%edx,%eax,1),%eax
80103ff5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
80103ff8:	76 4a                	jbe    80104044 <memcop+0x72>
        s += n;
80103ffa:	8b 45 10             	mov    0x10(%ebp),%eax
80103ffd:	01 45 f8             	add    %eax,-0x8(%ebp)
        d += n;
80104000:	8b 45 10             	mov    0x10(%ebp),%eax
80104003:	01 45 fc             	add    %eax,-0x4(%ebp)
        while(n-- > 0)
80104006:	eb 13                	jmp    8010401b <memcop+0x49>
            *--d = *--s;
80104008:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
8010400c:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
80104010:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104013:	0f b6 10             	movzbl (%eax),%edx
80104016:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104019:	88 10                	mov    %dl,(%eax)
    s = src;
    d = dst;
    if(s < d && s + n > d){
        s += n;
        d += n;
        while(n-- > 0)
8010401b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010401f:	0f 95 c0             	setne  %al
80104022:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80104026:	84 c0                	test   %al,%al
80104028:	75 de                	jne    80104008 <memcop+0x36>
    const char *s;
    char *d;

    s = src;
    d = dst;
    if(s < d && s + n > d){
8010402a:	eb 28                	jmp    80104054 <memcop+0x82>
        d += n;
        while(n-- > 0)
            *--d = *--s;
    } else
        while(n-- > 0)
            *d++ = *s++;
8010402c:	8b 45 f8             	mov    -0x8(%ebp),%eax
8010402f:	0f b6 10             	movzbl (%eax),%edx
80104032:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104035:	88 10                	mov    %dl,(%eax)
80104037:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010403b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
8010403f:	eb 04                	jmp    80104045 <memcop+0x73>
        s += n;
        d += n;
        while(n-- > 0)
            *--d = *--s;
    } else
        while(n-- > 0)
80104041:	90                   	nop
80104042:	eb 01                	jmp    80104045 <memcop+0x73>
80104044:	90                   	nop
80104045:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80104049:	0f 95 c0             	setne  %al
8010404c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80104050:	84 c0                	test   %al,%al
80104052:	75 d8                	jne    8010402c <memcop+0x5a>
            *d++ = *s++;

    return dst;
80104054:	8b 45 08             	mov    0x8(%ebp),%eax
}
80104057:	c9                   	leave  
80104058:	c3                   	ret    

80104059 <pinit>:


    void
pinit(void)
{
80104059:	55                   	push   %ebp
8010405a:	89 e5                	mov    %esp,%ebp
8010405c:	83 ec 18             	sub    $0x18,%esp
    initlock(&ptable.lock, "ptable");
8010405f:	c7 44 24 04 69 87 10 	movl   $0x80108769,0x4(%esp)
80104066:	80 
80104067:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
8010406e:	e8 bf 0d 00 00       	call   80104e32 <initlock>
}
80104073:	c9                   	leave  
80104074:	c3                   	ret    

80104075 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
    static struct proc*
allocproc(void)
{
80104075:	55                   	push   %ebp
80104076:	89 e5                	mov    %esp,%ebp
80104078:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
8010407b:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104082:	e8 cc 0d 00 00       	call   80104e53 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104087:	c7 45 f0 54 ff 10 80 	movl   $0x8010ff54,-0x10(%ebp)
8010408e:	eb 11                	jmp    801040a1 <allocproc+0x2c>
        if(p->state == UNUSED)
80104090:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104093:	8b 40 0c             	mov    0xc(%eax),%eax
80104096:	85 c0                	test   %eax,%eax
80104098:	74 27                	je     801040c1 <allocproc+0x4c>
{
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010409a:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
801040a1:	b8 54 20 11 80       	mov    $0x80112054,%eax
801040a6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
801040a9:	72 e5                	jb     80104090 <allocproc+0x1b>
        if(p->state == UNUSED)
            goto found;
    release(&ptable.lock);
801040ab:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
801040b2:	e8 fd 0d 00 00       	call   80104eb4 <release>
    return 0;
801040b7:	b8 00 00 00 00       	mov    $0x0,%eax
801040bc:	e9 b5 00 00 00       	jmp    80104176 <allocproc+0x101>
    char *sp;

    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if(p->state == UNUSED)
            goto found;
801040c1:	90                   	nop
    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;
801040c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040c5:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
    p->pid = nextpid++;
801040cc:	a1 04 b0 10 80       	mov    0x8010b004,%eax
801040d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
801040d4:	89 42 10             	mov    %eax,0x10(%edx)
801040d7:	83 c0 01             	add    $0x1,%eax
801040da:	a3 04 b0 10 80       	mov    %eax,0x8010b004
    release(&ptable.lock);
801040df:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
801040e6:	e8 c9 0d 00 00       	call   80104eb4 <release>

    // Allocate kernel stack.
    if((p->kstack = kalloc()) == 0){
801040eb:	e8 1a ea ff ff       	call   80102b0a <kalloc>
801040f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
801040f3:	89 42 08             	mov    %eax,0x8(%edx)
801040f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040f9:	8b 40 08             	mov    0x8(%eax),%eax
801040fc:	85 c0                	test   %eax,%eax
801040fe:	75 11                	jne    80104111 <allocproc+0x9c>
        p->state = UNUSED;
80104100:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104103:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        return 0;
8010410a:	b8 00 00 00 00       	mov    $0x0,%eax
8010410f:	eb 65                	jmp    80104176 <allocproc+0x101>
    }
    sp = p->kstack + KSTACKSIZE;
80104111:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104114:	8b 40 08             	mov    0x8(%eax),%eax
80104117:	05 00 10 00 00       	add    $0x1000,%eax
8010411c:	89 45 f4             	mov    %eax,-0xc(%ebp)

    // Leave room for trap frame.
    sp -= sizeof *p->tf;
8010411f:	83 6d f4 4c          	subl   $0x4c,-0xc(%ebp)
    p->tf = (struct trapframe*)sp;
80104123:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104126:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104129:	89 50 18             	mov    %edx,0x18(%eax)

    // Set up new context to start executing at forkret,
    // which returns to trapret.
    sp -= 4;
8010412c:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
    *(uint*)sp = (uint)trapret;
80104130:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104133:	ba 50 65 10 80       	mov    $0x80106550,%edx
80104138:	89 10                	mov    %edx,(%eax)

    sp -= sizeof *p->context;
8010413a:	83 6d f4 14          	subl   $0x14,-0xc(%ebp)
    p->context = (struct context*)sp;
8010413e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104141:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104144:	89 50 1c             	mov    %edx,0x1c(%eax)
    memset(p->context, 0, sizeof *p->context);
80104147:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010414a:	8b 40 1c             	mov    0x1c(%eax),%eax
8010414d:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104154:	00 
80104155:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010415c:	00 
8010415d:	89 04 24             	mov    %eax,(%esp)
80104160:	e8 3d 0f 00 00       	call   801050a2 <memset>
    p->context->eip = (uint)forkret;
80104165:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104168:	8b 40 1c             	mov    0x1c(%eax),%eax
8010416b:	ba 4d 4b 10 80       	mov    $0x80104b4d,%edx
80104170:	89 50 10             	mov    %edx,0x10(%eax)

    return p;
80104173:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80104176:	c9                   	leave  
80104177:	c3                   	ret    

80104178 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
    void
userinit(void)
{
80104178:	55                   	push   %ebp
80104179:	89 e5                	mov    %esp,%ebp
8010417b:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
8010417e:	e8 f2 fe ff ff       	call   80104075 <allocproc>
80104183:	89 45 f4             	mov    %eax,-0xc(%ebp)
    initproc = p;
80104186:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104189:	a3 48 b6 10 80       	mov    %eax,0x8010b648
    if((p->pgdir = setupkvm()) == 0)
8010418e:	e8 a6 3a 00 00       	call   80107c39 <setupkvm>
80104193:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104196:	89 42 04             	mov    %eax,0x4(%edx)
80104199:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010419c:	8b 40 04             	mov    0x4(%eax),%eax
8010419f:	85 c0                	test   %eax,%eax
801041a1:	75 0c                	jne    801041af <userinit+0x37>
        panic("userinit: out of memory?");
801041a3:	c7 04 24 70 87 10 80 	movl   $0x80108770,(%esp)
801041aa:	e8 8b c3 ff ff       	call   8010053a <panic>
    inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801041af:	ba 2c 00 00 00       	mov    $0x2c,%edx
801041b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041b7:	8b 40 04             	mov    0x4(%eax),%eax
801041ba:	89 54 24 08          	mov    %edx,0x8(%esp)
801041be:	c7 44 24 04 e0 b4 10 	movl   $0x8010b4e0,0x4(%esp)
801041c5:	80 
801041c6:	89 04 24             	mov    %eax,(%esp)
801041c9:	e8 c4 3c 00 00       	call   80107e92 <inituvm>
    p->sz = PGSIZE;
801041ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041d1:	c7 00 00 10 00 00    	movl   $0x1000,(%eax)
    memset(p->tf, 0, sizeof(*p->tf));
801041d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041da:	8b 40 18             	mov    0x18(%eax),%eax
801041dd:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
801041e4:	00 
801041e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801041ec:	00 
801041ed:	89 04 24             	mov    %eax,(%esp)
801041f0:	e8 ad 0e 00 00       	call   801050a2 <memset>
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801041f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041f8:	8b 40 18             	mov    0x18(%eax),%eax
801041fb:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80104201:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104204:	8b 40 18             	mov    0x18(%eax),%eax
80104207:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
    p->tf->es = p->tf->ds;
8010420d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104210:	8b 40 18             	mov    0x18(%eax),%eax
80104213:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104216:	8b 52 18             	mov    0x18(%edx),%edx
80104219:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
8010421d:	66 89 50 28          	mov    %dx,0x28(%eax)
    p->tf->ss = p->tf->ds;
80104221:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104224:	8b 40 18             	mov    0x18(%eax),%eax
80104227:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010422a:	8b 52 18             	mov    0x18(%edx),%edx
8010422d:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
80104231:	66 89 50 48          	mov    %dx,0x48(%eax)
    p->tf->eflags = FL_IF;
80104235:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104238:	8b 40 18             	mov    0x18(%eax),%eax
8010423b:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
    p->tf->esp = PGSIZE;
80104242:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104245:	8b 40 18             	mov    0x18(%eax),%eax
80104248:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
    p->tf->eip = 0;  // beginning of initcode.S
8010424f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104252:	8b 40 18             	mov    0x18(%eax),%eax
80104255:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

    safestrcpy(p->name, "initcode", sizeof(p->name));
8010425c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010425f:	83 c0 6c             	add    $0x6c,%eax
80104262:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104269:	00 
8010426a:	c7 44 24 04 89 87 10 	movl   $0x80108789,0x4(%esp)
80104271:	80 
80104272:	89 04 24             	mov    %eax,(%esp)
80104275:	e8 5b 10 00 00       	call   801052d5 <safestrcpy>
    p->cwd = namei("/");
8010427a:	c7 04 24 92 87 10 80 	movl   $0x80108792,(%esp)
80104281:	e8 9d e1 ff ff       	call   80102423 <namei>
80104286:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104289:	89 42 68             	mov    %eax,0x68(%edx)

    p->state = RUNNABLE;
8010428c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010428f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
}
80104296:	c9                   	leave  
80104297:	c3                   	ret    

80104298 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
    int
growproc(int n)
{
80104298:	55                   	push   %ebp
80104299:	89 e5                	mov    %esp,%ebp
8010429b:	83 ec 28             	sub    $0x28,%esp
    uint sz;

    sz = proc->sz;
8010429e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042a4:	8b 00                	mov    (%eax),%eax
801042a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(n > 0){
801042a9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801042ad:	7e 34                	jle    801042e3 <growproc+0x4b>
        if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801042af:	8b 45 08             	mov    0x8(%ebp),%eax
801042b2:	89 c2                	mov    %eax,%edx
801042b4:	03 55 f4             	add    -0xc(%ebp),%edx
801042b7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042bd:	8b 40 04             	mov    0x4(%eax),%eax
801042c0:	89 54 24 08          	mov    %edx,0x8(%esp)
801042c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
801042c7:	89 54 24 04          	mov    %edx,0x4(%esp)
801042cb:	89 04 24             	mov    %eax,(%esp)
801042ce:	e8 3a 3d 00 00       	call   8010800d <allocuvm>
801042d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
801042d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801042da:	75 41                	jne    8010431d <growproc+0x85>
            return -1;
801042dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042e1:	eb 58                	jmp    8010433b <growproc+0xa3>
    } else if(n < 0){
801042e3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801042e7:	79 34                	jns    8010431d <growproc+0x85>
        if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
801042e9:	8b 45 08             	mov    0x8(%ebp),%eax
801042ec:	89 c2                	mov    %eax,%edx
801042ee:	03 55 f4             	add    -0xc(%ebp),%edx
801042f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042f7:	8b 40 04             	mov    0x4(%eax),%eax
801042fa:	89 54 24 08          	mov    %edx,0x8(%esp)
801042fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104301:	89 54 24 04          	mov    %edx,0x4(%esp)
80104305:	89 04 24             	mov    %eax,(%esp)
80104308:	e8 da 3d 00 00       	call   801080e7 <deallocuvm>
8010430d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80104310:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104314:	75 07                	jne    8010431d <growproc+0x85>
            return -1;
80104316:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010431b:	eb 1e                	jmp    8010433b <growproc+0xa3>
    }
    proc->sz = sz;
8010431d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104323:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104326:	89 10                	mov    %edx,(%eax)
    switchuvm(proc);
80104328:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010432e:	89 04 24             	mov    %eax,(%esp)
80104331:	e8 f5 39 00 00       	call   80107d2b <switchuvm>
    return 0;
80104336:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010433b:	c9                   	leave  
8010433c:	c3                   	ret    

8010433d <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
    int
fork(void)
{
8010433d:	55                   	push   %ebp
8010433e:	89 e5                	mov    %esp,%ebp
80104340:	57                   	push   %edi
80104341:	56                   	push   %esi
80104342:	53                   	push   %ebx
80104343:	83 ec 2c             	sub    $0x2c,%esp
    int i, pid;
    struct proc *np;

    // Allocate process.
    if((np = allocproc()) == 0)
80104346:	e8 2a fd ff ff       	call   80104075 <allocproc>
8010434b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010434e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80104352:	75 0a                	jne    8010435e <fork+0x21>
        return -1;
80104354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104359:	e9 47 01 00 00       	jmp    801044a5 <fork+0x168>

    // Copy process state from p.
    if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
8010435e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104364:	8b 10                	mov    (%eax),%edx
80104366:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010436c:	8b 40 04             	mov    0x4(%eax),%eax
8010436f:	89 54 24 04          	mov    %edx,0x4(%esp)
80104373:	89 04 24             	mov    %eax,(%esp)
80104376:	e8 fc 3e 00 00       	call   80108277 <copyuvm>
8010437b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010437e:	89 42 04             	mov    %eax,0x4(%edx)
80104381:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104384:	8b 40 04             	mov    0x4(%eax),%eax
80104387:	85 c0                	test   %eax,%eax
80104389:	75 2c                	jne    801043b7 <fork+0x7a>
        kfree(np->kstack);
8010438b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010438e:	8b 40 08             	mov    0x8(%eax),%eax
80104391:	89 04 24             	mov    %eax,(%esp)
80104394:	e8 d8 e6 ff ff       	call   80102a71 <kfree>
        np->kstack = 0;
80104399:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010439c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        np->state = UNUSED;
801043a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043a6:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        return -1;
801043ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043b2:	e9 ee 00 00 00       	jmp    801044a5 <fork+0x168>
    }
    np->sz = proc->sz;
801043b7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043bd:	8b 10                	mov    (%eax),%edx
801043bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043c2:	89 10                	mov    %edx,(%eax)
    np->parent = proc;
801043c4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801043cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043ce:	89 50 14             	mov    %edx,0x14(%eax)
    *np->tf = *proc->tf;
801043d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043d4:	8b 50 18             	mov    0x18(%eax),%edx
801043d7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043dd:	8b 40 18             	mov    0x18(%eax),%eax
801043e0:	89 c3                	mov    %eax,%ebx
801043e2:	b8 13 00 00 00       	mov    $0x13,%eax
801043e7:	89 d7                	mov    %edx,%edi
801043e9:	89 de                	mov    %ebx,%esi
801043eb:	89 c1                	mov    %eax,%ecx
801043ed:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    np->isthread = 0;
801043ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043f2:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801043f9:	00 00 00 

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;
801043fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043ff:	8b 40 18             	mov    0x18(%eax),%eax
80104402:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

    for(i = 0; i < NOFILE; i++)
80104409:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80104410:	eb 3d                	jmp    8010444f <fork+0x112>
        if(proc->ofile[i])
80104412:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104418:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010441b:	83 c2 08             	add    $0x8,%edx
8010441e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104422:	85 c0                	test   %eax,%eax
80104424:	74 25                	je     8010444b <fork+0x10e>
            np->ofile[i] = filedup(proc->ofile[i]);
80104426:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80104429:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010442f:	8b 55 dc             	mov    -0x24(%ebp),%edx
80104432:	83 c2 08             	add    $0x8,%edx
80104435:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104439:	89 04 24             	mov    %eax,(%esp)
8010443c:	e8 44 cb ff ff       	call   80100f85 <filedup>
80104441:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104444:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104447:	89 44 8a 08          	mov    %eax,0x8(%edx,%ecx,4)
    np->isthread = 0;

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;

    for(i = 0; i < NOFILE; i++)
8010444b:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
8010444f:	83 7d dc 0f          	cmpl   $0xf,-0x24(%ebp)
80104453:	7e bd                	jle    80104412 <fork+0xd5>
        if(proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);
80104455:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010445b:	8b 40 68             	mov    0x68(%eax),%eax
8010445e:	89 04 24             	mov    %eax,(%esp)
80104461:	e8 e3 d3 ff ff       	call   80101849 <idup>
80104466:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104469:	89 42 68             	mov    %eax,0x68(%edx)

    pid = np->pid;
8010446c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010446f:	8b 40 10             	mov    0x10(%eax),%eax
80104472:	89 45 e0             	mov    %eax,-0x20(%ebp)
    np->state = RUNNABLE;
80104475:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104478:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
    safestrcpy(np->name, proc->name, sizeof(proc->name));
8010447f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104485:	8d 50 6c             	lea    0x6c(%eax),%edx
80104488:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010448b:	83 c0 6c             	add    $0x6c,%eax
8010448e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104495:	00 
80104496:	89 54 24 04          	mov    %edx,0x4(%esp)
8010449a:	89 04 24             	mov    %eax,(%esp)
8010449d:	e8 33 0e 00 00       	call   801052d5 <safestrcpy>
    return pid;
801044a2:	8b 45 e0             	mov    -0x20(%ebp),%eax

}
801044a5:	83 c4 2c             	add    $0x2c,%esp
801044a8:	5b                   	pop    %ebx
801044a9:	5e                   	pop    %esi
801044aa:	5f                   	pop    %edi
801044ab:	5d                   	pop    %ebp
801044ac:	c3                   	ret    

801044ad <clone>:

//creat a new process but used parent pgdir. 
int clone(int stack, int size, int routine, int arg){ 
801044ad:	55                   	push   %ebp
801044ae:	89 e5                	mov    %esp,%ebp
801044b0:	57                   	push   %edi
801044b1:	56                   	push   %esi
801044b2:	53                   	push   %ebx
801044b3:	83 ec 3c             	sub    $0x3c,%esp
    int i, pid;
    struct proc *np;

    //cprintf("in clone\n");
    // Allocate process.
    if((np = allocproc()) == 0)
801044b6:	e8 ba fb ff ff       	call   80104075 <allocproc>
801044bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801044be:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
801044c2:	75 0a                	jne    801044ce <clone+0x21>
        return -1;
801044c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801044c9:	e9 eb 01 00 00       	jmp    801046b9 <clone+0x20c>
    if((stack % PGSIZE) != 0 || stack == 0 || routine == 0)
801044ce:	8b 45 08             	mov    0x8(%ebp),%eax
801044d1:	25 ff 0f 00 00       	and    $0xfff,%eax
801044d6:	85 c0                	test   %eax,%eax
801044d8:	75 0c                	jne    801044e6 <clone+0x39>
801044da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801044de:	74 06                	je     801044e6 <clone+0x39>
801044e0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801044e4:	75 0a                	jne    801044f0 <clone+0x43>
        return -1;
801044e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801044eb:	e9 c9 01 00 00       	jmp    801046b9 <clone+0x20c>

    np->pgdir = proc->pgdir;
801044f0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044f6:	8b 50 04             	mov    0x4(%eax),%edx
801044f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801044fc:	89 50 04             	mov    %edx,0x4(%eax)
    np->sz = proc->sz;
801044ff:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104505:	8b 10                	mov    (%eax),%edx
80104507:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010450a:	89 10                	mov    %edx,(%eax)
    np->parent = proc;
8010450c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104513:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104516:	89 50 14             	mov    %edx,0x14(%eax)
    *np->tf = *proc->tf;
80104519:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010451c:	8b 50 18             	mov    0x18(%eax),%edx
8010451f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104525:	8b 40 18             	mov    0x18(%eax),%eax
80104528:	89 c3                	mov    %eax,%ebx
8010452a:	b8 13 00 00 00       	mov    $0x13,%eax
8010452f:	89 d7                	mov    %edx,%edi
80104531:	89 de                	mov    %ebx,%esi
80104533:	89 c1                	mov    %eax,%ecx
80104535:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    np->isthread = 1;
80104537:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010453a:	c7 80 80 00 00 00 01 	movl   $0x1,0x80(%eax)
80104541:	00 00 00 
    pid = np->pid;
80104544:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104547:	8b 40 10             	mov    0x10(%eax),%eax
8010454a:	89 45 d8             	mov    %eax,-0x28(%ebp)

    struct proc *pp;
    pp = proc;
8010454d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104553:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(pp->isthread == 1){
80104556:	eb 09                	jmp    80104561 <clone+0xb4>
        pp = pp->parent;
80104558:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010455b:	8b 40 14             	mov    0x14(%eax),%eax
8010455e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    np->isthread = 1;
    pid = np->pid;

    struct proc *pp;
    pp = proc;
    while(pp->isthread == 1){
80104561:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104564:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
8010456a:	83 f8 01             	cmp    $0x1,%eax
8010456d:	74 e9                	je     80104558 <clone+0xab>
        pp = pp->parent;
    }
    np->parent = pp;
8010456f:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104572:	8b 55 e0             	mov    -0x20(%ebp),%edx
80104575:	89 50 14             	mov    %edx,0x14(%eax)
    //need to be modified as point to the same address
    //*np->ofile = *proc->ofile;
    for(i = 0; i < NOFILE; i++)
80104578:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010457f:	eb 3d                	jmp    801045be <clone+0x111>
        if(proc->ofile[i])
80104581:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104587:	8b 55 d4             	mov    -0x2c(%ebp),%edx
8010458a:	83 c2 08             	add    $0x8,%edx
8010458d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104591:	85 c0                	test   %eax,%eax
80104593:	74 25                	je     801045ba <clone+0x10d>
            np->ofile[i] = filedup(proc->ofile[i]);
80104595:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
80104598:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010459e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
801045a1:	83 c2 08             	add    $0x8,%edx
801045a4:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
801045a8:	89 04 24             	mov    %eax,(%esp)
801045ab:	e8 d5 c9 ff ff       	call   80100f85 <filedup>
801045b0:	8b 55 dc             	mov    -0x24(%ebp),%edx
801045b3:	8d 4b 08             	lea    0x8(%ebx),%ecx
801045b6:	89 44 8a 08          	mov    %eax,0x8(%edx,%ecx,4)
        pp = pp->parent;
    }
    np->parent = pp;
    //need to be modified as point to the same address
    //*np->ofile = *proc->ofile;
    for(i = 0; i < NOFILE; i++)
801045ba:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
801045be:	83 7d d4 0f          	cmpl   $0xf,-0x2c(%ebp)
801045c2:	7e bd                	jle    80104581 <clone+0xd4>
        if(proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;
801045c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801045c7:	8b 40 18             	mov    0x18(%eax),%eax
801045ca:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
//    int offset = (uint)proc->tf->ebp - (uint)proc->tf->esp;
//    cprintf("offset : %d\n",offset);
//    np->tf->esp = (uint)np->tf->ebp - offset;

    uint ustack[2];
    uint sp = stack + PGSIZE;
801045d1:	8b 45 08             	mov    0x8(%ebp),%eax
801045d4:	05 00 10 00 00       	add    $0x1000,%eax
801045d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    np->tf->ebp = sp;
801045dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
801045df:	8b 40 18             	mov    0x18(%eax),%eax
801045e2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801045e5:	89 50 08             	mov    %edx,0x8(%eax)
    ustack[0] = 0xffffffff;
801045e8:	c7 45 cc ff ff ff ff 	movl   $0xffffffff,-0x34(%ebp)
    ustack[1] = arg;
801045ef:	8b 45 14             	mov    0x14(%ebp),%eax
801045f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    sp -= 8;
801045f5:	83 6d e4 08          	subl   $0x8,-0x1c(%ebp)
    if(copyout(np->pgdir,sp,ustack,8)<0){
801045f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801045fc:	8b 40 04             	mov    0x4(%eax),%eax
801045ff:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
80104606:	00 
80104607:	8d 55 cc             	lea    -0x34(%ebp),%edx
8010460a:	89 54 24 08          	mov    %edx,0x8(%esp)
8010460e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104611:	89 54 24 04          	mov    %edx,0x4(%esp)
80104615:	89 04 24             	mov    %eax,(%esp)
80104618:	e8 d9 3d 00 00       	call   801083f6 <copyout>
8010461d:	85 c0                	test   %eax,%eax
8010461f:	79 16                	jns    80104637 <clone+0x18a>
        cprintf("push arg fails\n");
80104621:	c7 04 24 94 87 10 80 	movl   $0x80108794,(%esp)
80104628:	e8 6d bd ff ff       	call   8010039a <cprintf>
        return -1;
8010462d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104632:	e9 82 00 00 00       	jmp    801046b9 <clone+0x20c>
    }
    np->tf->eip = routine;
80104637:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010463a:	8b 40 18             	mov    0x18(%eax),%eax
8010463d:	8b 55 10             	mov    0x10(%ebp),%edx
80104640:	89 50 38             	mov    %edx,0x38(%eax)
    np->tf->esp = sp;
80104643:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104646:	8b 40 18             	mov    0x18(%eax),%eax
80104649:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010464c:	89 50 44             	mov    %edx,0x44(%eax)
    np->cwd = idup(proc->cwd);
8010464f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104655:	8b 40 68             	mov    0x68(%eax),%eax
80104658:	89 04 24             	mov    %eax,(%esp)
8010465b:	e8 e9 d1 ff ff       	call   80101849 <idup>
80104660:	8b 55 dc             	mov    -0x24(%ebp),%edx
80104663:	89 42 68             	mov    %eax,0x68(%edx)

    switchuvm(np);
80104666:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104669:	89 04 24             	mov    %eax,(%esp)
8010466c:	e8 ba 36 00 00       	call   80107d2b <switchuvm>
//    cprintf("parent esp points to : %d\n",proc->tf->esp);
//    cprintf("parent pid : %d\n",proc->pid);
//    cprintf("child pid : %d\n\n",np->pid);


     acquire(&ptable.lock);
80104671:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104678:	e8 d6 07 00 00       	call   80104e53 <acquire>
    np->state = RUNNABLE;
8010467d:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104680:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
     release(&ptable.lock);
80104687:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
8010468e:	e8 21 08 00 00       	call   80104eb4 <release>
    safestrcpy(np->name, proc->name, sizeof(proc->name));
80104693:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104699:	8d 50 6c             	lea    0x6c(%eax),%edx
8010469c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010469f:	83 c0 6c             	add    $0x6c,%eax
801046a2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801046a9:	00 
801046aa:	89 54 24 04          	mov    %edx,0x4(%esp)
801046ae:	89 04 24             	mov    %eax,(%esp)
801046b1:	e8 1f 0c 00 00       	call   801052d5 <safestrcpy>


    return pid;
801046b6:	8b 45 d8             	mov    -0x28(%ebp),%eax

}
801046b9:	83 c4 3c             	add    $0x3c,%esp
801046bc:	5b                   	pop    %ebx
801046bd:	5e                   	pop    %esi
801046be:	5f                   	pop    %edi
801046bf:	5d                   	pop    %ebp
801046c0:	c3                   	ret    

801046c1 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
    void
exit(void)
{
801046c1:	55                   	push   %ebp
801046c2:	89 e5                	mov    %esp,%ebp
801046c4:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;
    int fd;

    if(proc == initproc)
801046c7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801046ce:	a1 48 b6 10 80       	mov    0x8010b648,%eax
801046d3:	39 c2                	cmp    %eax,%edx
801046d5:	75 0c                	jne    801046e3 <exit+0x22>
        panic("init exiting");
801046d7:	c7 04 24 a4 87 10 80 	movl   $0x801087a4,(%esp)
801046de:	e8 57 be ff ff       	call   8010053a <panic>

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
801046e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801046ea:	eb 44                	jmp    80104730 <exit+0x6f>
        if(proc->ofile[fd]){
801046ec:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801046f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
801046f5:	83 c2 08             	add    $0x8,%edx
801046f8:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
801046fc:	85 c0                	test   %eax,%eax
801046fe:	74 2c                	je     8010472c <exit+0x6b>
            fileclose(proc->ofile[fd]);
80104700:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104706:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104709:	83 c2 08             	add    $0x8,%edx
8010470c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104710:	89 04 24             	mov    %eax,(%esp)
80104713:	e8 b5 c8 ff ff       	call   80100fcd <fileclose>
            proc->ofile[fd] = 0;
80104718:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010471e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104721:	83 c2 08             	add    $0x8,%edx
80104724:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
8010472b:	00 

    if(proc == initproc)
        panic("init exiting");

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
8010472c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80104730:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104734:	7e b6                	jle    801046ec <exit+0x2b>
            fileclose(proc->ofile[fd]);
            proc->ofile[fd] = 0;
        }
    }

    iput(proc->cwd);
80104736:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010473c:	8b 40 68             	mov    0x68(%eax),%eax
8010473f:	89 04 24             	mov    %eax,(%esp)
80104742:	e8 ea d2 ff ff       	call   80101a31 <iput>
    proc->cwd = 0;
80104747:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010474d:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

    acquire(&ptable.lock);
80104754:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
8010475b:	e8 f3 06 00 00       	call   80104e53 <acquire>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
80104760:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104766:	8b 40 14             	mov    0x14(%eax),%eax
80104769:	89 04 24             	mov    %eax,(%esp)
8010476c:	e8 a3 04 00 00       	call   80104c14 <wakeup1>

    // Pass abandoned children to init.
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104771:	c7 45 f0 54 ff 10 80 	movl   $0x8010ff54,-0x10(%ebp)
80104778:	eb 3b                	jmp    801047b5 <exit+0xf4>
        if(p->parent == proc){
8010477a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010477d:	8b 50 14             	mov    0x14(%eax),%edx
80104780:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104786:	39 c2                	cmp    %eax,%edx
80104788:	75 24                	jne    801047ae <exit+0xed>
            p->parent = initproc;
8010478a:	8b 15 48 b6 10 80    	mov    0x8010b648,%edx
80104790:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104793:	89 50 14             	mov    %edx,0x14(%eax)
            if(p->state == ZOMBIE)
80104796:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104799:	8b 40 0c             	mov    0xc(%eax),%eax
8010479c:	83 f8 05             	cmp    $0x5,%eax
8010479f:	75 0d                	jne    801047ae <exit+0xed>
                wakeup1(initproc);
801047a1:	a1 48 b6 10 80       	mov    0x8010b648,%eax
801047a6:	89 04 24             	mov    %eax,(%esp)
801047a9:	e8 66 04 00 00       	call   80104c14 <wakeup1>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801047ae:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
801047b5:	b8 54 20 11 80       	mov    $0x80112054,%eax
801047ba:	39 45 f0             	cmp    %eax,-0x10(%ebp)
801047bd:	72 bb                	jb     8010477a <exit+0xb9>
                wakeup1(initproc);
        }
    }

    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
801047bf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047c5:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
    sched();
801047cc:	e8 98 02 00 00       	call   80104a69 <sched>
    panic("zombie exit");
801047d1:	c7 04 24 b1 87 10 80 	movl   $0x801087b1,(%esp)
801047d8:	e8 5d bd ff ff       	call   8010053a <panic>

801047dd <texit>:
}
    void
texit(void)
{
801047dd:	55                   	push   %ebp
801047de:	89 e5                	mov    %esp,%ebp
801047e0:	83 ec 28             	sub    $0x28,%esp
    //  struct proc *p;
    int fd;

    if(proc == initproc)
801047e3:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801047ea:	a1 48 b6 10 80       	mov    0x8010b648,%eax
801047ef:	39 c2                	cmp    %eax,%edx
801047f1:	75 0c                	jne    801047ff <texit+0x22>
        panic("init exiting");
801047f3:	c7 04 24 a4 87 10 80 	movl   $0x801087a4,(%esp)
801047fa:	e8 3b bd ff ff       	call   8010053a <panic>

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
801047ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80104806:	eb 44                	jmp    8010484c <texit+0x6f>
        if(proc->ofile[fd]){
80104808:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010480e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104811:	83 c2 08             	add    $0x8,%edx
80104814:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104818:	85 c0                	test   %eax,%eax
8010481a:	74 2c                	je     80104848 <texit+0x6b>
            fileclose(proc->ofile[fd]);
8010481c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104822:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104825:	83 c2 08             	add    $0x8,%edx
80104828:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
8010482c:	89 04 24             	mov    %eax,(%esp)
8010482f:	e8 99 c7 ff ff       	call   80100fcd <fileclose>
            proc->ofile[fd] = 0;
80104834:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010483a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010483d:	83 c2 08             	add    $0x8,%edx
80104840:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80104847:	00 

    if(proc == initproc)
        panic("init exiting");

    // Close all open files.
    for(fd = 0; fd < NOFILE; fd++){
80104848:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010484c:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104850:	7e b6                	jle    80104808 <texit+0x2b>
        if(proc->ofile[fd]){
            fileclose(proc->ofile[fd]);
            proc->ofile[fd] = 0;
        }
    }
    iput(proc->cwd);
80104852:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104858:	8b 40 68             	mov    0x68(%eax),%eax
8010485b:	89 04 24             	mov    %eax,(%esp)
8010485e:	e8 ce d1 ff ff       	call   80101a31 <iput>
    proc->cwd = 0;
80104863:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104869:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

    acquire(&ptable.lock);
80104870:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104877:	e8 d7 05 00 00       	call   80104e53 <acquire>
    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
8010487c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104882:	8b 40 14             	mov    0x14(%eax),%eax
80104885:	89 04 24             	mov    %eax,(%esp)
80104888:	e8 87 03 00 00       	call   80104c14 <wakeup1>
    //      if(p->state == ZOMBIE)
    //        wakeup1(initproc);
    //    }
    //  }
    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
8010488d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104893:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
    sched();
8010489a:	e8 ca 01 00 00       	call   80104a69 <sched>
    panic("zombie exit");
8010489f:	c7 04 24 b1 87 10 80 	movl   $0x801087b1,(%esp)
801048a6:	e8 8f bc ff ff       	call   8010053a <panic>

801048ab <wait>:
}
// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
    int
wait(void)
{
801048ab:	55                   	push   %ebp
801048ac:	89 e5                	mov    %esp,%ebp
801048ae:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;
    int havekids, pid;

    acquire(&ptable.lock);
801048b1:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
801048b8:	e8 96 05 00 00       	call   80104e53 <acquire>
    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;
801048bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801048c4:	c7 45 ec 54 ff 10 80 	movl   $0x8010ff54,-0x14(%ebp)
801048cb:	e9 ab 00 00 00       	jmp    8010497b <wait+0xd0>
        //    if(p->parent != proc && p->isthread ==1)
            if(p->parent != proc) 
801048d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048d3:	8b 50 14             	mov    0x14(%eax),%edx
801048d6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048dc:	39 c2                	cmp    %eax,%edx
801048de:	0f 85 8f 00 00 00    	jne    80104973 <wait+0xc8>
                continue;
            havekids = 1;
801048e4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
            if(p->state == ZOMBIE){
801048eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048ee:	8b 40 0c             	mov    0xc(%eax),%eax
801048f1:	83 f8 05             	cmp    $0x5,%eax
801048f4:	75 7e                	jne    80104974 <wait+0xc9>
                // Found one.
                pid = p->pid;
801048f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048f9:	8b 40 10             	mov    0x10(%eax),%eax
801048fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
                kfree(p->kstack);
801048ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104902:	8b 40 08             	mov    0x8(%eax),%eax
80104905:	89 04 24             	mov    %eax,(%esp)
80104908:	e8 64 e1 ff ff       	call   80102a71 <kfree>
                p->kstack = 0;
8010490d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104910:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
                if(p->isthread != 1){
80104917:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010491a:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
80104920:	83 f8 01             	cmp    $0x1,%eax
80104923:	74 0e                	je     80104933 <wait+0x88>
                    freevm(p->pgdir);
80104925:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104928:	8b 40 04             	mov    0x4(%eax),%eax
8010492b:	89 04 24             	mov    %eax,(%esp)
8010492e:	e8 70 38 00 00       	call   801081a3 <freevm>
                }
                p->state = UNUSED;
80104933:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104936:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
                p->pid = 0;
8010493d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104940:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
                p->parent = 0;
80104947:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010494a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
                p->name[0] = 0;
80104951:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104954:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
                p->killed = 0;
80104958:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010495b:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
                release(&ptable.lock);
80104962:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104969:	e8 46 05 00 00       	call   80104eb4 <release>
                return pid;
8010496e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104971:	eb 57                	jmp    801049ca <wait+0x11f>
        // Scan through table looking for zombie children.
        havekids = 0;
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        //    if(p->parent != proc && p->isthread ==1)
            if(p->parent != proc) 
                continue;
80104973:	90                   	nop

    acquire(&ptable.lock);
    for(;;){
        // Scan through table looking for zombie children.
        havekids = 0;
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104974:	81 45 ec 84 00 00 00 	addl   $0x84,-0x14(%ebp)
8010497b:	b8 54 20 11 80       	mov    $0x80112054,%eax
80104980:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104983:	0f 82 47 ff ff ff    	jb     801048d0 <wait+0x25>
                return pid;
            }
        }

        // No point waiting if we don't have any children.
        if(!havekids || proc->killed){
80104989:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010498d:	74 0d                	je     8010499c <wait+0xf1>
8010498f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104995:	8b 40 24             	mov    0x24(%eax),%eax
80104998:	85 c0                	test   %eax,%eax
8010499a:	74 13                	je     801049af <wait+0x104>
            release(&ptable.lock);
8010499c:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
801049a3:	e8 0c 05 00 00       	call   80104eb4 <release>
            return -1;
801049a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049ad:	eb 1b                	jmp    801049ca <wait+0x11f>
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock);  //DOC: wait-sleep
801049af:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049b5:	c7 44 24 04 20 ff 10 	movl   $0x8010ff20,0x4(%esp)
801049bc:	80 
801049bd:	89 04 24             	mov    %eax,(%esp)
801049c0:	e8 b4 01 00 00       	call   80104b79 <sleep>
    }
801049c5:	e9 f3 fe ff ff       	jmp    801048bd <wait+0x12>
}
801049ca:	c9                   	leave  
801049cb:	c3                   	ret    

801049cc <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
    void
scheduler(void)
{
801049cc:	55                   	push   %ebp
801049cd:	89 e5                	mov    %esp,%ebp
801049cf:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;

    for(;;){
        // Enable interrupts on this processor.
        sti();
801049d2:	e8 f5 f5 ff ff       	call   80103fcc <sti>

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
801049d7:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
801049de:	e8 70 04 00 00       	call   80104e53 <acquire>
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801049e3:	c7 45 f4 54 ff 10 80 	movl   $0x8010ff54,-0xc(%ebp)
801049ea:	eb 62                	jmp    80104a4e <scheduler+0x82>
            if(p->state != RUNNABLE)
801049ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
801049ef:	8b 40 0c             	mov    0xc(%eax),%eax
801049f2:	83 f8 03             	cmp    $0x3,%eax
801049f5:	75 4f                	jne    80104a46 <scheduler+0x7a>
                continue;

            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
801049f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801049fa:	65 a3 04 00 00 00    	mov    %eax,%gs:0x4
            switchuvm(p);
80104a00:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a03:	89 04 24             	mov    %eax,(%esp)
80104a06:	e8 20 33 00 00       	call   80107d2b <switchuvm>
            p->state = RUNNING;
80104a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a0e:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
            swtch(&cpu->scheduler, proc->context);
80104a15:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a1b:	8b 40 1c             	mov    0x1c(%eax),%eax
80104a1e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104a25:	83 c2 04             	add    $0x4,%edx
80104a28:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a2c:	89 14 24             	mov    %edx,(%esp)
80104a2f:	e8 14 09 00 00       	call   80105348 <swtch>
            switchkvm();
80104a34:	e8 d5 32 00 00       	call   80107d0e <switchkvm>

            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
80104a39:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80104a40:	00 00 00 00 
80104a44:	eb 01                	jmp    80104a47 <scheduler+0x7b>

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
            if(p->state != RUNNABLE)
                continue;
80104a46:	90                   	nop
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104a47:	81 45 f4 84 00 00 00 	addl   $0x84,-0xc(%ebp)
80104a4e:	b8 54 20 11 80       	mov    $0x80112054,%eax
80104a53:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80104a56:	72 94                	jb     801049ec <scheduler+0x20>

            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
        }
        release(&ptable.lock);
80104a58:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104a5f:	e8 50 04 00 00       	call   80104eb4 <release>

    }
80104a64:	e9 69 ff ff ff       	jmp    801049d2 <scheduler+0x6>

80104a69 <sched>:

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
    void
sched(void)
{
80104a69:	55                   	push   %ebp
80104a6a:	89 e5                	mov    %esp,%ebp
80104a6c:	83 ec 28             	sub    $0x28,%esp
    int intena;

    if(!holding(&ptable.lock))
80104a6f:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104a76:	e8 f7 04 00 00       	call   80104f72 <holding>
80104a7b:	85 c0                	test   %eax,%eax
80104a7d:	75 0c                	jne    80104a8b <sched+0x22>
        panic("sched ptable.lock");
80104a7f:	c7 04 24 bd 87 10 80 	movl   $0x801087bd,(%esp)
80104a86:	e8 af ba ff ff       	call   8010053a <panic>
    if(cpu->ncli != 1)
80104a8b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104a91:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80104a97:	83 f8 01             	cmp    $0x1,%eax
80104a9a:	74 0c                	je     80104aa8 <sched+0x3f>
        panic("sched locks");
80104a9c:	c7 04 24 cf 87 10 80 	movl   $0x801087cf,(%esp)
80104aa3:	e8 92 ba ff ff       	call   8010053a <panic>
    if(proc->state == RUNNING)
80104aa8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104aae:	8b 40 0c             	mov    0xc(%eax),%eax
80104ab1:	83 f8 04             	cmp    $0x4,%eax
80104ab4:	75 0c                	jne    80104ac2 <sched+0x59>
        panic("sched running");
80104ab6:	c7 04 24 db 87 10 80 	movl   $0x801087db,(%esp)
80104abd:	e8 78 ba ff ff       	call   8010053a <panic>
    if(readeflags()&FL_IF)
80104ac2:	e8 f5 f4 ff ff       	call   80103fbc <readeflags>
80104ac7:	25 00 02 00 00       	and    $0x200,%eax
80104acc:	85 c0                	test   %eax,%eax
80104ace:	74 0c                	je     80104adc <sched+0x73>
        panic("sched interruptible");
80104ad0:	c7 04 24 e9 87 10 80 	movl   $0x801087e9,(%esp)
80104ad7:	e8 5e ba ff ff       	call   8010053a <panic>
    intena = cpu->intena;
80104adc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104ae2:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    swtch(&proc->context, cpu->scheduler);
80104aeb:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104af1:	8b 40 04             	mov    0x4(%eax),%eax
80104af4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104afb:	83 c2 1c             	add    $0x1c,%edx
80104afe:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b02:	89 14 24             	mov    %edx,(%esp)
80104b05:	e8 3e 08 00 00       	call   80105348 <swtch>
    cpu->intena = intena;
80104b0a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104b10:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b13:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80104b19:	c9                   	leave  
80104b1a:	c3                   	ret    

80104b1b <yield>:

// Give up the CPU for one scheduling round.
    void
yield(void)
{
80104b1b:	55                   	push   %ebp
80104b1c:	89 e5                	mov    %esp,%ebp
80104b1e:	83 ec 18             	sub    $0x18,%esp
    acquire(&ptable.lock);  //DOC: yieldlock
80104b21:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104b28:	e8 26 03 00 00       	call   80104e53 <acquire>
    proc->state = RUNNABLE;
80104b2d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b33:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
    sched();
80104b3a:	e8 2a ff ff ff       	call   80104a69 <sched>
    release(&ptable.lock);
80104b3f:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104b46:	e8 69 03 00 00       	call   80104eb4 <release>
}
80104b4b:	c9                   	leave  
80104b4c:	c3                   	ret    

80104b4d <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
    void
forkret(void)
{
80104b4d:	55                   	push   %ebp
80104b4e:	89 e5                	mov    %esp,%ebp
80104b50:	83 ec 18             	sub    $0x18,%esp
    static int first = 1;
    // Still holding ptable.lock from scheduler.
    release(&ptable.lock);
80104b53:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104b5a:	e8 55 03 00 00       	call   80104eb4 <release>

    if (first) {
80104b5f:	a1 20 b0 10 80       	mov    0x8010b020,%eax
80104b64:	85 c0                	test   %eax,%eax
80104b66:	74 0f                	je     80104b77 <forkret+0x2a>
        // Some initialization functions must be run in the context
        // of a regular process (e.g., they call sleep), and thus cannot 
        // be run from main().
        first = 0;
80104b68:	c7 05 20 b0 10 80 00 	movl   $0x0,0x8010b020
80104b6f:	00 00 00 
        initlog();
80104b72:	e8 8d e4 ff ff       	call   80103004 <initlog>
    }

    // Return to "caller", actually trapret (see allocproc).
}
80104b77:	c9                   	leave  
80104b78:	c3                   	ret    

80104b79 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
    void
sleep(void *chan, struct spinlock *lk)
{
80104b79:	55                   	push   %ebp
80104b7a:	89 e5                	mov    %esp,%ebp
80104b7c:	83 ec 18             	sub    $0x18,%esp
    if(proc == 0)
80104b7f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b85:	85 c0                	test   %eax,%eax
80104b87:	75 0c                	jne    80104b95 <sleep+0x1c>
        panic("sleep");
80104b89:	c7 04 24 fd 87 10 80 	movl   $0x801087fd,(%esp)
80104b90:	e8 a5 b9 ff ff       	call   8010053a <panic>

    if(lk == 0)
80104b95:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80104b99:	75 0c                	jne    80104ba7 <sleep+0x2e>
        panic("sleep without lk");
80104b9b:	c7 04 24 03 88 10 80 	movl   $0x80108803,(%esp)
80104ba2:	e8 93 b9 ff ff       	call   8010053a <panic>
    // change p->state and then call sched.
    // Once we hold ptable.lock, we can be
    // guaranteed that we won't miss any wakeup
    // (wakeup runs with ptable.lock locked),
    // so it's okay to release lk.
    if(lk != &ptable.lock){  //DOC: sleeplock0
80104ba7:	81 7d 0c 20 ff 10 80 	cmpl   $0x8010ff20,0xc(%ebp)
80104bae:	74 17                	je     80104bc7 <sleep+0x4e>
        acquire(&ptable.lock);  //DOC: sleeplock1
80104bb0:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104bb7:	e8 97 02 00 00       	call   80104e53 <acquire>
        release(lk);
80104bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
80104bbf:	89 04 24             	mov    %eax,(%esp)
80104bc2:	e8 ed 02 00 00       	call   80104eb4 <release>
    }

    // Go to sleep.
    proc->chan = chan;
80104bc7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104bcd:	8b 55 08             	mov    0x8(%ebp),%edx
80104bd0:	89 50 20             	mov    %edx,0x20(%eax)
    proc->state = SLEEPING;
80104bd3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104bd9:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
    sched();
80104be0:	e8 84 fe ff ff       	call   80104a69 <sched>

    // Tidy up.
    proc->chan = 0;
80104be5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104beb:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

    // Reacquire original lock.
    if(lk != &ptable.lock){  //DOC: sleeplock2
80104bf2:	81 7d 0c 20 ff 10 80 	cmpl   $0x8010ff20,0xc(%ebp)
80104bf9:	74 17                	je     80104c12 <sleep+0x99>
        release(&ptable.lock);
80104bfb:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104c02:	e8 ad 02 00 00       	call   80104eb4 <release>
        acquire(lk);
80104c07:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c0a:	89 04 24             	mov    %eax,(%esp)
80104c0d:	e8 41 02 00 00       	call   80104e53 <acquire>
    }
}
80104c12:	c9                   	leave  
80104c13:	c3                   	ret    

80104c14 <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
    static void
wakeup1(void *chan)
{
80104c14:	55                   	push   %ebp
80104c15:	89 e5                	mov    %esp,%ebp
80104c17:	83 ec 10             	sub    $0x10,%esp
    struct proc *p;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104c1a:	c7 45 fc 54 ff 10 80 	movl   $0x8010ff54,-0x4(%ebp)
80104c21:	eb 27                	jmp    80104c4a <wakeup1+0x36>
        if(p->state == SLEEPING && p->chan == chan)
80104c23:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104c26:	8b 40 0c             	mov    0xc(%eax),%eax
80104c29:	83 f8 02             	cmp    $0x2,%eax
80104c2c:	75 15                	jne    80104c43 <wakeup1+0x2f>
80104c2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104c31:	8b 40 20             	mov    0x20(%eax),%eax
80104c34:	3b 45 08             	cmp    0x8(%ebp),%eax
80104c37:	75 0a                	jne    80104c43 <wakeup1+0x2f>
            p->state = RUNNABLE;
80104c39:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104c3c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
    static void
wakeup1(void *chan)
{
    struct proc *p;

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104c43:	81 45 fc 84 00 00 00 	addl   $0x84,-0x4(%ebp)
80104c4a:	b8 54 20 11 80       	mov    $0x80112054,%eax
80104c4f:	39 45 fc             	cmp    %eax,-0x4(%ebp)
80104c52:	72 cf                	jb     80104c23 <wakeup1+0xf>
        if(p->state == SLEEPING && p->chan == chan)
            p->state = RUNNABLE;
}
80104c54:	c9                   	leave  
80104c55:	c3                   	ret    

80104c56 <wakeup>:

// Wake up all processes sleeping on chan.
    void
wakeup(void *chan)
{
80104c56:	55                   	push   %ebp
80104c57:	89 e5                	mov    %esp,%ebp
80104c59:	83 ec 18             	sub    $0x18,%esp
    acquire(&ptable.lock);
80104c5c:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104c63:	e8 eb 01 00 00       	call   80104e53 <acquire>
    wakeup1(chan);
80104c68:	8b 45 08             	mov    0x8(%ebp),%eax
80104c6b:	89 04 24             	mov    %eax,(%esp)
80104c6e:	e8 a1 ff ff ff       	call   80104c14 <wakeup1>
    release(&ptable.lock);
80104c73:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104c7a:	e8 35 02 00 00       	call   80104eb4 <release>
}
80104c7f:	c9                   	leave  
80104c80:	c3                   	ret    

80104c81 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
    int
kill(int pid)
{
80104c81:	55                   	push   %ebp
80104c82:	89 e5                	mov    %esp,%ebp
80104c84:	83 ec 28             	sub    $0x28,%esp
    struct proc *p;

    acquire(&ptable.lock);
80104c87:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104c8e:	e8 c0 01 00 00       	call   80104e53 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104c93:	c7 45 f4 54 ff 10 80 	movl   $0x8010ff54,-0xc(%ebp)
80104c9a:	eb 44                	jmp    80104ce0 <kill+0x5f>
        if(p->pid == pid){
80104c9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c9f:	8b 40 10             	mov    0x10(%eax),%eax
80104ca2:	3b 45 08             	cmp    0x8(%ebp),%eax
80104ca5:	75 32                	jne    80104cd9 <kill+0x58>
            p->killed = 1;
80104ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104caa:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
            // Wake process from sleep if necessary.
            if(p->state == SLEEPING)
80104cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cb4:	8b 40 0c             	mov    0xc(%eax),%eax
80104cb7:	83 f8 02             	cmp    $0x2,%eax
80104cba:	75 0a                	jne    80104cc6 <kill+0x45>
                p->state = RUNNABLE;
80104cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cbf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
            release(&ptable.lock);
80104cc6:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104ccd:	e8 e2 01 00 00       	call   80104eb4 <release>
            return 0;
80104cd2:	b8 00 00 00 00       	mov    $0x0,%eax
80104cd7:	eb 22                	jmp    80104cfb <kill+0x7a>
kill(int pid)
{
    struct proc *p;

    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104cd9:	81 45 f4 84 00 00 00 	addl   $0x84,-0xc(%ebp)
80104ce0:	b8 54 20 11 80       	mov    $0x80112054,%eax
80104ce5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80104ce8:	72 b2                	jb     80104c9c <kill+0x1b>
                p->state = RUNNABLE;
            release(&ptable.lock);
            return 0;
        }
    }
    release(&ptable.lock);
80104cea:	c7 04 24 20 ff 10 80 	movl   $0x8010ff20,(%esp)
80104cf1:	e8 be 01 00 00       	call   80104eb4 <release>
    return -1;
80104cf6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104cfb:	c9                   	leave  
80104cfc:	c3                   	ret    

80104cfd <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
    void
procdump(void)
{
80104cfd:	55                   	push   %ebp
80104cfe:	89 e5                	mov    %esp,%ebp
80104d00:	83 ec 58             	sub    $0x58,%esp
    int i;
    struct proc *p;
    char *state;
    uint pc[10];

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104d03:	c7 45 f0 54 ff 10 80 	movl   $0x8010ff54,-0x10(%ebp)
80104d0a:	e9 db 00 00 00       	jmp    80104dea <procdump+0xed>
        if(p->state == UNUSED)
80104d0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d12:	8b 40 0c             	mov    0xc(%eax),%eax
80104d15:	85 c0                	test   %eax,%eax
80104d17:	0f 84 c5 00 00 00    	je     80104de2 <procdump+0xe5>
            continue;
        if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d20:	8b 40 0c             	mov    0xc(%eax),%eax
80104d23:	83 f8 05             	cmp    $0x5,%eax
80104d26:	77 23                	ja     80104d4b <procdump+0x4e>
80104d28:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d2b:	8b 40 0c             	mov    0xc(%eax),%eax
80104d2e:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104d35:	85 c0                	test   %eax,%eax
80104d37:	74 12                	je     80104d4b <procdump+0x4e>
            state = states[p->state];
80104d39:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d3c:	8b 40 0c             	mov    0xc(%eax),%eax
80104d3f:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104d46:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint pc[10];

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->state == UNUSED)
            continue;
        if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104d49:	eb 07                	jmp    80104d52 <procdump+0x55>
            state = states[p->state];
        else
            state = "???";
80104d4b:	c7 45 f4 14 88 10 80 	movl   $0x80108814,-0xc(%ebp)
        cprintf("%d %s %s", p->pid, state, p->name);
80104d52:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d55:	8d 50 6c             	lea    0x6c(%eax),%edx
80104d58:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d5b:	8b 40 10             	mov    0x10(%eax),%eax
80104d5e:	89 54 24 0c          	mov    %edx,0xc(%esp)
80104d62:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d65:	89 54 24 08          	mov    %edx,0x8(%esp)
80104d69:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d6d:	c7 04 24 18 88 10 80 	movl   $0x80108818,(%esp)
80104d74:	e8 21 b6 ff ff       	call   8010039a <cprintf>
        if(p->state == SLEEPING){
80104d79:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d7c:	8b 40 0c             	mov    0xc(%eax),%eax
80104d7f:	83 f8 02             	cmp    $0x2,%eax
80104d82:	75 50                	jne    80104dd4 <procdump+0xd7>
            getcallerpcs((uint*)p->context->ebp+2, pc);
80104d84:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104d87:	8b 40 1c             	mov    0x1c(%eax),%eax
80104d8a:	8b 40 0c             	mov    0xc(%eax),%eax
80104d8d:	83 c0 08             	add    $0x8,%eax
80104d90:	8d 55 c4             	lea    -0x3c(%ebp),%edx
80104d93:	89 54 24 04          	mov    %edx,0x4(%esp)
80104d97:	89 04 24             	mov    %eax,(%esp)
80104d9a:	e8 64 01 00 00       	call   80104f03 <getcallerpcs>
            for(i=0; i<10 && pc[i] != 0; i++)
80104d9f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80104da6:	eb 1b                	jmp    80104dc3 <procdump+0xc6>
                cprintf(" %p", pc[i]);
80104da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104dab:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104daf:	89 44 24 04          	mov    %eax,0x4(%esp)
80104db3:	c7 04 24 21 88 10 80 	movl   $0x80108821,(%esp)
80104dba:	e8 db b5 ff ff       	call   8010039a <cprintf>
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if(p->state == SLEEPING){
            getcallerpcs((uint*)p->context->ebp+2, pc);
            for(i=0; i<10 && pc[i] != 0; i++)
80104dbf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80104dc3:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
80104dc7:	7f 0b                	jg     80104dd4 <procdump+0xd7>
80104dc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104dcc:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104dd0:	85 c0                	test   %eax,%eax
80104dd2:	75 d4                	jne    80104da8 <procdump+0xab>
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
80104dd4:	c7 04 24 25 88 10 80 	movl   $0x80108825,(%esp)
80104ddb:	e8 ba b5 ff ff       	call   8010039a <cprintf>
80104de0:	eb 01                	jmp    80104de3 <procdump+0xe6>
    char *state;
    uint pc[10];

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
        if(p->state == UNUSED)
            continue;
80104de2:	90                   	nop
    int i;
    struct proc *p;
    char *state;
    uint pc[10];

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104de3:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
80104dea:	b8 54 20 11 80       	mov    $0x80112054,%eax
80104def:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104df2:	0f 82 17 ff ff ff    	jb     80104d0f <procdump+0x12>
            for(i=0; i<10 && pc[i] != 0; i++)
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
    }
}
80104df8:	c9                   	leave  
80104df9:	c3                   	ret    
	...

80104dfc <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80104dfc:	55                   	push   %ebp
80104dfd:	89 e5                	mov    %esp,%ebp
80104dff:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104e02:	9c                   	pushf  
80104e03:	58                   	pop    %eax
80104e04:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80104e07:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104e0a:	c9                   	leave  
80104e0b:	c3                   	ret    

80104e0c <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
80104e0c:	55                   	push   %ebp
80104e0d:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
80104e0f:	fa                   	cli    
}
80104e10:	5d                   	pop    %ebp
80104e11:	c3                   	ret    

80104e12 <sti>:

static inline void
sti(void)
{
80104e12:	55                   	push   %ebp
80104e13:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80104e15:	fb                   	sti    
}
80104e16:	5d                   	pop    %ebp
80104e17:	c3                   	ret    

80104e18 <xchg>:

static inline uint
xchg(volatile uint *addr, uint newval)
{
80104e18:	55                   	push   %ebp
80104e19:	89 e5                	mov    %esp,%ebp
80104e1b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104e1e:	8b 55 08             	mov    0x8(%ebp),%edx
80104e21:	8b 45 0c             	mov    0xc(%ebp),%eax
80104e24:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104e27:	f0 87 02             	lock xchg %eax,(%edx)
80104e2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
80104e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104e30:	c9                   	leave  
80104e31:	c3                   	ret    

80104e32 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104e32:	55                   	push   %ebp
80104e33:	89 e5                	mov    %esp,%ebp
  lk->name = name;
80104e35:	8b 45 08             	mov    0x8(%ebp),%eax
80104e38:	8b 55 0c             	mov    0xc(%ebp),%edx
80104e3b:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80104e3e:	8b 45 08             	mov    0x8(%ebp),%eax
80104e41:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80104e47:	8b 45 08             	mov    0x8(%ebp),%eax
80104e4a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104e51:	5d                   	pop    %ebp
80104e52:	c3                   	ret    

80104e53 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104e53:	55                   	push   %ebp
80104e54:	89 e5                	mov    %esp,%ebp
80104e56:	83 ec 18             	sub    $0x18,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104e59:	e8 3e 01 00 00       	call   80104f9c <pushcli>
  if(holding(lk))
80104e5e:	8b 45 08             	mov    0x8(%ebp),%eax
80104e61:	89 04 24             	mov    %eax,(%esp)
80104e64:	e8 09 01 00 00       	call   80104f72 <holding>
80104e69:	85 c0                	test   %eax,%eax
80104e6b:	74 0c                	je     80104e79 <acquire+0x26>
    panic("acquire");
80104e6d:	c7 04 24 51 88 10 80 	movl   $0x80108851,(%esp)
80104e74:	e8 c1 b6 ff ff       	call   8010053a <panic>

  // The xchg is atomic.
  // It also serializes, so that reads after acquire are not
  // reordered before it. 
  while(xchg(&lk->locked, 1) != 0)
80104e79:	8b 45 08             	mov    0x8(%ebp),%eax
80104e7c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80104e83:	00 
80104e84:	89 04 24             	mov    %eax,(%esp)
80104e87:	e8 8c ff ff ff       	call   80104e18 <xchg>
80104e8c:	85 c0                	test   %eax,%eax
80104e8e:	75 e9                	jne    80104e79 <acquire+0x26>
    ;

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104e90:	8b 45 08             	mov    0x8(%ebp),%eax
80104e93:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104e9a:	89 50 08             	mov    %edx,0x8(%eax)
  getcallerpcs(&lk, lk->pcs);
80104e9d:	8b 45 08             	mov    0x8(%ebp),%eax
80104ea0:	83 c0 0c             	add    $0xc,%eax
80104ea3:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ea7:	8d 45 08             	lea    0x8(%ebp),%eax
80104eaa:	89 04 24             	mov    %eax,(%esp)
80104ead:	e8 51 00 00 00       	call   80104f03 <getcallerpcs>
}
80104eb2:	c9                   	leave  
80104eb3:	c3                   	ret    

80104eb4 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
80104eb4:	55                   	push   %ebp
80104eb5:	89 e5                	mov    %esp,%ebp
80104eb7:	83 ec 18             	sub    $0x18,%esp
  if(!holding(lk))
80104eba:	8b 45 08             	mov    0x8(%ebp),%eax
80104ebd:	89 04 24             	mov    %eax,(%esp)
80104ec0:	e8 ad 00 00 00       	call   80104f72 <holding>
80104ec5:	85 c0                	test   %eax,%eax
80104ec7:	75 0c                	jne    80104ed5 <release+0x21>
    panic("release");
80104ec9:	c7 04 24 59 88 10 80 	movl   $0x80108859,(%esp)
80104ed0:	e8 65 b6 ff ff       	call   8010053a <panic>

  lk->pcs[0] = 0;
80104ed5:	8b 45 08             	mov    0x8(%ebp),%eax
80104ed8:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104edf:	8b 45 08             	mov    0x8(%ebp),%eax
80104ee2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // But the 2007 Intel 64 Architecture Memory Ordering White
  // Paper says that Intel 64 and IA-32 will not move a load
  // after a store. So lock->locked = 0 would work here.
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);
80104ee9:	8b 45 08             	mov    0x8(%ebp),%eax
80104eec:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104ef3:	00 
80104ef4:	89 04 24             	mov    %eax,(%esp)
80104ef7:	e8 1c ff ff ff       	call   80104e18 <xchg>

  popcli();
80104efc:	e8 e3 00 00 00       	call   80104fe4 <popcli>
}
80104f01:	c9                   	leave  
80104f02:	c3                   	ret    

80104f03 <getcallerpcs>:

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104f03:	55                   	push   %ebp
80104f04:	89 e5                	mov    %esp,%ebp
80104f06:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
80104f09:	8b 45 08             	mov    0x8(%ebp),%eax
80104f0c:	83 e8 08             	sub    $0x8,%eax
80104f0f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(i = 0; i < 10; i++){
80104f12:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80104f19:	eb 34                	jmp    80104f4f <getcallerpcs+0x4c>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104f1b:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
80104f1f:	74 49                	je     80104f6a <getcallerpcs+0x67>
80104f21:	81 7d f8 ff ff ff 7f 	cmpl   $0x7fffffff,-0x8(%ebp)
80104f28:	76 40                	jbe    80104f6a <getcallerpcs+0x67>
80104f2a:	83 7d f8 ff          	cmpl   $0xffffffff,-0x8(%ebp)
80104f2e:	74 3a                	je     80104f6a <getcallerpcs+0x67>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104f30:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104f33:	c1 e0 02             	shl    $0x2,%eax
80104f36:	03 45 0c             	add    0xc(%ebp),%eax
80104f39:	8b 55 f8             	mov    -0x8(%ebp),%edx
80104f3c:	83 c2 04             	add    $0x4,%edx
80104f3f:	8b 12                	mov    (%edx),%edx
80104f41:	89 10                	mov    %edx,(%eax)
    ebp = (uint*)ebp[0]; // saved %ebp
80104f43:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104f46:	8b 00                	mov    (%eax),%eax
80104f48:	89 45 f8             	mov    %eax,-0x8(%ebp)
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104f4b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104f4f:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104f53:	7e c6                	jle    80104f1b <getcallerpcs+0x18>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104f55:	eb 13                	jmp    80104f6a <getcallerpcs+0x67>
    pcs[i] = 0;
80104f57:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104f5a:	c1 e0 02             	shl    $0x2,%eax
80104f5d:	03 45 0c             	add    0xc(%ebp),%eax
80104f60:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104f66:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104f6a:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104f6e:	7e e7                	jle    80104f57 <getcallerpcs+0x54>
    pcs[i] = 0;
}
80104f70:	c9                   	leave  
80104f71:	c3                   	ret    

80104f72 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104f72:	55                   	push   %ebp
80104f73:	89 e5                	mov    %esp,%ebp
  return lock->locked && lock->cpu == cpu;
80104f75:	8b 45 08             	mov    0x8(%ebp),%eax
80104f78:	8b 00                	mov    (%eax),%eax
80104f7a:	85 c0                	test   %eax,%eax
80104f7c:	74 17                	je     80104f95 <holding+0x23>
80104f7e:	8b 45 08             	mov    0x8(%ebp),%eax
80104f81:	8b 50 08             	mov    0x8(%eax),%edx
80104f84:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104f8a:	39 c2                	cmp    %eax,%edx
80104f8c:	75 07                	jne    80104f95 <holding+0x23>
80104f8e:	b8 01 00 00 00       	mov    $0x1,%eax
80104f93:	eb 05                	jmp    80104f9a <holding+0x28>
80104f95:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104f9a:	5d                   	pop    %ebp
80104f9b:	c3                   	ret    

80104f9c <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104f9c:	55                   	push   %ebp
80104f9d:	89 e5                	mov    %esp,%ebp
80104f9f:	83 ec 10             	sub    $0x10,%esp
  int eflags;
  
  eflags = readeflags();
80104fa2:	e8 55 fe ff ff       	call   80104dfc <readeflags>
80104fa7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  cli();
80104faa:	e8 5d fe ff ff       	call   80104e0c <cli>
  if(cpu->ncli++ == 0)
80104faf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104fb5:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104fbb:	85 d2                	test   %edx,%edx
80104fbd:	0f 94 c1             	sete   %cl
80104fc0:	83 c2 01             	add    $0x1,%edx
80104fc3:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80104fc9:	84 c9                	test   %cl,%cl
80104fcb:	74 15                	je     80104fe2 <pushcli+0x46>
    cpu->intena = eflags & FL_IF;
80104fcd:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104fd3:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104fd6:	81 e2 00 02 00 00    	and    $0x200,%edx
80104fdc:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80104fe2:	c9                   	leave  
80104fe3:	c3                   	ret    

80104fe4 <popcli>:

void
popcli(void)
{
80104fe4:	55                   	push   %ebp
80104fe5:	89 e5                	mov    %esp,%ebp
80104fe7:	83 ec 18             	sub    $0x18,%esp
  if(readeflags()&FL_IF)
80104fea:	e8 0d fe ff ff       	call   80104dfc <readeflags>
80104fef:	25 00 02 00 00       	and    $0x200,%eax
80104ff4:	85 c0                	test   %eax,%eax
80104ff6:	74 0c                	je     80105004 <popcli+0x20>
    panic("popcli - interruptible");
80104ff8:	c7 04 24 61 88 10 80 	movl   $0x80108861,(%esp)
80104fff:	e8 36 b5 ff ff       	call   8010053a <panic>
  if(--cpu->ncli < 0)
80105004:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010500a:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80105010:	83 ea 01             	sub    $0x1,%edx
80105013:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80105019:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
8010501f:	85 c0                	test   %eax,%eax
80105021:	79 0c                	jns    8010502f <popcli+0x4b>
    panic("popcli");
80105023:	c7 04 24 78 88 10 80 	movl   $0x80108878,(%esp)
8010502a:	e8 0b b5 ff ff       	call   8010053a <panic>
  if(cpu->ncli == 0 && cpu->intena)
8010502f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105035:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
8010503b:	85 c0                	test   %eax,%eax
8010503d:	75 15                	jne    80105054 <popcli+0x70>
8010503f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105045:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
8010504b:	85 c0                	test   %eax,%eax
8010504d:	74 05                	je     80105054 <popcli+0x70>
    sti();
8010504f:	e8 be fd ff ff       	call   80104e12 <sti>
}
80105054:	c9                   	leave  
80105055:	c3                   	ret    
	...

80105058 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
80105058:	55                   	push   %ebp
80105059:	89 e5                	mov    %esp,%ebp
8010505b:	57                   	push   %edi
8010505c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
8010505d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80105060:	8b 55 10             	mov    0x10(%ebp),%edx
80105063:	8b 45 0c             	mov    0xc(%ebp),%eax
80105066:	89 cb                	mov    %ecx,%ebx
80105068:	89 df                	mov    %ebx,%edi
8010506a:	89 d1                	mov    %edx,%ecx
8010506c:	fc                   	cld    
8010506d:	f3 aa                	rep stos %al,%es:(%edi)
8010506f:	89 ca                	mov    %ecx,%edx
80105071:	89 fb                	mov    %edi,%ebx
80105073:	89 5d 08             	mov    %ebx,0x8(%ebp)
80105076:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
80105079:	5b                   	pop    %ebx
8010507a:	5f                   	pop    %edi
8010507b:	5d                   	pop    %ebp
8010507c:	c3                   	ret    

8010507d <stosl>:

static inline void
stosl(void *addr, int data, int cnt)
{
8010507d:	55                   	push   %ebp
8010507e:	89 e5                	mov    %esp,%ebp
80105080:	57                   	push   %edi
80105081:	53                   	push   %ebx
  asm volatile("cld; rep stosl" :
80105082:	8b 4d 08             	mov    0x8(%ebp),%ecx
80105085:	8b 55 10             	mov    0x10(%ebp),%edx
80105088:	8b 45 0c             	mov    0xc(%ebp),%eax
8010508b:	89 cb                	mov    %ecx,%ebx
8010508d:	89 df                	mov    %ebx,%edi
8010508f:	89 d1                	mov    %edx,%ecx
80105091:	fc                   	cld    
80105092:	f3 ab                	rep stos %eax,%es:(%edi)
80105094:	89 ca                	mov    %ecx,%edx
80105096:	89 fb                	mov    %edi,%ebx
80105098:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010509b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
8010509e:	5b                   	pop    %ebx
8010509f:	5f                   	pop    %edi
801050a0:	5d                   	pop    %ebp
801050a1:	c3                   	ret    

801050a2 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801050a2:	55                   	push   %ebp
801050a3:	89 e5                	mov    %esp,%ebp
801050a5:	83 ec 0c             	sub    $0xc,%esp
  if ((int)dst%4 == 0 && n%4 == 0){
801050a8:	8b 45 08             	mov    0x8(%ebp),%eax
801050ab:	83 e0 03             	and    $0x3,%eax
801050ae:	85 c0                	test   %eax,%eax
801050b0:	75 49                	jne    801050fb <memset+0x59>
801050b2:	8b 45 10             	mov    0x10(%ebp),%eax
801050b5:	83 e0 03             	and    $0x3,%eax
801050b8:	85 c0                	test   %eax,%eax
801050ba:	75 3f                	jne    801050fb <memset+0x59>
    c &= 0xFF;
801050bc:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
801050c3:	8b 45 10             	mov    0x10(%ebp),%eax
801050c6:	c1 e8 02             	shr    $0x2,%eax
801050c9:	89 c2                	mov    %eax,%edx
801050cb:	8b 45 0c             	mov    0xc(%ebp),%eax
801050ce:	89 c1                	mov    %eax,%ecx
801050d0:	c1 e1 18             	shl    $0x18,%ecx
801050d3:	8b 45 0c             	mov    0xc(%ebp),%eax
801050d6:	c1 e0 10             	shl    $0x10,%eax
801050d9:	09 c1                	or     %eax,%ecx
801050db:	8b 45 0c             	mov    0xc(%ebp),%eax
801050de:	c1 e0 08             	shl    $0x8,%eax
801050e1:	09 c8                	or     %ecx,%eax
801050e3:	0b 45 0c             	or     0xc(%ebp),%eax
801050e6:	89 54 24 08          	mov    %edx,0x8(%esp)
801050ea:	89 44 24 04          	mov    %eax,0x4(%esp)
801050ee:	8b 45 08             	mov    0x8(%ebp),%eax
801050f1:	89 04 24             	mov    %eax,(%esp)
801050f4:	e8 84 ff ff ff       	call   8010507d <stosl>
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
801050f9:	eb 19                	jmp    80105114 <memset+0x72>
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
801050fb:	8b 45 10             	mov    0x10(%ebp),%eax
801050fe:	89 44 24 08          	mov    %eax,0x8(%esp)
80105102:	8b 45 0c             	mov    0xc(%ebp),%eax
80105105:	89 44 24 04          	mov    %eax,0x4(%esp)
80105109:	8b 45 08             	mov    0x8(%ebp),%eax
8010510c:	89 04 24             	mov    %eax,(%esp)
8010510f:	e8 44 ff ff ff       	call   80105058 <stosb>
  return dst;
80105114:	8b 45 08             	mov    0x8(%ebp),%eax
}
80105117:	c9                   	leave  
80105118:	c3                   	ret    

80105119 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80105119:	55                   	push   %ebp
8010511a:	89 e5                	mov    %esp,%ebp
8010511c:	83 ec 10             	sub    $0x10,%esp
  const uchar *s1, *s2;
  
  s1 = v1;
8010511f:	8b 45 08             	mov    0x8(%ebp),%eax
80105122:	89 45 f8             	mov    %eax,-0x8(%ebp)
  s2 = v2;
80105125:	8b 45 0c             	mov    0xc(%ebp),%eax
80105128:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0){
8010512b:	eb 32                	jmp    8010515f <memcmp+0x46>
    if(*s1 != *s2)
8010512d:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105130:	0f b6 10             	movzbl (%eax),%edx
80105133:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105136:	0f b6 00             	movzbl (%eax),%eax
80105139:	38 c2                	cmp    %al,%dl
8010513b:	74 1a                	je     80105157 <memcmp+0x3e>
      return *s1 - *s2;
8010513d:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105140:	0f b6 00             	movzbl (%eax),%eax
80105143:	0f b6 d0             	movzbl %al,%edx
80105146:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105149:	0f b6 00             	movzbl (%eax),%eax
8010514c:	0f b6 c0             	movzbl %al,%eax
8010514f:	89 d1                	mov    %edx,%ecx
80105151:	29 c1                	sub    %eax,%ecx
80105153:	89 c8                	mov    %ecx,%eax
80105155:	eb 1c                	jmp    80105173 <memcmp+0x5a>
    s1++, s2++;
80105157:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
8010515b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  const uchar *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010515f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105163:	0f 95 c0             	setne  %al
80105166:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010516a:	84 c0                	test   %al,%al
8010516c:	75 bf                	jne    8010512d <memcmp+0x14>
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
8010516e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105173:	c9                   	leave  
80105174:	c3                   	ret    

80105175 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80105175:	55                   	push   %ebp
80105176:	89 e5                	mov    %esp,%ebp
80105178:	83 ec 10             	sub    $0x10,%esp
  const char *s;
  char *d;

  s = src;
8010517b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010517e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  d = dst;
80105181:	8b 45 08             	mov    0x8(%ebp),%eax
80105184:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(s < d && s + n > d){
80105187:	8b 45 f8             	mov    -0x8(%ebp),%eax
8010518a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
8010518d:	73 55                	jae    801051e4 <memmove+0x6f>
8010518f:	8b 45 10             	mov    0x10(%ebp),%eax
80105192:	8b 55 f8             	mov    -0x8(%ebp),%edx
80105195:	8d 04 02             	lea    (%edx,%eax,1),%eax
80105198:	3b 45 fc             	cmp    -0x4(%ebp),%eax
8010519b:	76 4a                	jbe    801051e7 <memmove+0x72>
    s += n;
8010519d:	8b 45 10             	mov    0x10(%ebp),%eax
801051a0:	01 45 f8             	add    %eax,-0x8(%ebp)
    d += n;
801051a3:	8b 45 10             	mov    0x10(%ebp),%eax
801051a6:	01 45 fc             	add    %eax,-0x4(%ebp)
    while(n-- > 0)
801051a9:	eb 13                	jmp    801051be <memmove+0x49>
      *--d = *--s;
801051ab:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
801051af:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
801051b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
801051b6:	0f b6 10             	movzbl (%eax),%edx
801051b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
801051bc:	88 10                	mov    %dl,(%eax)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
801051be:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801051c2:	0f 95 c0             	setne  %al
801051c5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801051c9:	84 c0                	test   %al,%al
801051cb:	75 de                	jne    801051ab <memmove+0x36>
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801051cd:	eb 28                	jmp    801051f7 <memmove+0x82>
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
      *d++ = *s++;
801051cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
801051d2:	0f b6 10             	movzbl (%eax),%edx
801051d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
801051d8:	88 10                	mov    %dl,(%eax)
801051da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
801051de:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
801051e2:	eb 04                	jmp    801051e8 <memmove+0x73>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
801051e4:	90                   	nop
801051e5:	eb 01                	jmp    801051e8 <memmove+0x73>
801051e7:	90                   	nop
801051e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801051ec:	0f 95 c0             	setne  %al
801051ef:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801051f3:	84 c0                	test   %al,%al
801051f5:	75 d8                	jne    801051cf <memmove+0x5a>
      *d++ = *s++;

  return dst;
801051f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
801051fa:	c9                   	leave  
801051fb:	c3                   	ret    

801051fc <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801051fc:	55                   	push   %ebp
801051fd:	89 e5                	mov    %esp,%ebp
801051ff:	83 ec 0c             	sub    $0xc,%esp
  return memmove(dst, src, n);
80105202:	8b 45 10             	mov    0x10(%ebp),%eax
80105205:	89 44 24 08          	mov    %eax,0x8(%esp)
80105209:	8b 45 0c             	mov    0xc(%ebp),%eax
8010520c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105210:	8b 45 08             	mov    0x8(%ebp),%eax
80105213:	89 04 24             	mov    %eax,(%esp)
80105216:	e8 5a ff ff ff       	call   80105175 <memmove>
}
8010521b:	c9                   	leave  
8010521c:	c3                   	ret    

8010521d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
8010521d:	55                   	push   %ebp
8010521e:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
80105220:	eb 0c                	jmp    8010522e <strncmp+0x11>
    n--, p++, q++;
80105222:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105226:	83 45 08 01          	addl   $0x1,0x8(%ebp)
8010522a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
8010522e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105232:	74 1a                	je     8010524e <strncmp+0x31>
80105234:	8b 45 08             	mov    0x8(%ebp),%eax
80105237:	0f b6 00             	movzbl (%eax),%eax
8010523a:	84 c0                	test   %al,%al
8010523c:	74 10                	je     8010524e <strncmp+0x31>
8010523e:	8b 45 08             	mov    0x8(%ebp),%eax
80105241:	0f b6 10             	movzbl (%eax),%edx
80105244:	8b 45 0c             	mov    0xc(%ebp),%eax
80105247:	0f b6 00             	movzbl (%eax),%eax
8010524a:	38 c2                	cmp    %al,%dl
8010524c:	74 d4                	je     80105222 <strncmp+0x5>
    n--, p++, q++;
  if(n == 0)
8010524e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105252:	75 07                	jne    8010525b <strncmp+0x3e>
    return 0;
80105254:	b8 00 00 00 00       	mov    $0x0,%eax
80105259:	eb 18                	jmp    80105273 <strncmp+0x56>
  return (uchar)*p - (uchar)*q;
8010525b:	8b 45 08             	mov    0x8(%ebp),%eax
8010525e:	0f b6 00             	movzbl (%eax),%eax
80105261:	0f b6 d0             	movzbl %al,%edx
80105264:	8b 45 0c             	mov    0xc(%ebp),%eax
80105267:	0f b6 00             	movzbl (%eax),%eax
8010526a:	0f b6 c0             	movzbl %al,%eax
8010526d:	89 d1                	mov    %edx,%ecx
8010526f:	29 c1                	sub    %eax,%ecx
80105271:	89 c8                	mov    %ecx,%eax
}
80105273:	5d                   	pop    %ebp
80105274:	c3                   	ret    

80105275 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80105275:	55                   	push   %ebp
80105276:	89 e5                	mov    %esp,%ebp
80105278:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
8010527b:	8b 45 08             	mov    0x8(%ebp),%eax
8010527e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0 && (*s++ = *t++) != 0)
80105281:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105285:	0f 9f c0             	setg   %al
80105288:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010528c:	84 c0                	test   %al,%al
8010528e:	74 30                	je     801052c0 <strncpy+0x4b>
80105290:	8b 45 0c             	mov    0xc(%ebp),%eax
80105293:	0f b6 10             	movzbl (%eax),%edx
80105296:	8b 45 08             	mov    0x8(%ebp),%eax
80105299:	88 10                	mov    %dl,(%eax)
8010529b:	8b 45 08             	mov    0x8(%ebp),%eax
8010529e:	0f b6 00             	movzbl (%eax),%eax
801052a1:	84 c0                	test   %al,%al
801052a3:	0f 95 c0             	setne  %al
801052a6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801052aa:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801052ae:	84 c0                	test   %al,%al
801052b0:	75 cf                	jne    80105281 <strncpy+0xc>
    ;
  while(n-- > 0)
801052b2:	eb 0d                	jmp    801052c1 <strncpy+0x4c>
    *s++ = 0;
801052b4:	8b 45 08             	mov    0x8(%ebp),%eax
801052b7:	c6 00 00             	movb   $0x0,(%eax)
801052ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801052be:	eb 01                	jmp    801052c1 <strncpy+0x4c>
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
801052c0:	90                   	nop
801052c1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801052c5:	0f 9f c0             	setg   %al
801052c8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801052cc:	84 c0                	test   %al,%al
801052ce:	75 e4                	jne    801052b4 <strncpy+0x3f>
    *s++ = 0;
  return os;
801052d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801052d3:	c9                   	leave  
801052d4:	c3                   	ret    

801052d5 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801052d5:	55                   	push   %ebp
801052d6:	89 e5                	mov    %esp,%ebp
801052d8:	83 ec 10             	sub    $0x10,%esp
  char *os;
  
  os = s;
801052db:	8b 45 08             	mov    0x8(%ebp),%eax
801052de:	89 45 fc             	mov    %eax,-0x4(%ebp)
  if(n <= 0)
801052e1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801052e5:	7f 05                	jg     801052ec <safestrcpy+0x17>
    return os;
801052e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
801052ea:	eb 35                	jmp    80105321 <safestrcpy+0x4c>
  while(--n > 0 && (*s++ = *t++) != 0)
801052ec:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801052f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801052f4:	7e 22                	jle    80105318 <safestrcpy+0x43>
801052f6:	8b 45 0c             	mov    0xc(%ebp),%eax
801052f9:	0f b6 10             	movzbl (%eax),%edx
801052fc:	8b 45 08             	mov    0x8(%ebp),%eax
801052ff:	88 10                	mov    %dl,(%eax)
80105301:	8b 45 08             	mov    0x8(%ebp),%eax
80105304:	0f b6 00             	movzbl (%eax),%eax
80105307:	84 c0                	test   %al,%al
80105309:	0f 95 c0             	setne  %al
8010530c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
80105310:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80105314:	84 c0                	test   %al,%al
80105316:	75 d4                	jne    801052ec <safestrcpy+0x17>
    ;
  *s = 0;
80105318:	8b 45 08             	mov    0x8(%ebp),%eax
8010531b:	c6 00 00             	movb   $0x0,(%eax)
  return os;
8010531e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80105321:	c9                   	leave  
80105322:	c3                   	ret    

80105323 <strlen>:

int
strlen(const char *s)
{
80105323:	55                   	push   %ebp
80105324:	89 e5                	mov    %esp,%ebp
80105326:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
80105329:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80105330:	eb 04                	jmp    80105336 <strlen+0x13>
80105332:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80105336:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105339:	03 45 08             	add    0x8(%ebp),%eax
8010533c:	0f b6 00             	movzbl (%eax),%eax
8010533f:	84 c0                	test   %al,%al
80105341:	75 ef                	jne    80105332 <strlen+0xf>
    ;
  return n;
80105343:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80105346:	c9                   	leave  
80105347:	c3                   	ret    

80105348 <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
80105348:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010534c:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80105350:	55                   	push   %ebp
  pushl %ebx
80105351:	53                   	push   %ebx
  pushl %esi
80105352:	56                   	push   %esi
  pushl %edi
80105353:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80105354:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80105356:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
80105358:	5f                   	pop    %edi
  popl %esi
80105359:	5e                   	pop    %esi
  popl %ebx
8010535a:	5b                   	pop    %ebx
  popl %ebp
8010535b:	5d                   	pop    %ebp
  ret
8010535c:	c3                   	ret    
8010535d:	00 00                	add    %al,(%eax)
	...

80105360 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80105363:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105369:	8b 00                	mov    (%eax),%eax
8010536b:	3b 45 08             	cmp    0x8(%ebp),%eax
8010536e:	76 12                	jbe    80105382 <fetchint+0x22>
80105370:	8b 45 08             	mov    0x8(%ebp),%eax
80105373:	8d 50 04             	lea    0x4(%eax),%edx
80105376:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010537c:	8b 00                	mov    (%eax),%eax
8010537e:	39 c2                	cmp    %eax,%edx
80105380:	76 07                	jbe    80105389 <fetchint+0x29>
    return -1;
80105382:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105387:	eb 0f                	jmp    80105398 <fetchint+0x38>
  *ip = *(int*)(addr);
80105389:	8b 45 08             	mov    0x8(%ebp),%eax
8010538c:	8b 10                	mov    (%eax),%edx
8010538e:	8b 45 0c             	mov    0xc(%ebp),%eax
80105391:	89 10                	mov    %edx,(%eax)
  return 0;
80105393:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105398:	5d                   	pop    %ebp
80105399:	c3                   	ret    

8010539a <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
8010539a:	55                   	push   %ebp
8010539b:	89 e5                	mov    %esp,%ebp
8010539d:	83 ec 10             	sub    $0x10,%esp
  char *s, *ep;

  if(addr >= proc->sz)
801053a0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801053a6:	8b 00                	mov    (%eax),%eax
801053a8:	3b 45 08             	cmp    0x8(%ebp),%eax
801053ab:	77 07                	ja     801053b4 <fetchstr+0x1a>
    return -1;
801053ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053b2:	eb 48                	jmp    801053fc <fetchstr+0x62>
  *pp = (char*)addr;
801053b4:	8b 55 08             	mov    0x8(%ebp),%edx
801053b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801053ba:	89 10                	mov    %edx,(%eax)
  ep = (char*)proc->sz;
801053bc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801053c2:	8b 00                	mov    (%eax),%eax
801053c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(s = *pp; s < ep; s++)
801053c7:	8b 45 0c             	mov    0xc(%ebp),%eax
801053ca:	8b 00                	mov    (%eax),%eax
801053cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
801053cf:	eb 1e                	jmp    801053ef <fetchstr+0x55>
    if(*s == 0)
801053d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
801053d4:	0f b6 00             	movzbl (%eax),%eax
801053d7:	84 c0                	test   %al,%al
801053d9:	75 10                	jne    801053eb <fetchstr+0x51>
      return s - *pp;
801053db:	8b 55 f8             	mov    -0x8(%ebp),%edx
801053de:	8b 45 0c             	mov    0xc(%ebp),%eax
801053e1:	8b 00                	mov    (%eax),%eax
801053e3:	89 d1                	mov    %edx,%ecx
801053e5:	29 c1                	sub    %eax,%ecx
801053e7:	89 c8                	mov    %ecx,%eax
801053e9:	eb 11                	jmp    801053fc <fetchstr+0x62>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
801053eb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
801053ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
801053f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
801053f5:	72 da                	jb     801053d1 <fetchstr+0x37>
    if(*s == 0)
      return s - *pp;
  return -1;
801053f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053fc:	c9                   	leave  
801053fd:	c3                   	ret    

801053fe <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801053fe:	55                   	push   %ebp
801053ff:	89 e5                	mov    %esp,%ebp
80105401:	83 ec 08             	sub    $0x8,%esp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80105404:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010540a:	8b 40 18             	mov    0x18(%eax),%eax
8010540d:	8b 50 44             	mov    0x44(%eax),%edx
80105410:	8b 45 08             	mov    0x8(%ebp),%eax
80105413:	c1 e0 02             	shl    $0x2,%eax
80105416:	8d 04 02             	lea    (%edx,%eax,1),%eax
80105419:	8d 50 04             	lea    0x4(%eax),%edx
8010541c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010541f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105423:	89 14 24             	mov    %edx,(%esp)
80105426:	e8 35 ff ff ff       	call   80105360 <fetchint>
}
8010542b:	c9                   	leave  
8010542c:	c3                   	ret    

8010542d <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
8010542d:	55                   	push   %ebp
8010542e:	89 e5                	mov    %esp,%ebp
80105430:	83 ec 18             	sub    $0x18,%esp
  int i;
  
  if(argint(n, &i) < 0)
80105433:	8d 45 fc             	lea    -0x4(%ebp),%eax
80105436:	89 44 24 04          	mov    %eax,0x4(%esp)
8010543a:	8b 45 08             	mov    0x8(%ebp),%eax
8010543d:	89 04 24             	mov    %eax,(%esp)
80105440:	e8 b9 ff ff ff       	call   801053fe <argint>
80105445:	85 c0                	test   %eax,%eax
80105447:	79 07                	jns    80105450 <argptr+0x23>
    return -1;
80105449:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010544e:	eb 3d                	jmp    8010548d <argptr+0x60>
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
80105450:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105453:	89 c2                	mov    %eax,%edx
80105455:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010545b:	8b 00                	mov    (%eax),%eax
8010545d:	39 c2                	cmp    %eax,%edx
8010545f:	73 16                	jae    80105477 <argptr+0x4a>
80105461:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105464:	89 c2                	mov    %eax,%edx
80105466:	8b 45 10             	mov    0x10(%ebp),%eax
80105469:	01 c2                	add    %eax,%edx
8010546b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105471:	8b 00                	mov    (%eax),%eax
80105473:	39 c2                	cmp    %eax,%edx
80105475:	76 07                	jbe    8010547e <argptr+0x51>
    return -1;
80105477:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010547c:	eb 0f                	jmp    8010548d <argptr+0x60>
  *pp = (char*)i;
8010547e:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105481:	89 c2                	mov    %eax,%edx
80105483:	8b 45 0c             	mov    0xc(%ebp),%eax
80105486:	89 10                	mov    %edx,(%eax)
  return 0;
80105488:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010548d:	c9                   	leave  
8010548e:	c3                   	ret    

8010548f <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
8010548f:	55                   	push   %ebp
80105490:	89 e5                	mov    %esp,%ebp
80105492:	83 ec 18             	sub    $0x18,%esp
  int addr;
  if(argint(n, &addr) < 0)
80105495:	8d 45 fc             	lea    -0x4(%ebp),%eax
80105498:	89 44 24 04          	mov    %eax,0x4(%esp)
8010549c:	8b 45 08             	mov    0x8(%ebp),%eax
8010549f:	89 04 24             	mov    %eax,(%esp)
801054a2:	e8 57 ff ff ff       	call   801053fe <argint>
801054a7:	85 c0                	test   %eax,%eax
801054a9:	79 07                	jns    801054b2 <argstr+0x23>
    return -1;
801054ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054b0:	eb 12                	jmp    801054c4 <argstr+0x35>
  return fetchstr(addr, pp);
801054b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
801054b5:	8b 55 0c             	mov    0xc(%ebp),%edx
801054b8:	89 54 24 04          	mov    %edx,0x4(%esp)
801054bc:	89 04 24             	mov    %eax,(%esp)
801054bf:	e8 d6 fe ff ff       	call   8010539a <fetchstr>
}
801054c4:	c9                   	leave  
801054c5:	c3                   	ret    

801054c6 <syscall>:
[SYS_texit]   sys_texit,
};

void
syscall(void)
{
801054c6:	55                   	push   %ebp
801054c7:	89 e5                	mov    %esp,%ebp
801054c9:	53                   	push   %ebx
801054ca:	83 ec 24             	sub    $0x24,%esp
  int num;

  num = proc->tf->eax;
801054cd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054d3:	8b 40 18             	mov    0x18(%eax),%eax
801054d6:	8b 40 1c             	mov    0x1c(%eax),%eax
801054d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801054dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801054e0:	7e 30                	jle    80105512 <syscall+0x4c>
801054e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054e5:	83 f8 17             	cmp    $0x17,%eax
801054e8:	77 28                	ja     80105512 <syscall+0x4c>
801054ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
801054ed:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
801054f4:	85 c0                	test   %eax,%eax
801054f6:	74 1a                	je     80105512 <syscall+0x4c>
    proc->tf->eax = syscalls[num]();
801054f8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054fe:	8b 58 18             	mov    0x18(%eax),%ebx
80105501:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105504:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
8010550b:	ff d0                	call   *%eax
8010550d:	89 43 1c             	mov    %eax,0x1c(%ebx)
syscall(void)
{
  int num;

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80105510:	eb 3d                	jmp    8010554f <syscall+0x89>
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
80105512:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80105518:	8d 48 6c             	lea    0x6c(%eax),%ecx
            proc->pid, proc->name, num);
8010551b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80105521:	8b 40 10             	mov    0x10(%eax),%eax
80105524:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105527:	89 54 24 0c          	mov    %edx,0xc(%esp)
8010552b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010552f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105533:	c7 04 24 7f 88 10 80 	movl   $0x8010887f,(%esp)
8010553a:	e8 5b ae ff ff       	call   8010039a <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
8010553f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105545:	8b 40 18             	mov    0x18(%eax),%eax
80105548:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
8010554f:	83 c4 24             	add    $0x24,%esp
80105552:	5b                   	pop    %ebx
80105553:	5d                   	pop    %ebp
80105554:	c3                   	ret    
80105555:	00 00                	add    %al,(%eax)
	...

80105558 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
80105558:	55                   	push   %ebp
80105559:	89 e5                	mov    %esp,%ebp
8010555b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
8010555e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105561:	89 44 24 04          	mov    %eax,0x4(%esp)
80105565:	8b 45 08             	mov    0x8(%ebp),%eax
80105568:	89 04 24             	mov    %eax,(%esp)
8010556b:	e8 8e fe ff ff       	call   801053fe <argint>
80105570:	85 c0                	test   %eax,%eax
80105572:	79 07                	jns    8010557b <argfd+0x23>
    return -1;
80105574:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105579:	eb 50                	jmp    801055cb <argfd+0x73>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
8010557b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010557e:	85 c0                	test   %eax,%eax
80105580:	78 21                	js     801055a3 <argfd+0x4b>
80105582:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105585:	83 f8 0f             	cmp    $0xf,%eax
80105588:	7f 19                	jg     801055a3 <argfd+0x4b>
8010558a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105590:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105593:	83 c2 08             	add    $0x8,%edx
80105596:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
8010559a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010559d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801055a1:	75 07                	jne    801055aa <argfd+0x52>
    return -1;
801055a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055a8:	eb 21                	jmp    801055cb <argfd+0x73>
  if(pfd)
801055aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
801055ae:	74 08                	je     801055b8 <argfd+0x60>
    *pfd = fd;
801055b0:	8b 55 f0             	mov    -0x10(%ebp),%edx
801055b3:	8b 45 0c             	mov    0xc(%ebp),%eax
801055b6:	89 10                	mov    %edx,(%eax)
  if(pf)
801055b8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801055bc:	74 08                	je     801055c6 <argfd+0x6e>
    *pf = f;
801055be:	8b 45 10             	mov    0x10(%ebp),%eax
801055c1:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055c4:	89 10                	mov    %edx,(%eax)
  return 0;
801055c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
801055cb:	c9                   	leave  
801055cc:	c3                   	ret    

801055cd <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
801055cd:	55                   	push   %ebp
801055ce:	89 e5                	mov    %esp,%ebp
801055d0:	83 ec 10             	sub    $0x10,%esp
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
801055da:	eb 30                	jmp    8010560c <fdalloc+0x3f>
    if(proc->ofile[fd] == 0){
801055dc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
801055e5:	83 c2 08             	add    $0x8,%edx
801055e8:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
801055ec:	85 c0                	test   %eax,%eax
801055ee:	75 18                	jne    80105608 <fdalloc+0x3b>
      proc->ofile[fd] = f;
801055f0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
801055f9:	8d 4a 08             	lea    0x8(%edx),%ecx
801055fc:	8b 55 08             	mov    0x8(%ebp),%edx
801055ff:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
      return fd;
80105603:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105606:	eb 0f                	jmp    80105617 <fdalloc+0x4a>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105608:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010560c:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
80105610:	7e ca                	jle    801055dc <fdalloc+0xf>
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
80105612:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105617:	c9                   	leave  
80105618:	c3                   	ret    

80105619 <sys_dup>:

int
sys_dup(void)
{
80105619:	55                   	push   %ebp
8010561a:	89 e5                	mov    %esp,%ebp
8010561c:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
8010561f:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105622:	89 44 24 08          	mov    %eax,0x8(%esp)
80105626:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010562d:	00 
8010562e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105635:	e8 1e ff ff ff       	call   80105558 <argfd>
8010563a:	85 c0                	test   %eax,%eax
8010563c:	79 07                	jns    80105645 <sys_dup+0x2c>
    return -1;
8010563e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105643:	eb 29                	jmp    8010566e <sys_dup+0x55>
  if((fd=fdalloc(f)) < 0)
80105645:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105648:	89 04 24             	mov    %eax,(%esp)
8010564b:	e8 7d ff ff ff       	call   801055cd <fdalloc>
80105650:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105653:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105657:	79 07                	jns    80105660 <sys_dup+0x47>
    return -1;
80105659:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010565e:	eb 0e                	jmp    8010566e <sys_dup+0x55>
  filedup(f);
80105660:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105663:	89 04 24             	mov    %eax,(%esp)
80105666:	e8 1a b9 ff ff       	call   80100f85 <filedup>
  return fd;
8010566b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010566e:	c9                   	leave  
8010566f:	c3                   	ret    

80105670 <sys_read>:

int
sys_read(void)
{
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105676:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105679:	89 44 24 08          	mov    %eax,0x8(%esp)
8010567d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105684:	00 
80105685:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010568c:	e8 c7 fe ff ff       	call   80105558 <argfd>
80105691:	85 c0                	test   %eax,%eax
80105693:	78 35                	js     801056ca <sys_read+0x5a>
80105695:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105698:	89 44 24 04          	mov    %eax,0x4(%esp)
8010569c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801056a3:	e8 56 fd ff ff       	call   801053fe <argint>
801056a8:	85 c0                	test   %eax,%eax
801056aa:	78 1e                	js     801056ca <sys_read+0x5a>
801056ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
801056af:	89 44 24 08          	mov    %eax,0x8(%esp)
801056b3:	8d 45 ec             	lea    -0x14(%ebp),%eax
801056b6:	89 44 24 04          	mov    %eax,0x4(%esp)
801056ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801056c1:	e8 67 fd ff ff       	call   8010542d <argptr>
801056c6:	85 c0                	test   %eax,%eax
801056c8:	79 07                	jns    801056d1 <sys_read+0x61>
    return -1;
801056ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056cf:	eb 19                	jmp    801056ea <sys_read+0x7a>
  return fileread(f, p, n);
801056d1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
801056d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
801056d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801056da:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801056de:	89 54 24 04          	mov    %edx,0x4(%esp)
801056e2:	89 04 24             	mov    %eax,(%esp)
801056e5:	e8 08 ba ff ff       	call   801010f2 <fileread>
}
801056ea:	c9                   	leave  
801056eb:	c3                   	ret    

801056ec <sys_write>:

int
sys_write(void)
{
801056ec:	55                   	push   %ebp
801056ed:	89 e5                	mov    %esp,%ebp
801056ef:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801056f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056f5:	89 44 24 08          	mov    %eax,0x8(%esp)
801056f9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105700:	00 
80105701:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105708:	e8 4b fe ff ff       	call   80105558 <argfd>
8010570d:	85 c0                	test   %eax,%eax
8010570f:	78 35                	js     80105746 <sys_write+0x5a>
80105711:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105714:	89 44 24 04          	mov    %eax,0x4(%esp)
80105718:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
8010571f:	e8 da fc ff ff       	call   801053fe <argint>
80105724:	85 c0                	test   %eax,%eax
80105726:	78 1e                	js     80105746 <sys_write+0x5a>
80105728:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010572b:	89 44 24 08          	mov    %eax,0x8(%esp)
8010572f:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105732:	89 44 24 04          	mov    %eax,0x4(%esp)
80105736:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010573d:	e8 eb fc ff ff       	call   8010542d <argptr>
80105742:	85 c0                	test   %eax,%eax
80105744:	79 07                	jns    8010574d <sys_write+0x61>
    return -1;
80105746:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010574b:	eb 19                	jmp    80105766 <sys_write+0x7a>
  return filewrite(f, p, n);
8010574d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80105750:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105753:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105756:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010575a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010575e:	89 04 24             	mov    %eax,(%esp)
80105761:	e8 48 ba ff ff       	call   801011ae <filewrite>
}
80105766:	c9                   	leave  
80105767:	c3                   	ret    

80105768 <sys_close>:

int
sys_close(void)
{
80105768:	55                   	push   %ebp
80105769:	89 e5                	mov    %esp,%ebp
8010576b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;
  
  if(argfd(0, &fd, &f) < 0)
8010576e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105771:	89 44 24 08          	mov    %eax,0x8(%esp)
80105775:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105778:	89 44 24 04          	mov    %eax,0x4(%esp)
8010577c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105783:	e8 d0 fd ff ff       	call   80105558 <argfd>
80105788:	85 c0                	test   %eax,%eax
8010578a:	79 07                	jns    80105793 <sys_close+0x2b>
    return -1;
8010578c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105791:	eb 24                	jmp    801057b7 <sys_close+0x4f>
  proc->ofile[fd] = 0;
80105793:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105799:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010579c:	83 c2 08             	add    $0x8,%edx
8010579f:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
801057a6:	00 
  fileclose(f);
801057a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801057aa:	89 04 24             	mov    %eax,(%esp)
801057ad:	e8 1b b8 ff ff       	call   80100fcd <fileclose>
  return 0;
801057b2:	b8 00 00 00 00       	mov    $0x0,%eax
}
801057b7:	c9                   	leave  
801057b8:	c3                   	ret    

801057b9 <sys_fstat>:

int
sys_fstat(void)
{
801057b9:	55                   	push   %ebp
801057ba:	89 e5                	mov    %esp,%ebp
801057bc:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801057bf:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057c2:	89 44 24 08          	mov    %eax,0x8(%esp)
801057c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801057cd:	00 
801057ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801057d5:	e8 7e fd ff ff       	call   80105558 <argfd>
801057da:	85 c0                	test   %eax,%eax
801057dc:	78 1f                	js     801057fd <sys_fstat+0x44>
801057de:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057e1:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801057e8:	00 
801057e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801057ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801057f4:	e8 34 fc ff ff       	call   8010542d <argptr>
801057f9:	85 c0                	test   %eax,%eax
801057fb:	79 07                	jns    80105804 <sys_fstat+0x4b>
    return -1;
801057fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105802:	eb 12                	jmp    80105816 <sys_fstat+0x5d>
  return filestat(f, st);
80105804:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105807:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010580a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010580e:	89 04 24             	mov    %eax,(%esp)
80105811:	e8 8d b8 ff ff       	call   801010a3 <filestat>
}
80105816:	c9                   	leave  
80105817:	c3                   	ret    

80105818 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80105818:	55                   	push   %ebp
80105819:	89 e5                	mov    %esp,%ebp
8010581b:	83 ec 38             	sub    $0x38,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010581e:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105821:	89 44 24 04          	mov    %eax,0x4(%esp)
80105825:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010582c:	e8 5e fc ff ff       	call   8010548f <argstr>
80105831:	85 c0                	test   %eax,%eax
80105833:	78 17                	js     8010584c <sys_link+0x34>
80105835:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105838:	89 44 24 04          	mov    %eax,0x4(%esp)
8010583c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105843:	e8 47 fc ff ff       	call   8010548f <argstr>
80105848:	85 c0                	test   %eax,%eax
8010584a:	79 0a                	jns    80105856 <sys_link+0x3e>
    return -1;
8010584c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105851:	e9 3c 01 00 00       	jmp    80105992 <sys_link+0x17a>
  if((ip = namei(old)) == 0)
80105856:	8b 45 d8             	mov    -0x28(%ebp),%eax
80105859:	89 04 24             	mov    %eax,(%esp)
8010585c:	e8 c2 cb ff ff       	call   80102423 <namei>
80105861:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105864:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105868:	75 0a                	jne    80105874 <sys_link+0x5c>
    return -1;
8010586a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010586f:	e9 1e 01 00 00       	jmp    80105992 <sys_link+0x17a>

  begin_trans();
80105874:	e8 99 d9 ff ff       	call   80103212 <begin_trans>

  ilock(ip);
80105879:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010587c:	89 04 24             	mov    %eax,(%esp)
8010587f:	e8 f7 bf ff ff       	call   8010187b <ilock>
  if(ip->type == T_DIR){
80105884:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105887:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010588b:	66 83 f8 01          	cmp    $0x1,%ax
8010588f:	75 1a                	jne    801058ab <sys_link+0x93>
    iunlockput(ip);
80105891:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105894:	89 04 24             	mov    %eax,(%esp)
80105897:	e8 66 c2 ff ff       	call   80101b02 <iunlockput>
    commit_trans();
8010589c:	e8 ba d9 ff ff       	call   8010325b <commit_trans>
    return -1;
801058a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058a6:	e9 e7 00 00 00       	jmp    80105992 <sys_link+0x17a>
  }

  ip->nlink++;
801058ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058ae:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801058b2:	8d 50 01             	lea    0x1(%eax),%edx
801058b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058b8:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
801058bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058bf:	89 04 24             	mov    %eax,(%esp)
801058c2:	e8 f4 bd ff ff       	call   801016bb <iupdate>
  iunlock(ip);
801058c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058ca:	89 04 24             	mov    %eax,(%esp)
801058cd:	e8 fa c0 ff ff       	call   801019cc <iunlock>

  if((dp = nameiparent(new, name)) == 0)
801058d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
801058d5:	8d 55 e2             	lea    -0x1e(%ebp),%edx
801058d8:	89 54 24 04          	mov    %edx,0x4(%esp)
801058dc:	89 04 24             	mov    %eax,(%esp)
801058df:	e8 61 cb ff ff       	call   80102445 <nameiparent>
801058e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
801058e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801058eb:	74 68                	je     80105955 <sys_link+0x13d>
    goto bad;
  ilock(dp);
801058ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
801058f0:	89 04 24             	mov    %eax,(%esp)
801058f3:	e8 83 bf ff ff       	call   8010187b <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
801058f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801058fb:	8b 10                	mov    (%eax),%edx
801058fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105900:	8b 00                	mov    (%eax),%eax
80105902:	39 c2                	cmp    %eax,%edx
80105904:	75 20                	jne    80105926 <sys_link+0x10e>
80105906:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105909:	8b 40 04             	mov    0x4(%eax),%eax
8010590c:	89 44 24 08          	mov    %eax,0x8(%esp)
80105910:	8d 45 e2             	lea    -0x1e(%ebp),%eax
80105913:	89 44 24 04          	mov    %eax,0x4(%esp)
80105917:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010591a:	89 04 24             	mov    %eax,(%esp)
8010591d:	e8 40 c8 ff ff       	call   80102162 <dirlink>
80105922:	85 c0                	test   %eax,%eax
80105924:	79 0d                	jns    80105933 <sys_link+0x11b>
    iunlockput(dp);
80105926:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105929:	89 04 24             	mov    %eax,(%esp)
8010592c:	e8 d1 c1 ff ff       	call   80101b02 <iunlockput>
    goto bad;
80105931:	eb 23                	jmp    80105956 <sys_link+0x13e>
  }
  iunlockput(dp);
80105933:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105936:	89 04 24             	mov    %eax,(%esp)
80105939:	e8 c4 c1 ff ff       	call   80101b02 <iunlockput>
  iput(ip);
8010593e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105941:	89 04 24             	mov    %eax,(%esp)
80105944:	e8 e8 c0 ff ff       	call   80101a31 <iput>

  commit_trans();
80105949:	e8 0d d9 ff ff       	call   8010325b <commit_trans>

  return 0;
8010594e:	b8 00 00 00 00       	mov    $0x0,%eax
80105953:	eb 3d                	jmp    80105992 <sys_link+0x17a>
  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
80105955:	90                   	nop
  commit_trans();

  return 0;

bad:
  ilock(ip);
80105956:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105959:	89 04 24             	mov    %eax,(%esp)
8010595c:	e8 1a bf ff ff       	call   8010187b <ilock>
  ip->nlink--;
80105961:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105964:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105968:	8d 50 ff             	lea    -0x1(%eax),%edx
8010596b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010596e:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105972:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105975:	89 04 24             	mov    %eax,(%esp)
80105978:	e8 3e bd ff ff       	call   801016bb <iupdate>
  iunlockput(ip);
8010597d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105980:	89 04 24             	mov    %eax,(%esp)
80105983:	e8 7a c1 ff ff       	call   80101b02 <iunlockput>
  commit_trans();
80105988:	e8 ce d8 ff ff       	call   8010325b <commit_trans>
  return -1;
8010598d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105992:	c9                   	leave  
80105993:	c3                   	ret    

80105994 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
80105994:	55                   	push   %ebp
80105995:	89 e5                	mov    %esp,%ebp
80105997:	83 ec 38             	sub    $0x38,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
8010599a:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
801059a1:	eb 4b                	jmp    801059ee <isdirempty+0x5a>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801059a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
801059a6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801059a9:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801059b0:	00 
801059b1:	89 54 24 08          	mov    %edx,0x8(%esp)
801059b5:	89 44 24 04          	mov    %eax,0x4(%esp)
801059b9:	8b 45 08             	mov    0x8(%ebp),%eax
801059bc:	89 04 24             	mov    %eax,(%esp)
801059bf:	e8 b0 c3 ff ff       	call   80101d74 <readi>
801059c4:	83 f8 10             	cmp    $0x10,%eax
801059c7:	74 0c                	je     801059d5 <isdirempty+0x41>
      panic("isdirempty: readi");
801059c9:	c7 04 24 9b 88 10 80 	movl   $0x8010889b,(%esp)
801059d0:	e8 65 ab ff ff       	call   8010053a <panic>
    if(de.inum != 0)
801059d5:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801059d9:	66 85 c0             	test   %ax,%ax
801059dc:	74 07                	je     801059e5 <isdirempty+0x51>
      return 0;
801059de:	b8 00 00 00 00       	mov    $0x0,%eax
801059e3:	eb 1b                	jmp    80105a00 <isdirempty+0x6c>
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801059e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059e8:	83 c0 10             	add    $0x10,%eax
801059eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
801059ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
801059f1:	8b 45 08             	mov    0x8(%ebp),%eax
801059f4:	8b 40 18             	mov    0x18(%eax),%eax
801059f7:	39 c2                	cmp    %eax,%edx
801059f9:	72 a8                	jb     801059a3 <isdirempty+0xf>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
801059fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
80105a00:	c9                   	leave  
80105a01:	c3                   	ret    

80105a02 <sys_unlink>:

//PAGEBREAK!
int
sys_unlink(void)
{
80105a02:	55                   	push   %ebp
80105a03:	89 e5                	mov    %esp,%ebp
80105a05:	83 ec 48             	sub    $0x48,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105a08:	8d 45 cc             	lea    -0x34(%ebp),%eax
80105a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
80105a0f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105a16:	e8 74 fa ff ff       	call   8010548f <argstr>
80105a1b:	85 c0                	test   %eax,%eax
80105a1d:	79 0a                	jns    80105a29 <sys_unlink+0x27>
    return -1;
80105a1f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a24:	e9 aa 01 00 00       	jmp    80105bd3 <sys_unlink+0x1d1>
  if((dp = nameiparent(path, name)) == 0)
80105a29:	8b 45 cc             	mov    -0x34(%ebp),%eax
80105a2c:	8d 55 d2             	lea    -0x2e(%ebp),%edx
80105a2f:	89 54 24 04          	mov    %edx,0x4(%esp)
80105a33:	89 04 24             	mov    %eax,(%esp)
80105a36:	e8 0a ca ff ff       	call   80102445 <nameiparent>
80105a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105a3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105a42:	75 0a                	jne    80105a4e <sys_unlink+0x4c>
    return -1;
80105a44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a49:	e9 85 01 00 00       	jmp    80105bd3 <sys_unlink+0x1d1>

  begin_trans();
80105a4e:	e8 bf d7 ff ff       	call   80103212 <begin_trans>

  ilock(dp);
80105a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a56:	89 04 24             	mov    %eax,(%esp)
80105a59:	e8 1d be ff ff       	call   8010187b <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105a5e:	c7 44 24 04 ad 88 10 	movl   $0x801088ad,0x4(%esp)
80105a65:	80 
80105a66:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105a69:	89 04 24             	mov    %eax,(%esp)
80105a6c:	e8 07 c6 ff ff       	call   80102078 <namecmp>
80105a71:	85 c0                	test   %eax,%eax
80105a73:	0f 84 45 01 00 00    	je     80105bbe <sys_unlink+0x1bc>
80105a79:	c7 44 24 04 af 88 10 	movl   $0x801088af,0x4(%esp)
80105a80:	80 
80105a81:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105a84:	89 04 24             	mov    %eax,(%esp)
80105a87:	e8 ec c5 ff ff       	call   80102078 <namecmp>
80105a8c:	85 c0                	test   %eax,%eax
80105a8e:	0f 84 2a 01 00 00    	je     80105bbe <sys_unlink+0x1bc>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80105a94:	8d 45 c8             	lea    -0x38(%ebp),%eax
80105a97:	89 44 24 08          	mov    %eax,0x8(%esp)
80105a9b:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105aa5:	89 04 24             	mov    %eax,(%esp)
80105aa8:	e8 ed c5 ff ff       	call   8010209a <dirlookup>
80105aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105ab0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105ab4:	0f 84 03 01 00 00    	je     80105bbd <sys_unlink+0x1bb>
    goto bad;
  ilock(ip);
80105aba:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105abd:	89 04 24             	mov    %eax,(%esp)
80105ac0:	e8 b6 bd ff ff       	call   8010187b <ilock>

  if(ip->nlink < 1)
80105ac5:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ac8:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105acc:	66 85 c0             	test   %ax,%ax
80105acf:	7f 0c                	jg     80105add <sys_unlink+0xdb>
    panic("unlink: nlink < 1");
80105ad1:	c7 04 24 b2 88 10 80 	movl   $0x801088b2,(%esp)
80105ad8:	e8 5d aa ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105add:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ae0:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105ae4:	66 83 f8 01          	cmp    $0x1,%ax
80105ae8:	75 1f                	jne    80105b09 <sys_unlink+0x107>
80105aea:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105aed:	89 04 24             	mov    %eax,(%esp)
80105af0:	e8 9f fe ff ff       	call   80105994 <isdirempty>
80105af5:	85 c0                	test   %eax,%eax
80105af7:	75 10                	jne    80105b09 <sys_unlink+0x107>
    iunlockput(ip);
80105af9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105afc:	89 04 24             	mov    %eax,(%esp)
80105aff:	e8 fe bf ff ff       	call   80101b02 <iunlockput>
    goto bad;
80105b04:	e9 b5 00 00 00       	jmp    80105bbe <sys_unlink+0x1bc>
  }

  memset(&de, 0, sizeof(de));
80105b09:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80105b10:	00 
80105b11:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105b18:	00 
80105b19:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105b1c:	89 04 24             	mov    %eax,(%esp)
80105b1f:	e8 7e f5 ff ff       	call   801050a2 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105b24:	8b 55 c8             	mov    -0x38(%ebp),%edx
80105b27:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105b2a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105b31:	00 
80105b32:	89 54 24 08          	mov    %edx,0x8(%esp)
80105b36:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b3d:	89 04 24             	mov    %eax,(%esp)
80105b40:	e8 9b c3 ff ff       	call   80101ee0 <writei>
80105b45:	83 f8 10             	cmp    $0x10,%eax
80105b48:	74 0c                	je     80105b56 <sys_unlink+0x154>
    panic("unlink: writei");
80105b4a:	c7 04 24 c4 88 10 80 	movl   $0x801088c4,(%esp)
80105b51:	e8 e4 a9 ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR){
80105b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b59:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105b5d:	66 83 f8 01          	cmp    $0x1,%ax
80105b61:	75 1c                	jne    80105b7f <sys_unlink+0x17d>
    dp->nlink--;
80105b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b66:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105b6a:	8d 50 ff             	lea    -0x1(%eax),%edx
80105b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b70:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b77:	89 04 24             	mov    %eax,(%esp)
80105b7a:	e8 3c bb ff ff       	call   801016bb <iupdate>
  }
  iunlockput(dp);
80105b7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b82:	89 04 24             	mov    %eax,(%esp)
80105b85:	e8 78 bf ff ff       	call   80101b02 <iunlockput>

  ip->nlink--;
80105b8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b8d:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105b91:	8d 50 ff             	lea    -0x1(%eax),%edx
80105b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b97:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b9e:	89 04 24             	mov    %eax,(%esp)
80105ba1:	e8 15 bb ff ff       	call   801016bb <iupdate>
  iunlockput(ip);
80105ba6:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ba9:	89 04 24             	mov    %eax,(%esp)
80105bac:	e8 51 bf ff ff       	call   80101b02 <iunlockput>

  commit_trans();
80105bb1:	e8 a5 d6 ff ff       	call   8010325b <commit_trans>

  return 0;
80105bb6:	b8 00 00 00 00       	mov    $0x0,%eax
80105bbb:	eb 16                	jmp    80105bd3 <sys_unlink+0x1d1>
  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
80105bbd:	90                   	nop
  commit_trans();

  return 0;

bad:
  iunlockput(dp);
80105bbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105bc1:	89 04 24             	mov    %eax,(%esp)
80105bc4:	e8 39 bf ff ff       	call   80101b02 <iunlockput>
  commit_trans();
80105bc9:	e8 8d d6 ff ff       	call   8010325b <commit_trans>
  return -1;
80105bce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105bd3:	c9                   	leave  
80105bd4:	c3                   	ret    

80105bd5 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
80105bd5:	55                   	push   %ebp
80105bd6:	89 e5                	mov    %esp,%ebp
80105bd8:	83 ec 48             	sub    $0x48,%esp
80105bdb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80105bde:	8b 55 10             	mov    0x10(%ebp),%edx
80105be1:	8b 45 14             	mov    0x14(%ebp),%eax
80105be4:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
80105be8:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
80105bec:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80105bf0:	8d 45 de             	lea    -0x22(%ebp),%eax
80105bf3:	89 44 24 04          	mov    %eax,0x4(%esp)
80105bf7:	8b 45 08             	mov    0x8(%ebp),%eax
80105bfa:	89 04 24             	mov    %eax,(%esp)
80105bfd:	e8 43 c8 ff ff       	call   80102445 <nameiparent>
80105c02:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105c05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105c09:	75 0a                	jne    80105c15 <create+0x40>
    return 0;
80105c0b:	b8 00 00 00 00       	mov    $0x0,%eax
80105c10:	e9 7e 01 00 00       	jmp    80105d93 <create+0x1be>
  ilock(dp);
80105c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c18:	89 04 24             	mov    %eax,(%esp)
80105c1b:	e8 5b bc ff ff       	call   8010187b <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80105c20:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105c23:	89 44 24 08          	mov    %eax,0x8(%esp)
80105c27:	8d 45 de             	lea    -0x22(%ebp),%eax
80105c2a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c31:	89 04 24             	mov    %eax,(%esp)
80105c34:	e8 61 c4 ff ff       	call   8010209a <dirlookup>
80105c39:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105c3c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105c40:	74 47                	je     80105c89 <create+0xb4>
    iunlockput(dp);
80105c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c45:	89 04 24             	mov    %eax,(%esp)
80105c48:	e8 b5 be ff ff       	call   80101b02 <iunlockput>
    ilock(ip);
80105c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c50:	89 04 24             	mov    %eax,(%esp)
80105c53:	e8 23 bc ff ff       	call   8010187b <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80105c58:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80105c5d:	75 15                	jne    80105c74 <create+0x9f>
80105c5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c62:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105c66:	66 83 f8 02          	cmp    $0x2,%ax
80105c6a:	75 08                	jne    80105c74 <create+0x9f>
      return ip;
80105c6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c6f:	e9 1f 01 00 00       	jmp    80105d93 <create+0x1be>
    iunlockput(ip);
80105c74:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c77:	89 04 24             	mov    %eax,(%esp)
80105c7a:	e8 83 be ff ff       	call   80101b02 <iunlockput>
    return 0;
80105c7f:	b8 00 00 00 00       	mov    $0x0,%eax
80105c84:	e9 0a 01 00 00       	jmp    80105d93 <create+0x1be>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80105c89:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
80105c8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c90:	8b 00                	mov    (%eax),%eax
80105c92:	89 54 24 04          	mov    %edx,0x4(%esp)
80105c96:	89 04 24             	mov    %eax,(%esp)
80105c99:	e8 40 b9 ff ff       	call   801015de <ialloc>
80105c9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105ca1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105ca5:	75 0c                	jne    80105cb3 <create+0xde>
    panic("create: ialloc");
80105ca7:	c7 04 24 d3 88 10 80 	movl   $0x801088d3,(%esp)
80105cae:	e8 87 a8 ff ff       	call   8010053a <panic>

  ilock(ip);
80105cb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105cb6:	89 04 24             	mov    %eax,(%esp)
80105cb9:	e8 bd bb ff ff       	call   8010187b <ilock>
  ip->major = major;
80105cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105cc1:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
80105cc5:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
80105cc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ccc:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
80105cd0:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
80105cd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105cd7:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
80105cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ce0:	89 04 24             	mov    %eax,(%esp)
80105ce3:	e8 d3 b9 ff ff       	call   801016bb <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80105ce8:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80105ced:	75 6a                	jne    80105d59 <create+0x184>
    dp->nlink++;  // for ".."
80105cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cf2:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105cf6:	8d 50 01             	lea    0x1(%eax),%edx
80105cf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cfc:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105d00:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d03:	89 04 24             	mov    %eax,(%esp)
80105d06:	e8 b0 b9 ff ff       	call   801016bb <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80105d0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d0e:	8b 40 04             	mov    0x4(%eax),%eax
80105d11:	89 44 24 08          	mov    %eax,0x8(%esp)
80105d15:	c7 44 24 04 ad 88 10 	movl   $0x801088ad,0x4(%esp)
80105d1c:	80 
80105d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d20:	89 04 24             	mov    %eax,(%esp)
80105d23:	e8 3a c4 ff ff       	call   80102162 <dirlink>
80105d28:	85 c0                	test   %eax,%eax
80105d2a:	78 21                	js     80105d4d <create+0x178>
80105d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d2f:	8b 40 04             	mov    0x4(%eax),%eax
80105d32:	89 44 24 08          	mov    %eax,0x8(%esp)
80105d36:	c7 44 24 04 af 88 10 	movl   $0x801088af,0x4(%esp)
80105d3d:	80 
80105d3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d41:	89 04 24             	mov    %eax,(%esp)
80105d44:	e8 19 c4 ff ff       	call   80102162 <dirlink>
80105d49:	85 c0                	test   %eax,%eax
80105d4b:	79 0c                	jns    80105d59 <create+0x184>
      panic("create dots");
80105d4d:	c7 04 24 e2 88 10 80 	movl   $0x801088e2,(%esp)
80105d54:	e8 e1 a7 ff ff       	call   8010053a <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
80105d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d5c:	8b 40 04             	mov    0x4(%eax),%eax
80105d5f:	89 44 24 08          	mov    %eax,0x8(%esp)
80105d63:	8d 45 de             	lea    -0x22(%ebp),%eax
80105d66:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d6d:	89 04 24             	mov    %eax,(%esp)
80105d70:	e8 ed c3 ff ff       	call   80102162 <dirlink>
80105d75:	85 c0                	test   %eax,%eax
80105d77:	79 0c                	jns    80105d85 <create+0x1b0>
    panic("create: dirlink");
80105d79:	c7 04 24 ee 88 10 80 	movl   $0x801088ee,(%esp)
80105d80:	e8 b5 a7 ff ff       	call   8010053a <panic>

  iunlockput(dp);
80105d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d88:	89 04 24             	mov    %eax,(%esp)
80105d8b:	e8 72 bd ff ff       	call   80101b02 <iunlockput>

  return ip;
80105d90:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80105d93:	c9                   	leave  
80105d94:	c3                   	ret    

80105d95 <sys_open>:

int
sys_open(void)
{
80105d95:	55                   	push   %ebp
80105d96:	89 e5                	mov    %esp,%ebp
80105d98:	83 ec 38             	sub    $0x38,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105d9b:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105d9e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105da2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105da9:	e8 e1 f6 ff ff       	call   8010548f <argstr>
80105dae:	85 c0                	test   %eax,%eax
80105db0:	78 17                	js     80105dc9 <sys_open+0x34>
80105db2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105db5:	89 44 24 04          	mov    %eax,0x4(%esp)
80105db9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105dc0:	e8 39 f6 ff ff       	call   801053fe <argint>
80105dc5:	85 c0                	test   %eax,%eax
80105dc7:	79 0a                	jns    80105dd3 <sys_open+0x3e>
    return -1;
80105dc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105dce:	e9 46 01 00 00       	jmp    80105f19 <sys_open+0x184>
  if(omode & O_CREATE){
80105dd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105dd6:	25 00 02 00 00       	and    $0x200,%eax
80105ddb:	85 c0                	test   %eax,%eax
80105ddd:	74 40                	je     80105e1f <sys_open+0x8a>
    begin_trans();
80105ddf:	e8 2e d4 ff ff       	call   80103212 <begin_trans>
    ip = create(path, T_FILE, 0, 0);
80105de4:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105de7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105dee:	00 
80105def:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105df6:	00 
80105df7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
80105dfe:	00 
80105dff:	89 04 24             	mov    %eax,(%esp)
80105e02:	e8 ce fd ff ff       	call   80105bd5 <create>
80105e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
    commit_trans();
80105e0a:	e8 4c d4 ff ff       	call   8010325b <commit_trans>
    if(ip == 0)
80105e0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105e13:	75 5c                	jne    80105e71 <sys_open+0xdc>
      return -1;
80105e15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e1a:	e9 fa 00 00 00       	jmp    80105f19 <sys_open+0x184>
  } else {
    if((ip = namei(path)) == 0)
80105e1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105e22:	89 04 24             	mov    %eax,(%esp)
80105e25:	e8 f9 c5 ff ff       	call   80102423 <namei>
80105e2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105e2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105e31:	75 0a                	jne    80105e3d <sys_open+0xa8>
      return -1;
80105e33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e38:	e9 dc 00 00 00       	jmp    80105f19 <sys_open+0x184>
    ilock(ip);
80105e3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e40:	89 04 24             	mov    %eax,(%esp)
80105e43:	e8 33 ba ff ff       	call   8010187b <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e4b:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105e4f:	66 83 f8 01          	cmp    $0x1,%ax
80105e53:	75 1c                	jne    80105e71 <sys_open+0xdc>
80105e55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105e58:	85 c0                	test   %eax,%eax
80105e5a:	74 15                	je     80105e71 <sys_open+0xdc>
      iunlockput(ip);
80105e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e5f:	89 04 24             	mov    %eax,(%esp)
80105e62:	e8 9b bc ff ff       	call   80101b02 <iunlockput>
      return -1;
80105e67:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e6c:	e9 a8 00 00 00       	jmp    80105f19 <sys_open+0x184>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105e71:	e8 ae b0 ff ff       	call   80100f24 <filealloc>
80105e76:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105e79:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105e7d:	74 14                	je     80105e93 <sys_open+0xfe>
80105e7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105e82:	89 04 24             	mov    %eax,(%esp)
80105e85:	e8 43 f7 ff ff       	call   801055cd <fdalloc>
80105e8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
80105e8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80105e91:	79 23                	jns    80105eb6 <sys_open+0x121>
    if(f)
80105e93:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105e97:	74 0b                	je     80105ea4 <sys_open+0x10f>
      fileclose(f);
80105e99:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105e9c:	89 04 24             	mov    %eax,(%esp)
80105e9f:	e8 29 b1 ff ff       	call   80100fcd <fileclose>
    iunlockput(ip);
80105ea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ea7:	89 04 24             	mov    %eax,(%esp)
80105eaa:	e8 53 bc ff ff       	call   80101b02 <iunlockput>
    return -1;
80105eaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105eb4:	eb 63                	jmp    80105f19 <sys_open+0x184>
  }
  iunlock(ip);
80105eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105eb9:	89 04 24             	mov    %eax,(%esp)
80105ebc:	e8 0b bb ff ff       	call   801019cc <iunlock>

  f->type = FD_INODE;
80105ec1:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ec4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  f->ip = ip;
80105eca:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ecd:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105ed0:	89 50 10             	mov    %edx,0x10(%eax)
  f->off = 0;
80105ed3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ed6:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  f->readable = !(omode & O_WRONLY);
80105edd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105ee0:	83 e0 01             	and    $0x1,%eax
80105ee3:	85 c0                	test   %eax,%eax
80105ee5:	0f 94 c2             	sete   %dl
80105ee8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105eeb:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105eee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105ef1:	83 e0 01             	and    $0x1,%eax
80105ef4:	84 c0                	test   %al,%al
80105ef6:	75 0a                	jne    80105f02 <sys_open+0x16d>
80105ef8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105efb:	83 e0 02             	and    $0x2,%eax
80105efe:	85 c0                	test   %eax,%eax
80105f00:	74 07                	je     80105f09 <sys_open+0x174>
80105f02:	b8 01 00 00 00       	mov    $0x1,%eax
80105f07:	eb 05                	jmp    80105f0e <sys_open+0x179>
80105f09:	b8 00 00 00 00       	mov    $0x0,%eax
80105f0e:	89 c2                	mov    %eax,%edx
80105f10:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f13:	88 50 09             	mov    %dl,0x9(%eax)
  return fd;
80105f16:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
80105f19:	c9                   	leave  
80105f1a:	c3                   	ret    

80105f1b <sys_mkdir>:

int
sys_mkdir(void)
{
80105f1b:	55                   	push   %ebp
80105f1c:	89 e5                	mov    %esp,%ebp
80105f1e:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_trans();
80105f21:	e8 ec d2 ff ff       	call   80103212 <begin_trans>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80105f26:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105f29:	89 44 24 04          	mov    %eax,0x4(%esp)
80105f2d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105f34:	e8 56 f5 ff ff       	call   8010548f <argstr>
80105f39:	85 c0                	test   %eax,%eax
80105f3b:	78 2c                	js     80105f69 <sys_mkdir+0x4e>
80105f3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f40:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105f47:	00 
80105f48:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105f4f:	00 
80105f50:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80105f57:	00 
80105f58:	89 04 24             	mov    %eax,(%esp)
80105f5b:	e8 75 fc ff ff       	call   80105bd5 <create>
80105f60:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105f63:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105f67:	75 0c                	jne    80105f75 <sys_mkdir+0x5a>
    commit_trans();
80105f69:	e8 ed d2 ff ff       	call   8010325b <commit_trans>
    return -1;
80105f6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105f73:	eb 15                	jmp    80105f8a <sys_mkdir+0x6f>
  }
  iunlockput(ip);
80105f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105f78:	89 04 24             	mov    %eax,(%esp)
80105f7b:	e8 82 bb ff ff       	call   80101b02 <iunlockput>
  commit_trans();
80105f80:	e8 d6 d2 ff ff       	call   8010325b <commit_trans>
  return 0;
80105f85:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105f8a:	c9                   	leave  
80105f8b:	c3                   	ret    

80105f8c <sys_mknod>:

int
sys_mknod(void)
{
80105f8c:	55                   	push   %ebp
80105f8d:	89 e5                	mov    %esp,%ebp
80105f8f:	83 ec 38             	sub    $0x38,%esp
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
80105f92:	e8 7b d2 ff ff       	call   80103212 <begin_trans>
  if((len=argstr(0, &path)) < 0 ||
80105f97:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105f9a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105f9e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105fa5:	e8 e5 f4 ff ff       	call   8010548f <argstr>
80105faa:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105fad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105fb1:	78 5e                	js     80106011 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
80105fb3:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105fb6:	89 44 24 04          	mov    %eax,0x4(%esp)
80105fba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105fc1:	e8 38 f4 ff ff       	call   801053fe <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105fc6:	85 c0                	test   %eax,%eax
80105fc8:	78 47                	js     80106011 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105fca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105fcd:	89 44 24 04          	mov    %eax,0x4(%esp)
80105fd1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105fd8:	e8 21 f4 ff ff       	call   801053fe <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105fdd:	85 c0                	test   %eax,%eax
80105fdf:	78 30                	js     80106011 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
80105fe1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105fe4:	0f bf c8             	movswl %ax,%ecx
80105fe7:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105fea:	0f bf d0             	movswl %ax,%edx
80105fed:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105ff0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80105ff4:	89 54 24 08          	mov    %edx,0x8(%esp)
80105ff8:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80105fff:	00 
80106000:	89 04 24             	mov    %eax,(%esp)
80106003:	e8 cd fb ff ff       	call   80105bd5 <create>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80106008:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010600b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010600f:	75 0c                	jne    8010601d <sys_mknod+0x91>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    commit_trans();
80106011:	e8 45 d2 ff ff       	call   8010325b <commit_trans>
    return -1;
80106016:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010601b:	eb 15                	jmp    80106032 <sys_mknod+0xa6>
  }
  iunlockput(ip);
8010601d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106020:	89 04 24             	mov    %eax,(%esp)
80106023:	e8 da ba ff ff       	call   80101b02 <iunlockput>
  commit_trans();
80106028:	e8 2e d2 ff ff       	call   8010325b <commit_trans>
  return 0;
8010602d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106032:	c9                   	leave  
80106033:	c3                   	ret    

80106034 <sys_chdir>:

int
sys_chdir(void)
{
80106034:	55                   	push   %ebp
80106035:	89 e5                	mov    %esp,%ebp
80106037:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
8010603a:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010603d:	89 44 24 04          	mov    %eax,0x4(%esp)
80106041:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106048:	e8 42 f4 ff ff       	call   8010548f <argstr>
8010604d:	85 c0                	test   %eax,%eax
8010604f:	78 14                	js     80106065 <sys_chdir+0x31>
80106051:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106054:	89 04 24             	mov    %eax,(%esp)
80106057:	e8 c7 c3 ff ff       	call   80102423 <namei>
8010605c:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010605f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80106063:	75 07                	jne    8010606c <sys_chdir+0x38>
    return -1;
80106065:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010606a:	eb 57                	jmp    801060c3 <sys_chdir+0x8f>
  ilock(ip);
8010606c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010606f:	89 04 24             	mov    %eax,(%esp)
80106072:	e8 04 b8 ff ff       	call   8010187b <ilock>
  if(ip->type != T_DIR){
80106077:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010607a:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010607e:	66 83 f8 01          	cmp    $0x1,%ax
80106082:	74 12                	je     80106096 <sys_chdir+0x62>
    iunlockput(ip);
80106084:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106087:	89 04 24             	mov    %eax,(%esp)
8010608a:	e8 73 ba ff ff       	call   80101b02 <iunlockput>
    return -1;
8010608f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106094:	eb 2d                	jmp    801060c3 <sys_chdir+0x8f>
  }
  iunlock(ip);
80106096:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106099:	89 04 24             	mov    %eax,(%esp)
8010609c:	e8 2b b9 ff ff       	call   801019cc <iunlock>
  iput(proc->cwd);
801060a1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060a7:	8b 40 68             	mov    0x68(%eax),%eax
801060aa:	89 04 24             	mov    %eax,(%esp)
801060ad:	e8 7f b9 ff ff       	call   80101a31 <iput>
  proc->cwd = ip;
801060b2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801060b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
801060bb:	89 50 68             	mov    %edx,0x68(%eax)
  return 0;
801060be:	b8 00 00 00 00       	mov    $0x0,%eax
}
801060c3:	c9                   	leave  
801060c4:	c3                   	ret    

801060c5 <sys_exec>:

int
sys_exec(void)
{
801060c5:	55                   	push   %ebp
801060c6:	89 e5                	mov    %esp,%ebp
801060c8:	81 ec a8 00 00 00    	sub    $0xa8,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801060ce:	8d 45 f0             	lea    -0x10(%ebp),%eax
801060d1:	89 44 24 04          	mov    %eax,0x4(%esp)
801060d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801060dc:	e8 ae f3 ff ff       	call   8010548f <argstr>
801060e1:	85 c0                	test   %eax,%eax
801060e3:	78 1a                	js     801060ff <sys_exec+0x3a>
801060e5:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
801060eb:	89 44 24 04          	mov    %eax,0x4(%esp)
801060ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801060f6:	e8 03 f3 ff ff       	call   801053fe <argint>
801060fb:	85 c0                	test   %eax,%eax
801060fd:	79 0a                	jns    80106109 <sys_exec+0x44>
    return -1;
801060ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106104:	e9 cd 00 00 00       	jmp    801061d6 <sys_exec+0x111>
  }
  memset(argv, 0, sizeof(argv));
80106109:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80106110:	00 
80106111:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106118:	00 
80106119:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
8010611f:	89 04 24             	mov    %eax,(%esp)
80106122:	e8 7b ef ff ff       	call   801050a2 <memset>
  for(i=0;; i++){
80106127:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(i >= NELEM(argv))
8010612e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106131:	83 f8 1f             	cmp    $0x1f,%eax
80106134:	76 0a                	jbe    80106140 <sys_exec+0x7b>
      return -1;
80106136:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010613b:	e9 96 00 00 00       	jmp    801061d6 <sys_exec+0x111>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80106140:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80106146:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106149:	c1 e2 02             	shl    $0x2,%edx
8010614c:	89 d1                	mov    %edx,%ecx
8010614e:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
80106154:	8d 14 11             	lea    (%ecx,%edx,1),%edx
80106157:	89 44 24 04          	mov    %eax,0x4(%esp)
8010615b:	89 14 24             	mov    %edx,(%esp)
8010615e:	e8 fd f1 ff ff       	call   80105360 <fetchint>
80106163:	85 c0                	test   %eax,%eax
80106165:	79 07                	jns    8010616e <sys_exec+0xa9>
      return -1;
80106167:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010616c:	eb 68                	jmp    801061d6 <sys_exec+0x111>
    if(uarg == 0){
8010616e:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
80106174:	85 c0                	test   %eax,%eax
80106176:	75 26                	jne    8010619e <sys_exec+0xd9>
      argv[i] = 0;
80106178:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010617b:	c7 84 85 70 ff ff ff 	movl   $0x0,-0x90(%ebp,%eax,4)
80106182:	00 00 00 00 
      break;
80106186:	90                   	nop
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80106187:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010618a:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
80106190:	89 54 24 04          	mov    %edx,0x4(%esp)
80106194:	89 04 24             	mov    %eax,(%esp)
80106197:	e8 5c a9 ff ff       	call   80100af8 <exec>
8010619c:	eb 38                	jmp    801061d6 <sys_exec+0x111>
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010619e:	8b 45 f4             	mov    -0xc(%ebp),%eax
801061a1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801061a8:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
801061ae:	01 d0                	add    %edx,%eax
801061b0:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
801061b6:	89 44 24 04          	mov    %eax,0x4(%esp)
801061ba:	89 14 24             	mov    %edx,(%esp)
801061bd:	e8 d8 f1 ff ff       	call   8010539a <fetchstr>
801061c2:	85 c0                	test   %eax,%eax
801061c4:	79 07                	jns    801061cd <sys_exec+0x108>
      return -1;
801061c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061cb:	eb 09                	jmp    801061d6 <sys_exec+0x111>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801061cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
801061d1:	e9 58 ff ff ff       	jmp    8010612e <sys_exec+0x69>
  return exec(path, argv);
}
801061d6:	c9                   	leave  
801061d7:	c3                   	ret    

801061d8 <sys_pipe>:

int
sys_pipe(void)
{
801061d8:	55                   	push   %ebp
801061d9:	89 e5                	mov    %esp,%ebp
801061db:	83 ec 38             	sub    $0x38,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801061de:	8d 45 ec             	lea    -0x14(%ebp),%eax
801061e1:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
801061e8:	00 
801061e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801061ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801061f4:	e8 34 f2 ff ff       	call   8010542d <argptr>
801061f9:	85 c0                	test   %eax,%eax
801061fb:	79 0a                	jns    80106207 <sys_pipe+0x2f>
    return -1;
801061fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106202:	e9 9b 00 00 00       	jmp    801062a2 <sys_pipe+0xca>
  if(pipealloc(&rf, &wf) < 0)
80106207:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010620a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010620e:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106211:	89 04 24             	mov    %eax,(%esp)
80106214:	e8 eb d9 ff ff       	call   80103c04 <pipealloc>
80106219:	85 c0                	test   %eax,%eax
8010621b:	79 07                	jns    80106224 <sys_pipe+0x4c>
    return -1;
8010621d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106222:	eb 7e                	jmp    801062a2 <sys_pipe+0xca>
  fd0 = -1;
80106224:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010622b:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010622e:	89 04 24             	mov    %eax,(%esp)
80106231:	e8 97 f3 ff ff       	call   801055cd <fdalloc>
80106236:	89 45 f0             	mov    %eax,-0x10(%ebp)
80106239:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010623d:	78 14                	js     80106253 <sys_pipe+0x7b>
8010623f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106242:	89 04 24             	mov    %eax,(%esp)
80106245:	e8 83 f3 ff ff       	call   801055cd <fdalloc>
8010624a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010624d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80106251:	79 37                	jns    8010628a <sys_pipe+0xb2>
    if(fd0 >= 0)
80106253:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80106257:	78 14                	js     8010626d <sys_pipe+0x95>
      proc->ofile[fd0] = 0;
80106259:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010625f:	8b 55 f0             	mov    -0x10(%ebp),%edx
80106262:	83 c2 08             	add    $0x8,%edx
80106265:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
8010626c:	00 
    fileclose(rf);
8010626d:	8b 45 e8             	mov    -0x18(%ebp),%eax
80106270:	89 04 24             	mov    %eax,(%esp)
80106273:	e8 55 ad ff ff       	call   80100fcd <fileclose>
    fileclose(wf);
80106278:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010627b:	89 04 24             	mov    %eax,(%esp)
8010627e:	e8 4a ad ff ff       	call   80100fcd <fileclose>
    return -1;
80106283:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106288:	eb 18                	jmp    801062a2 <sys_pipe+0xca>
  }
  fd[0] = fd0;
8010628a:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010628d:	8b 55 f0             	mov    -0x10(%ebp),%edx
80106290:	89 10                	mov    %edx,(%eax)
  fd[1] = fd1;
80106292:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106295:	8d 50 04             	lea    0x4(%eax),%edx
80106298:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010629b:	89 02                	mov    %eax,(%edx)
  return 0;
8010629d:	b8 00 00 00 00       	mov    $0x0,%eax
}
801062a2:	c9                   	leave  
801062a3:	c3                   	ret    

801062a4 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801062a4:	55                   	push   %ebp
801062a5:	89 e5                	mov    %esp,%ebp
801062a7:	83 ec 08             	sub    $0x8,%esp
  return fork();
801062aa:	e8 8e e0 ff ff       	call   8010433d <fork>
}
801062af:	c9                   	leave  
801062b0:	c3                   	ret    

801062b1 <sys_clone>:

int
sys_clone(){
801062b1:	55                   	push   %ebp
801062b2:	89 e5                	mov    %esp,%ebp
801062b4:	53                   	push   %ebx
801062b5:	83 ec 24             	sub    $0x24,%esp
    int stack;
    int size;
    int routine;
    int arg;

    if(argint(1,&size) < 0 || size <=0 || argint(0,&stack) <0 ||
801062b8:	8d 45 f0             	lea    -0x10(%ebp),%eax
801062bb:	89 44 24 04          	mov    %eax,0x4(%esp)
801062bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801062c6:	e8 33 f1 ff ff       	call   801053fe <argint>
801062cb:	85 c0                	test   %eax,%eax
801062cd:	78 4c                	js     8010631b <sys_clone+0x6a>
801062cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
801062d2:	85 c0                	test   %eax,%eax
801062d4:	7e 45                	jle    8010631b <sys_clone+0x6a>
801062d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801062d9:	89 44 24 04          	mov    %eax,0x4(%esp)
801062dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801062e4:	e8 15 f1 ff ff       	call   801053fe <argint>
801062e9:	85 c0                	test   %eax,%eax
801062eb:	78 2e                	js     8010631b <sys_clone+0x6a>
            argint(2,&routine) < 0 || argint(3,&arg)<0){
801062ed:	8d 45 ec             	lea    -0x14(%ebp),%eax
801062f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801062f4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801062fb:	e8 fe f0 ff ff       	call   801053fe <argint>
    int stack;
    int size;
    int routine;
    int arg;

    if(argint(1,&size) < 0 || size <=0 || argint(0,&stack) <0 ||
80106300:	85 c0                	test   %eax,%eax
80106302:	78 17                	js     8010631b <sys_clone+0x6a>
            argint(2,&routine) < 0 || argint(3,&arg)<0){
80106304:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106307:	89 44 24 04          	mov    %eax,0x4(%esp)
8010630b:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
80106312:	e8 e7 f0 ff ff       	call   801053fe <argint>
    int stack;
    int size;
    int routine;
    int arg;

    if(argint(1,&size) < 0 || size <=0 || argint(0,&stack) <0 ||
80106317:	85 c0                	test   %eax,%eax
80106319:	79 07                	jns    80106322 <sys_clone+0x71>
            argint(2,&routine) < 0 || argint(3,&arg)<0){
        return -1;
8010631b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106320:	eb 20                	jmp    80106342 <sys_clone+0x91>
    }
    return clone(stack,size,routine,arg);
80106322:	8b 5d e8             	mov    -0x18(%ebp),%ebx
80106325:	8b 4d ec             	mov    -0x14(%ebp),%ecx
80106328:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010632b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010632e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80106332:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80106336:	89 54 24 04          	mov    %edx,0x4(%esp)
8010633a:	89 04 24             	mov    %eax,(%esp)
8010633d:	e8 6b e1 ff ff       	call   801044ad <clone>
}
80106342:	83 c4 24             	add    $0x24,%esp
80106345:	5b                   	pop    %ebx
80106346:	5d                   	pop    %ebp
80106347:	c3                   	ret    

80106348 <sys_exit>:

int
sys_exit(void)
{
80106348:	55                   	push   %ebp
80106349:	89 e5                	mov    %esp,%ebp
8010634b:	83 ec 08             	sub    $0x8,%esp
  exit();
8010634e:	e8 6e e3 ff ff       	call   801046c1 <exit>
  return 0;  // not reached
80106353:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106358:	c9                   	leave  
80106359:	c3                   	ret    

8010635a <sys_texit>:

int
sys_texit(void)
{
8010635a:	55                   	push   %ebp
8010635b:	89 e5                	mov    %esp,%ebp
8010635d:	83 ec 08             	sub    $0x8,%esp
    texit();
80106360:	e8 78 e4 ff ff       	call   801047dd <texit>
    return 0;
80106365:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010636a:	c9                   	leave  
8010636b:	c3                   	ret    

8010636c <sys_wait>:

int
sys_wait(void)
{
8010636c:	55                   	push   %ebp
8010636d:	89 e5                	mov    %esp,%ebp
8010636f:	83 ec 08             	sub    $0x8,%esp
  return wait();
80106372:	e8 34 e5 ff ff       	call   801048ab <wait>
}
80106377:	c9                   	leave  
80106378:	c3                   	ret    

80106379 <sys_kill>:

int
sys_kill(void)
{
80106379:	55                   	push   %ebp
8010637a:	89 e5                	mov    %esp,%ebp
8010637c:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
8010637f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106382:	89 44 24 04          	mov    %eax,0x4(%esp)
80106386:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010638d:	e8 6c f0 ff ff       	call   801053fe <argint>
80106392:	85 c0                	test   %eax,%eax
80106394:	79 07                	jns    8010639d <sys_kill+0x24>
    return -1;
80106396:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010639b:	eb 0b                	jmp    801063a8 <sys_kill+0x2f>
  return kill(pid);
8010639d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801063a0:	89 04 24             	mov    %eax,(%esp)
801063a3:	e8 d9 e8 ff ff       	call   80104c81 <kill>
}
801063a8:	c9                   	leave  
801063a9:	c3                   	ret    

801063aa <sys_getpid>:

int
sys_getpid(void)
{
801063aa:	55                   	push   %ebp
801063ab:	89 e5                	mov    %esp,%ebp
  return proc->pid;
801063ad:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801063b3:	8b 40 10             	mov    0x10(%eax),%eax
}
801063b6:	5d                   	pop    %ebp
801063b7:	c3                   	ret    

801063b8 <sys_sbrk>:

int
sys_sbrk(void)
{
801063b8:	55                   	push   %ebp
801063b9:	89 e5                	mov    %esp,%ebp
801063bb:	83 ec 28             	sub    $0x28,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801063be:	8d 45 f0             	lea    -0x10(%ebp),%eax
801063c1:	89 44 24 04          	mov    %eax,0x4(%esp)
801063c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801063cc:	e8 2d f0 ff ff       	call   801053fe <argint>
801063d1:	85 c0                	test   %eax,%eax
801063d3:	79 07                	jns    801063dc <sys_sbrk+0x24>
    return -1;
801063d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801063da:	eb 24                	jmp    80106400 <sys_sbrk+0x48>
  addr = proc->sz;
801063dc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801063e2:	8b 00                	mov    (%eax),%eax
801063e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(growproc(n) < 0)
801063e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801063ea:	89 04 24             	mov    %eax,(%esp)
801063ed:	e8 a6 de ff ff       	call   80104298 <growproc>
801063f2:	85 c0                	test   %eax,%eax
801063f4:	79 07                	jns    801063fd <sys_sbrk+0x45>
    return -1;
801063f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801063fb:	eb 03                	jmp    80106400 <sys_sbrk+0x48>
  return addr;
801063fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80106400:	c9                   	leave  
80106401:	c3                   	ret    

80106402 <sys_sleep>:

int
sys_sleep(void)
{
80106402:	55                   	push   %ebp
80106403:	89 e5                	mov    %esp,%ebp
80106405:	83 ec 28             	sub    $0x28,%esp
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
80106408:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010640b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010640f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106416:	e8 e3 ef ff ff       	call   801053fe <argint>
8010641b:	85 c0                	test   %eax,%eax
8010641d:	79 07                	jns    80106426 <sys_sleep+0x24>
    return -1;
8010641f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106424:	eb 6c                	jmp    80106492 <sys_sleep+0x90>
  acquire(&tickslock);
80106426:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
8010642d:	e8 21 ea ff ff       	call   80104e53 <acquire>
  ticks0 = ticks;
80106432:	a1 a0 28 11 80       	mov    0x801128a0,%eax
80106437:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(ticks - ticks0 < n){
8010643a:	eb 34                	jmp    80106470 <sys_sleep+0x6e>
    if(proc->killed){
8010643c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106442:	8b 40 24             	mov    0x24(%eax),%eax
80106445:	85 c0                	test   %eax,%eax
80106447:	74 13                	je     8010645c <sys_sleep+0x5a>
      release(&tickslock);
80106449:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
80106450:	e8 5f ea ff ff       	call   80104eb4 <release>
      return -1;
80106455:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010645a:	eb 36                	jmp    80106492 <sys_sleep+0x90>
    }
    sleep(&ticks, &tickslock);
8010645c:	c7 44 24 04 60 20 11 	movl   $0x80112060,0x4(%esp)
80106463:	80 
80106464:	c7 04 24 a0 28 11 80 	movl   $0x801128a0,(%esp)
8010646b:	e8 09 e7 ff ff       	call   80104b79 <sleep>
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80106470:	a1 a0 28 11 80       	mov    0x801128a0,%eax
80106475:	89 c2                	mov    %eax,%edx
80106477:	2b 55 f4             	sub    -0xc(%ebp),%edx
8010647a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010647d:	39 c2                	cmp    %eax,%edx
8010647f:	72 bb                	jb     8010643c <sys_sleep+0x3a>
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80106481:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
80106488:	e8 27 ea ff ff       	call   80104eb4 <release>
  return 0;
8010648d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106492:	c9                   	leave  
80106493:	c3                   	ret    

80106494 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80106494:	55                   	push   %ebp
80106495:	89 e5                	mov    %esp,%ebp
80106497:	83 ec 28             	sub    $0x28,%esp
  uint xticks;
  
  acquire(&tickslock);
8010649a:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
801064a1:	e8 ad e9 ff ff       	call   80104e53 <acquire>
  xticks = ticks;
801064a6:	a1 a0 28 11 80       	mov    0x801128a0,%eax
801064ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&tickslock);
801064ae:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
801064b5:	e8 fa e9 ff ff       	call   80104eb4 <release>
  return xticks;
801064ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801064bd:	c9                   	leave  
801064be:	c3                   	ret    
	...

801064c0 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801064c0:	55                   	push   %ebp
801064c1:	89 e5                	mov    %esp,%ebp
801064c3:	83 ec 08             	sub    $0x8,%esp
801064c6:	8b 55 08             	mov    0x8(%ebp),%edx
801064c9:	8b 45 0c             	mov    0xc(%ebp),%eax
801064cc:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801064d0:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801064d3:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801064d7:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801064db:	ee                   	out    %al,(%dx)
}
801064dc:	c9                   	leave  
801064dd:	c3                   	ret    

801064de <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
801064de:	55                   	push   %ebp
801064df:	89 e5                	mov    %esp,%ebp
801064e1:	83 ec 18             	sub    $0x18,%esp
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
801064e4:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
801064eb:	00 
801064ec:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
801064f3:	e8 c8 ff ff ff       	call   801064c0 <outb>
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
801064f8:	c7 44 24 04 9c 00 00 	movl   $0x9c,0x4(%esp)
801064ff:	00 
80106500:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
80106507:	e8 b4 ff ff ff       	call   801064c0 <outb>
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
8010650c:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
80106513:	00 
80106514:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
8010651b:	e8 a0 ff ff ff       	call   801064c0 <outb>
  picenable(IRQ_TIMER);
80106520:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106527:	e8 61 d5 ff ff       	call   80103a8d <picenable>
}
8010652c:	c9                   	leave  
8010652d:	c3                   	ret    
	...

80106530 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80106530:	1e                   	push   %ds
  pushl %es
80106531:	06                   	push   %es
  pushl %fs
80106532:	0f a0                	push   %fs
  pushl %gs
80106534:	0f a8                	push   %gs
  pushal
80106536:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
80106537:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
8010653b:	8e d8                	mov    %eax,%ds
  movw %ax, %es
8010653d:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
8010653f:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
80106543:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
80106545:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
80106547:	54                   	push   %esp
  call trap
80106548:	e8 d5 01 00 00       	call   80106722 <trap>
  addl $4, %esp
8010654d:	83 c4 04             	add    $0x4,%esp

80106550 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80106550:	61                   	popa   
  popl %gs
80106551:	0f a9                	pop    %gs
  popl %fs
80106553:	0f a1                	pop    %fs
  popl %es
80106555:	07                   	pop    %es
  popl %ds
80106556:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80106557:	83 c4 08             	add    $0x8,%esp
  iret
8010655a:	cf                   	iret   
	...

8010655c <lidt>:

struct gatedesc;

static inline void
lidt(struct gatedesc *p, int size)
{
8010655c:	55                   	push   %ebp
8010655d:	89 e5                	mov    %esp,%ebp
8010655f:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80106562:	8b 45 0c             	mov    0xc(%ebp),%eax
80106565:	83 e8 01             	sub    $0x1,%eax
80106568:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010656c:	8b 45 08             	mov    0x8(%ebp),%eax
8010656f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80106573:	8b 45 08             	mov    0x8(%ebp),%eax
80106576:	c1 e8 10             	shr    $0x10,%eax
80106579:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010657d:	8d 45 fa             	lea    -0x6(%ebp),%eax
80106580:	0f 01 18             	lidtl  (%eax)
}
80106583:	c9                   	leave  
80106584:	c3                   	ret    

80106585 <rcr2>:
  return result;
}

static inline uint
rcr2(void)
{
80106585:	55                   	push   %ebp
80106586:	89 e5                	mov    %esp,%ebp
80106588:	83 ec 10             	sub    $0x10,%esp
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
8010658b:	0f 20 d0             	mov    %cr2,%eax
8010658e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return val;
80106591:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80106594:	c9                   	leave  
80106595:	c3                   	ret    

80106596 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80106596:	55                   	push   %ebp
80106597:	89 e5                	mov    %esp,%ebp
80106599:	83 ec 28             	sub    $0x28,%esp
  int i;

  for(i = 0; i < 256; i++)
8010659c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801065a3:	e9 bf 00 00 00       	jmp    80106667 <tvinit+0xd1>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801065a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801065ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
801065ae:	8b 14 95 a0 b0 10 80 	mov    -0x7fef4f60(,%edx,4),%edx
801065b5:	66 89 14 c5 a0 20 11 	mov    %dx,-0x7feedf60(,%eax,8)
801065bc:	80 
801065bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801065c0:	66 c7 04 c5 a2 20 11 	movw   $0x8,-0x7feedf5e(,%eax,8)
801065c7:	80 08 00 
801065ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
801065cd:	0f b6 14 c5 a4 20 11 	movzbl -0x7feedf5c(,%eax,8),%edx
801065d4:	80 
801065d5:	83 e2 e0             	and    $0xffffffe0,%edx
801065d8:	88 14 c5 a4 20 11 80 	mov    %dl,-0x7feedf5c(,%eax,8)
801065df:	8b 45 f4             	mov    -0xc(%ebp),%eax
801065e2:	0f b6 14 c5 a4 20 11 	movzbl -0x7feedf5c(,%eax,8),%edx
801065e9:	80 
801065ea:	83 e2 1f             	and    $0x1f,%edx
801065ed:	88 14 c5 a4 20 11 80 	mov    %dl,-0x7feedf5c(,%eax,8)
801065f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801065f7:	0f b6 14 c5 a5 20 11 	movzbl -0x7feedf5b(,%eax,8),%edx
801065fe:	80 
801065ff:	83 e2 f0             	and    $0xfffffff0,%edx
80106602:	83 ca 0e             	or     $0xe,%edx
80106605:	88 14 c5 a5 20 11 80 	mov    %dl,-0x7feedf5b(,%eax,8)
8010660c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010660f:	0f b6 14 c5 a5 20 11 	movzbl -0x7feedf5b(,%eax,8),%edx
80106616:	80 
80106617:	83 e2 ef             	and    $0xffffffef,%edx
8010661a:	88 14 c5 a5 20 11 80 	mov    %dl,-0x7feedf5b(,%eax,8)
80106621:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106624:	0f b6 14 c5 a5 20 11 	movzbl -0x7feedf5b(,%eax,8),%edx
8010662b:	80 
8010662c:	83 e2 9f             	and    $0xffffff9f,%edx
8010662f:	88 14 c5 a5 20 11 80 	mov    %dl,-0x7feedf5b(,%eax,8)
80106636:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106639:	0f b6 14 c5 a5 20 11 	movzbl -0x7feedf5b(,%eax,8),%edx
80106640:	80 
80106641:	83 ca 80             	or     $0xffffff80,%edx
80106644:	88 14 c5 a5 20 11 80 	mov    %dl,-0x7feedf5b(,%eax,8)
8010664b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010664e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106651:	8b 14 95 a0 b0 10 80 	mov    -0x7fef4f60(,%edx,4),%edx
80106658:	c1 ea 10             	shr    $0x10,%edx
8010665b:	66 89 14 c5 a6 20 11 	mov    %dx,-0x7feedf5a(,%eax,8)
80106662:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80106663:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106667:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
8010666e:	0f 8e 34 ff ff ff    	jle    801065a8 <tvinit+0x12>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80106674:	a1 a0 b1 10 80       	mov    0x8010b1a0,%eax
80106679:	66 a3 a0 22 11 80    	mov    %ax,0x801122a0
8010667f:	66 c7 05 a2 22 11 80 	movw   $0x8,0x801122a2
80106686:	08 00 
80106688:	0f b6 05 a4 22 11 80 	movzbl 0x801122a4,%eax
8010668f:	83 e0 e0             	and    $0xffffffe0,%eax
80106692:	a2 a4 22 11 80       	mov    %al,0x801122a4
80106697:	0f b6 05 a4 22 11 80 	movzbl 0x801122a4,%eax
8010669e:	83 e0 1f             	and    $0x1f,%eax
801066a1:	a2 a4 22 11 80       	mov    %al,0x801122a4
801066a6:	0f b6 05 a5 22 11 80 	movzbl 0x801122a5,%eax
801066ad:	83 c8 0f             	or     $0xf,%eax
801066b0:	a2 a5 22 11 80       	mov    %al,0x801122a5
801066b5:	0f b6 05 a5 22 11 80 	movzbl 0x801122a5,%eax
801066bc:	83 e0 ef             	and    $0xffffffef,%eax
801066bf:	a2 a5 22 11 80       	mov    %al,0x801122a5
801066c4:	0f b6 05 a5 22 11 80 	movzbl 0x801122a5,%eax
801066cb:	83 c8 60             	or     $0x60,%eax
801066ce:	a2 a5 22 11 80       	mov    %al,0x801122a5
801066d3:	0f b6 05 a5 22 11 80 	movzbl 0x801122a5,%eax
801066da:	83 c8 80             	or     $0xffffff80,%eax
801066dd:	a2 a5 22 11 80       	mov    %al,0x801122a5
801066e2:	a1 a0 b1 10 80       	mov    0x8010b1a0,%eax
801066e7:	c1 e8 10             	shr    $0x10,%eax
801066ea:	66 a3 a6 22 11 80    	mov    %ax,0x801122a6
  
  initlock(&tickslock, "time");
801066f0:	c7 44 24 04 00 89 10 	movl   $0x80108900,0x4(%esp)
801066f7:	80 
801066f8:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
801066ff:	e8 2e e7 ff ff       	call   80104e32 <initlock>
}
80106704:	c9                   	leave  
80106705:	c3                   	ret    

80106706 <idtinit>:

void
idtinit(void)
{
80106706:	55                   	push   %ebp
80106707:	89 e5                	mov    %esp,%ebp
80106709:	83 ec 08             	sub    $0x8,%esp
  lidt(idt, sizeof(idt));
8010670c:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
80106713:	00 
80106714:	c7 04 24 a0 20 11 80 	movl   $0x801120a0,(%esp)
8010671b:	e8 3c fe ff ff       	call   8010655c <lidt>
}
80106720:	c9                   	leave  
80106721:	c3                   	ret    

80106722 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80106722:	55                   	push   %ebp
80106723:	89 e5                	mov    %esp,%ebp
80106725:	57                   	push   %edi
80106726:	56                   	push   %esi
80106727:	53                   	push   %ebx
80106728:	83 ec 3c             	sub    $0x3c,%esp
  if(tf->trapno == T_SYSCALL){
8010672b:	8b 45 08             	mov    0x8(%ebp),%eax
8010672e:	8b 40 30             	mov    0x30(%eax),%eax
80106731:	83 f8 40             	cmp    $0x40,%eax
80106734:	75 3e                	jne    80106774 <trap+0x52>
    if(proc->killed)
80106736:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010673c:	8b 40 24             	mov    0x24(%eax),%eax
8010673f:	85 c0                	test   %eax,%eax
80106741:	74 05                	je     80106748 <trap+0x26>
      exit();
80106743:	e8 79 df ff ff       	call   801046c1 <exit>
    proc->tf = tf;
80106748:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010674e:	8b 55 08             	mov    0x8(%ebp),%edx
80106751:	89 50 18             	mov    %edx,0x18(%eax)
    syscall();
80106754:	e8 6d ed ff ff       	call   801054c6 <syscall>
    if(proc->killed)
80106759:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010675f:	8b 40 24             	mov    0x24(%eax),%eax
80106762:	85 c0                	test   %eax,%eax
80106764:	0f 84 34 02 00 00    	je     8010699e <trap+0x27c>
      exit();
8010676a:	e8 52 df ff ff       	call   801046c1 <exit>
    return;
8010676f:	e9 2b 02 00 00       	jmp    8010699f <trap+0x27d>
  }

  switch(tf->trapno){
80106774:	8b 45 08             	mov    0x8(%ebp),%eax
80106777:	8b 40 30             	mov    0x30(%eax),%eax
8010677a:	83 e8 20             	sub    $0x20,%eax
8010677d:	83 f8 1f             	cmp    $0x1f,%eax
80106780:	0f 87 bc 00 00 00    	ja     80106842 <trap+0x120>
80106786:	8b 04 85 a8 89 10 80 	mov    -0x7fef7658(,%eax,4),%eax
8010678d:	ff e0                	jmp    *%eax
  case T_IRQ0 + IRQ_TIMER:
    if(cpu->id == 0){
8010678f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106795:	0f b6 00             	movzbl (%eax),%eax
80106798:	84 c0                	test   %al,%al
8010679a:	75 31                	jne    801067cd <trap+0xab>
      acquire(&tickslock);
8010679c:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
801067a3:	e8 ab e6 ff ff       	call   80104e53 <acquire>
      ticks++;
801067a8:	a1 a0 28 11 80       	mov    0x801128a0,%eax
801067ad:	83 c0 01             	add    $0x1,%eax
801067b0:	a3 a0 28 11 80       	mov    %eax,0x801128a0
      wakeup(&ticks);
801067b5:	c7 04 24 a0 28 11 80 	movl   $0x801128a0,(%esp)
801067bc:	e8 95 e4 ff ff       	call   80104c56 <wakeup>
      release(&tickslock);
801067c1:	c7 04 24 60 20 11 80 	movl   $0x80112060,(%esp)
801067c8:	e8 e7 e6 ff ff       	call   80104eb4 <release>
    }
    lapiceoi();
801067cd:	e8 0e c7 ff ff       	call   80102ee0 <lapiceoi>
    break;
801067d2:	e9 41 01 00 00       	jmp    80106918 <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801067d7:	e8 1f bf ff ff       	call   801026fb <ideintr>
    lapiceoi();
801067dc:	e8 ff c6 ff ff       	call   80102ee0 <lapiceoi>
    break;
801067e1:	e9 32 01 00 00       	jmp    80106918 <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801067e6:	e8 d8 c4 ff ff       	call   80102cc3 <kbdintr>
    lapiceoi();
801067eb:	e8 f0 c6 ff ff       	call   80102ee0 <lapiceoi>
    break;
801067f0:	e9 23 01 00 00       	jmp    80106918 <trap+0x1f6>
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801067f5:	e8 9d 03 00 00       	call   80106b97 <uartintr>
    lapiceoi();
801067fa:	e8 e1 c6 ff ff       	call   80102ee0 <lapiceoi>
    break;
801067ff:	e9 14 01 00 00       	jmp    80106918 <trap+0x1f6>
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106804:	8b 45 08             	mov    0x8(%ebp),%eax
80106807:	8b 48 38             	mov    0x38(%eax),%ecx
            cpu->id, tf->cs, tf->eip);
8010680a:	8b 45 08             	mov    0x8(%ebp),%eax
8010680d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106811:	0f b7 d0             	movzwl %ax,%edx
            cpu->id, tf->cs, tf->eip);
80106814:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010681a:	0f b6 00             	movzbl (%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
8010681d:	0f b6 c0             	movzbl %al,%eax
80106820:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80106824:	89 54 24 08          	mov    %edx,0x8(%esp)
80106828:	89 44 24 04          	mov    %eax,0x4(%esp)
8010682c:	c7 04 24 08 89 10 80 	movl   $0x80108908,(%esp)
80106833:	e8 62 9b ff ff       	call   8010039a <cprintf>
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
80106838:	e8 a3 c6 ff ff       	call   80102ee0 <lapiceoi>
    break;
8010683d:	e9 d6 00 00 00       	jmp    80106918 <trap+0x1f6>
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80106842:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106848:	85 c0                	test   %eax,%eax
8010684a:	74 11                	je     8010685d <trap+0x13b>
8010684c:	8b 45 08             	mov    0x8(%ebp),%eax
8010684f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106853:	0f b7 c0             	movzwl %ax,%eax
80106856:	83 e0 03             	and    $0x3,%eax
80106859:	85 c0                	test   %eax,%eax
8010685b:	75 46                	jne    801068a3 <trap+0x181>
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010685d:	e8 23 fd ff ff       	call   80106585 <rcr2>
80106862:	8b 55 08             	mov    0x8(%ebp),%edx
80106865:	8b 5a 38             	mov    0x38(%edx),%ebx
              tf->trapno, cpu->id, tf->eip, rcr2());
80106868:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010686f:	0f b6 12             	movzbl (%edx),%edx
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106872:	0f b6 ca             	movzbl %dl,%ecx
80106875:	8b 55 08             	mov    0x8(%ebp),%edx
80106878:	8b 52 30             	mov    0x30(%edx),%edx
8010687b:	89 44 24 10          	mov    %eax,0x10(%esp)
8010687f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80106883:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80106887:	89 54 24 04          	mov    %edx,0x4(%esp)
8010688b:	c7 04 24 2c 89 10 80 	movl   $0x8010892c,(%esp)
80106892:	e8 03 9b ff ff       	call   8010039a <cprintf>
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
80106897:	c7 04 24 5e 89 10 80 	movl   $0x8010895e,(%esp)
8010689e:	e8 97 9c ff ff       	call   8010053a <panic>
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801068a3:	e8 dd fc ff ff       	call   80106585 <rcr2>
801068a8:	89 c2                	mov    %eax,%edx
801068aa:	8b 45 08             	mov    0x8(%ebp),%eax
801068ad:	8b 78 38             	mov    0x38(%eax),%edi
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801068b0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801068b6:	0f b6 00             	movzbl (%eax),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801068b9:	0f b6 f0             	movzbl %al,%esi
801068bc:	8b 45 08             	mov    0x8(%ebp),%eax
801068bf:	8b 58 34             	mov    0x34(%eax),%ebx
801068c2:	8b 45 08             	mov    0x8(%ebp),%eax
801068c5:	8b 48 30             	mov    0x30(%eax),%ecx
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801068c8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801068ce:	83 c0 6c             	add    $0x6c,%eax
801068d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801068d4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801068da:	8b 40 10             	mov    0x10(%eax),%eax
801068dd:	89 54 24 1c          	mov    %edx,0x1c(%esp)
801068e1:	89 7c 24 18          	mov    %edi,0x18(%esp)
801068e5:	89 74 24 14          	mov    %esi,0x14(%esp)
801068e9:	89 5c 24 10          	mov    %ebx,0x10(%esp)
801068ed:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
801068f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801068f4:	89 54 24 08          	mov    %edx,0x8(%esp)
801068f8:	89 44 24 04          	mov    %eax,0x4(%esp)
801068fc:	c7 04 24 64 89 10 80 	movl   $0x80108964,(%esp)
80106903:	e8 92 9a ff ff       	call   8010039a <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
            rcr2());
    proc->killed = 1;
80106908:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010690e:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80106915:	eb 01                	jmp    80106918 <trap+0x1f6>
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
80106917:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80106918:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010691e:	85 c0                	test   %eax,%eax
80106920:	74 24                	je     80106946 <trap+0x224>
80106922:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106928:	8b 40 24             	mov    0x24(%eax),%eax
8010692b:	85 c0                	test   %eax,%eax
8010692d:	74 17                	je     80106946 <trap+0x224>
8010692f:	8b 45 08             	mov    0x8(%ebp),%eax
80106932:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106936:	0f b7 c0             	movzwl %ax,%eax
80106939:	83 e0 03             	and    $0x3,%eax
8010693c:	83 f8 03             	cmp    $0x3,%eax
8010693f:	75 05                	jne    80106946 <trap+0x224>
    exit();
80106941:	e8 7b dd ff ff       	call   801046c1 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80106946:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010694c:	85 c0                	test   %eax,%eax
8010694e:	74 1e                	je     8010696e <trap+0x24c>
80106950:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106956:	8b 40 0c             	mov    0xc(%eax),%eax
80106959:	83 f8 04             	cmp    $0x4,%eax
8010695c:	75 10                	jne    8010696e <trap+0x24c>
8010695e:	8b 45 08             	mov    0x8(%ebp),%eax
80106961:	8b 40 30             	mov    0x30(%eax),%eax
80106964:	83 f8 20             	cmp    $0x20,%eax
80106967:	75 05                	jne    8010696e <trap+0x24c>
    yield();
80106969:	e8 ad e1 ff ff       	call   80104b1b <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010696e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106974:	85 c0                	test   %eax,%eax
80106976:	74 27                	je     8010699f <trap+0x27d>
80106978:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010697e:	8b 40 24             	mov    0x24(%eax),%eax
80106981:	85 c0                	test   %eax,%eax
80106983:	74 1a                	je     8010699f <trap+0x27d>
80106985:	8b 45 08             	mov    0x8(%ebp),%eax
80106988:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
8010698c:	0f b7 c0             	movzwl %ax,%eax
8010698f:	83 e0 03             	and    $0x3,%eax
80106992:	83 f8 03             	cmp    $0x3,%eax
80106995:	75 08                	jne    8010699f <trap+0x27d>
    exit();
80106997:	e8 25 dd ff ff       	call   801046c1 <exit>
8010699c:	eb 01                	jmp    8010699f <trap+0x27d>
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
8010699e:	90                   	nop
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
8010699f:	83 c4 3c             	add    $0x3c,%esp
801069a2:	5b                   	pop    %ebx
801069a3:	5e                   	pop    %esi
801069a4:	5f                   	pop    %edi
801069a5:	5d                   	pop    %ebp
801069a6:	c3                   	ret    
	...

801069a8 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801069a8:	55                   	push   %ebp
801069a9:	89 e5                	mov    %esp,%ebp
801069ab:	83 ec 14             	sub    $0x14,%esp
801069ae:	8b 45 08             	mov    0x8(%ebp),%eax
801069b1:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801069b5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801069b9:	89 c2                	mov    %eax,%edx
801069bb:	ec                   	in     (%dx),%al
801069bc:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
801069bf:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
801069c3:	c9                   	leave  
801069c4:	c3                   	ret    

801069c5 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801069c5:	55                   	push   %ebp
801069c6:	89 e5                	mov    %esp,%ebp
801069c8:	83 ec 08             	sub    $0x8,%esp
801069cb:	8b 55 08             	mov    0x8(%ebp),%edx
801069ce:	8b 45 0c             	mov    0xc(%ebp),%eax
801069d1:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801069d5:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801069d8:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801069dc:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801069e0:	ee                   	out    %al,(%dx)
}
801069e1:	c9                   	leave  
801069e2:	c3                   	ret    

801069e3 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
801069e3:	55                   	push   %ebp
801069e4:	89 e5                	mov    %esp,%ebp
801069e6:	83 ec 28             	sub    $0x28,%esp
  char *p;

  // Turn off the FIFO
  outb(COM1+2, 0);
801069e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801069f0:	00 
801069f1:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
801069f8:	e8 c8 ff ff ff       	call   801069c5 <outb>
  
  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
801069fd:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
80106a04:	00 
80106a05:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
80106a0c:	e8 b4 ff ff ff       	call   801069c5 <outb>
  outb(COM1+0, 115200/9600);
80106a11:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
80106a18:	00 
80106a19:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106a20:	e8 a0 ff ff ff       	call   801069c5 <outb>
  outb(COM1+1, 0);
80106a25:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a2c:	00 
80106a2d:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106a34:	e8 8c ff ff ff       	call   801069c5 <outb>
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
80106a39:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80106a40:	00 
80106a41:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
80106a48:	e8 78 ff ff ff       	call   801069c5 <outb>
  outb(COM1+4, 0);
80106a4d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106a54:	00 
80106a55:	c7 04 24 fc 03 00 00 	movl   $0x3fc,(%esp)
80106a5c:	e8 64 ff ff ff       	call   801069c5 <outb>
  outb(COM1+1, 0x01);    // Enable receive interrupts.
80106a61:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80106a68:	00 
80106a69:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106a70:	e8 50 ff ff ff       	call   801069c5 <outb>

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80106a75:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106a7c:	e8 27 ff ff ff       	call   801069a8 <inb>
80106a81:	3c ff                	cmp    $0xff,%al
80106a83:	74 6c                	je     80106af1 <uartinit+0x10e>
    return;
  uart = 1;
80106a85:	c7 05 4c b6 10 80 01 	movl   $0x1,0x8010b64c
80106a8c:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
80106a8f:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
80106a96:	e8 0d ff ff ff       	call   801069a8 <inb>
  inb(COM1+0);
80106a9b:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106aa2:	e8 01 ff ff ff       	call   801069a8 <inb>
  picenable(IRQ_COM1);
80106aa7:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80106aae:	e8 da cf ff ff       	call   80103a8d <picenable>
  ioapicenable(IRQ_COM1, 0);
80106ab3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106aba:	00 
80106abb:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80106ac2:	e8 b7 be ff ff       	call   8010297e <ioapicenable>
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106ac7:	c7 45 f4 28 8a 10 80 	movl   $0x80108a28,-0xc(%ebp)
80106ace:	eb 15                	jmp    80106ae5 <uartinit+0x102>
    uartputc(*p);
80106ad0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ad3:	0f b6 00             	movzbl (%eax),%eax
80106ad6:	0f be c0             	movsbl %al,%eax
80106ad9:	89 04 24             	mov    %eax,(%esp)
80106adc:	e8 13 00 00 00       	call   80106af4 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106ae1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ae8:	0f b6 00             	movzbl (%eax),%eax
80106aeb:	84 c0                	test   %al,%al
80106aed:	75 e1                	jne    80106ad0 <uartinit+0xed>
80106aef:	eb 01                	jmp    80106af2 <uartinit+0x10f>
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
    return;
80106af1:	90                   	nop
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}
80106af2:	c9                   	leave  
80106af3:	c3                   	ret    

80106af4 <uartputc>:

void
uartputc(int c)
{
80106af4:	55                   	push   %ebp
80106af5:	89 e5                	mov    %esp,%ebp
80106af7:	83 ec 28             	sub    $0x28,%esp
  int i;

  if(!uart)
80106afa:	a1 4c b6 10 80       	mov    0x8010b64c,%eax
80106aff:	85 c0                	test   %eax,%eax
80106b01:	74 4d                	je     80106b50 <uartputc+0x5c>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106b03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80106b0a:	eb 10                	jmp    80106b1c <uartputc+0x28>
    microdelay(10);
80106b0c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80106b13:	e8 ed c3 ff ff       	call   80102f05 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106b18:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106b1c:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
80106b20:	7f 16                	jg     80106b38 <uartputc+0x44>
80106b22:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106b29:	e8 7a fe ff ff       	call   801069a8 <inb>
80106b2e:	0f b6 c0             	movzbl %al,%eax
80106b31:	83 e0 20             	and    $0x20,%eax
80106b34:	85 c0                	test   %eax,%eax
80106b36:	74 d4                	je     80106b0c <uartputc+0x18>
    microdelay(10);
  outb(COM1+0, c);
80106b38:	8b 45 08             	mov    0x8(%ebp),%eax
80106b3b:	0f b6 c0             	movzbl %al,%eax
80106b3e:	89 44 24 04          	mov    %eax,0x4(%esp)
80106b42:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106b49:	e8 77 fe ff ff       	call   801069c5 <outb>
80106b4e:	eb 01                	jmp    80106b51 <uartputc+0x5d>
uartputc(int c)
{
  int i;

  if(!uart)
    return;
80106b50:	90                   	nop
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80106b51:	c9                   	leave  
80106b52:	c3                   	ret    

80106b53 <uartgetc>:

static int
uartgetc(void)
{
80106b53:	55                   	push   %ebp
80106b54:	89 e5                	mov    %esp,%ebp
80106b56:	83 ec 04             	sub    $0x4,%esp
  if(!uart)
80106b59:	a1 4c b6 10 80       	mov    0x8010b64c,%eax
80106b5e:	85 c0                	test   %eax,%eax
80106b60:	75 07                	jne    80106b69 <uartgetc+0x16>
    return -1;
80106b62:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b67:	eb 2c                	jmp    80106b95 <uartgetc+0x42>
  if(!(inb(COM1+5) & 0x01))
80106b69:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106b70:	e8 33 fe ff ff       	call   801069a8 <inb>
80106b75:	0f b6 c0             	movzbl %al,%eax
80106b78:	83 e0 01             	and    $0x1,%eax
80106b7b:	85 c0                	test   %eax,%eax
80106b7d:	75 07                	jne    80106b86 <uartgetc+0x33>
    return -1;
80106b7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b84:	eb 0f                	jmp    80106b95 <uartgetc+0x42>
  return inb(COM1+0);
80106b86:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106b8d:	e8 16 fe ff ff       	call   801069a8 <inb>
80106b92:	0f b6 c0             	movzbl %al,%eax
}
80106b95:	c9                   	leave  
80106b96:	c3                   	ret    

80106b97 <uartintr>:

void
uartintr(void)
{
80106b97:	55                   	push   %ebp
80106b98:	89 e5                	mov    %esp,%ebp
80106b9a:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80106b9d:	c7 04 24 53 6b 10 80 	movl   $0x80106b53,(%esp)
80106ba4:	e8 02 9c ff ff       	call   801007ab <consoleintr>
}
80106ba9:	c9                   	leave  
80106baa:	c3                   	ret    
	...

80106bac <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80106bac:	6a 00                	push   $0x0
  pushl $0
80106bae:	6a 00                	push   $0x0
  jmp alltraps
80106bb0:	e9 7b f9 ff ff       	jmp    80106530 <alltraps>

80106bb5 <vector1>:
.globl vector1
vector1:
  pushl $0
80106bb5:	6a 00                	push   $0x0
  pushl $1
80106bb7:	6a 01                	push   $0x1
  jmp alltraps
80106bb9:	e9 72 f9 ff ff       	jmp    80106530 <alltraps>

80106bbe <vector2>:
.globl vector2
vector2:
  pushl $0
80106bbe:	6a 00                	push   $0x0
  pushl $2
80106bc0:	6a 02                	push   $0x2
  jmp alltraps
80106bc2:	e9 69 f9 ff ff       	jmp    80106530 <alltraps>

80106bc7 <vector3>:
.globl vector3
vector3:
  pushl $0
80106bc7:	6a 00                	push   $0x0
  pushl $3
80106bc9:	6a 03                	push   $0x3
  jmp alltraps
80106bcb:	e9 60 f9 ff ff       	jmp    80106530 <alltraps>

80106bd0 <vector4>:
.globl vector4
vector4:
  pushl $0
80106bd0:	6a 00                	push   $0x0
  pushl $4
80106bd2:	6a 04                	push   $0x4
  jmp alltraps
80106bd4:	e9 57 f9 ff ff       	jmp    80106530 <alltraps>

80106bd9 <vector5>:
.globl vector5
vector5:
  pushl $0
80106bd9:	6a 00                	push   $0x0
  pushl $5
80106bdb:	6a 05                	push   $0x5
  jmp alltraps
80106bdd:	e9 4e f9 ff ff       	jmp    80106530 <alltraps>

80106be2 <vector6>:
.globl vector6
vector6:
  pushl $0
80106be2:	6a 00                	push   $0x0
  pushl $6
80106be4:	6a 06                	push   $0x6
  jmp alltraps
80106be6:	e9 45 f9 ff ff       	jmp    80106530 <alltraps>

80106beb <vector7>:
.globl vector7
vector7:
  pushl $0
80106beb:	6a 00                	push   $0x0
  pushl $7
80106bed:	6a 07                	push   $0x7
  jmp alltraps
80106bef:	e9 3c f9 ff ff       	jmp    80106530 <alltraps>

80106bf4 <vector8>:
.globl vector8
vector8:
  pushl $8
80106bf4:	6a 08                	push   $0x8
  jmp alltraps
80106bf6:	e9 35 f9 ff ff       	jmp    80106530 <alltraps>

80106bfb <vector9>:
.globl vector9
vector9:
  pushl $0
80106bfb:	6a 00                	push   $0x0
  pushl $9
80106bfd:	6a 09                	push   $0x9
  jmp alltraps
80106bff:	e9 2c f9 ff ff       	jmp    80106530 <alltraps>

80106c04 <vector10>:
.globl vector10
vector10:
  pushl $10
80106c04:	6a 0a                	push   $0xa
  jmp alltraps
80106c06:	e9 25 f9 ff ff       	jmp    80106530 <alltraps>

80106c0b <vector11>:
.globl vector11
vector11:
  pushl $11
80106c0b:	6a 0b                	push   $0xb
  jmp alltraps
80106c0d:	e9 1e f9 ff ff       	jmp    80106530 <alltraps>

80106c12 <vector12>:
.globl vector12
vector12:
  pushl $12
80106c12:	6a 0c                	push   $0xc
  jmp alltraps
80106c14:	e9 17 f9 ff ff       	jmp    80106530 <alltraps>

80106c19 <vector13>:
.globl vector13
vector13:
  pushl $13
80106c19:	6a 0d                	push   $0xd
  jmp alltraps
80106c1b:	e9 10 f9 ff ff       	jmp    80106530 <alltraps>

80106c20 <vector14>:
.globl vector14
vector14:
  pushl $14
80106c20:	6a 0e                	push   $0xe
  jmp alltraps
80106c22:	e9 09 f9 ff ff       	jmp    80106530 <alltraps>

80106c27 <vector15>:
.globl vector15
vector15:
  pushl $0
80106c27:	6a 00                	push   $0x0
  pushl $15
80106c29:	6a 0f                	push   $0xf
  jmp alltraps
80106c2b:	e9 00 f9 ff ff       	jmp    80106530 <alltraps>

80106c30 <vector16>:
.globl vector16
vector16:
  pushl $0
80106c30:	6a 00                	push   $0x0
  pushl $16
80106c32:	6a 10                	push   $0x10
  jmp alltraps
80106c34:	e9 f7 f8 ff ff       	jmp    80106530 <alltraps>

80106c39 <vector17>:
.globl vector17
vector17:
  pushl $17
80106c39:	6a 11                	push   $0x11
  jmp alltraps
80106c3b:	e9 f0 f8 ff ff       	jmp    80106530 <alltraps>

80106c40 <vector18>:
.globl vector18
vector18:
  pushl $0
80106c40:	6a 00                	push   $0x0
  pushl $18
80106c42:	6a 12                	push   $0x12
  jmp alltraps
80106c44:	e9 e7 f8 ff ff       	jmp    80106530 <alltraps>

80106c49 <vector19>:
.globl vector19
vector19:
  pushl $0
80106c49:	6a 00                	push   $0x0
  pushl $19
80106c4b:	6a 13                	push   $0x13
  jmp alltraps
80106c4d:	e9 de f8 ff ff       	jmp    80106530 <alltraps>

80106c52 <vector20>:
.globl vector20
vector20:
  pushl $0
80106c52:	6a 00                	push   $0x0
  pushl $20
80106c54:	6a 14                	push   $0x14
  jmp alltraps
80106c56:	e9 d5 f8 ff ff       	jmp    80106530 <alltraps>

80106c5b <vector21>:
.globl vector21
vector21:
  pushl $0
80106c5b:	6a 00                	push   $0x0
  pushl $21
80106c5d:	6a 15                	push   $0x15
  jmp alltraps
80106c5f:	e9 cc f8 ff ff       	jmp    80106530 <alltraps>

80106c64 <vector22>:
.globl vector22
vector22:
  pushl $0
80106c64:	6a 00                	push   $0x0
  pushl $22
80106c66:	6a 16                	push   $0x16
  jmp alltraps
80106c68:	e9 c3 f8 ff ff       	jmp    80106530 <alltraps>

80106c6d <vector23>:
.globl vector23
vector23:
  pushl $0
80106c6d:	6a 00                	push   $0x0
  pushl $23
80106c6f:	6a 17                	push   $0x17
  jmp alltraps
80106c71:	e9 ba f8 ff ff       	jmp    80106530 <alltraps>

80106c76 <vector24>:
.globl vector24
vector24:
  pushl $0
80106c76:	6a 00                	push   $0x0
  pushl $24
80106c78:	6a 18                	push   $0x18
  jmp alltraps
80106c7a:	e9 b1 f8 ff ff       	jmp    80106530 <alltraps>

80106c7f <vector25>:
.globl vector25
vector25:
  pushl $0
80106c7f:	6a 00                	push   $0x0
  pushl $25
80106c81:	6a 19                	push   $0x19
  jmp alltraps
80106c83:	e9 a8 f8 ff ff       	jmp    80106530 <alltraps>

80106c88 <vector26>:
.globl vector26
vector26:
  pushl $0
80106c88:	6a 00                	push   $0x0
  pushl $26
80106c8a:	6a 1a                	push   $0x1a
  jmp alltraps
80106c8c:	e9 9f f8 ff ff       	jmp    80106530 <alltraps>

80106c91 <vector27>:
.globl vector27
vector27:
  pushl $0
80106c91:	6a 00                	push   $0x0
  pushl $27
80106c93:	6a 1b                	push   $0x1b
  jmp alltraps
80106c95:	e9 96 f8 ff ff       	jmp    80106530 <alltraps>

80106c9a <vector28>:
.globl vector28
vector28:
  pushl $0
80106c9a:	6a 00                	push   $0x0
  pushl $28
80106c9c:	6a 1c                	push   $0x1c
  jmp alltraps
80106c9e:	e9 8d f8 ff ff       	jmp    80106530 <alltraps>

80106ca3 <vector29>:
.globl vector29
vector29:
  pushl $0
80106ca3:	6a 00                	push   $0x0
  pushl $29
80106ca5:	6a 1d                	push   $0x1d
  jmp alltraps
80106ca7:	e9 84 f8 ff ff       	jmp    80106530 <alltraps>

80106cac <vector30>:
.globl vector30
vector30:
  pushl $0
80106cac:	6a 00                	push   $0x0
  pushl $30
80106cae:	6a 1e                	push   $0x1e
  jmp alltraps
80106cb0:	e9 7b f8 ff ff       	jmp    80106530 <alltraps>

80106cb5 <vector31>:
.globl vector31
vector31:
  pushl $0
80106cb5:	6a 00                	push   $0x0
  pushl $31
80106cb7:	6a 1f                	push   $0x1f
  jmp alltraps
80106cb9:	e9 72 f8 ff ff       	jmp    80106530 <alltraps>

80106cbe <vector32>:
.globl vector32
vector32:
  pushl $0
80106cbe:	6a 00                	push   $0x0
  pushl $32
80106cc0:	6a 20                	push   $0x20
  jmp alltraps
80106cc2:	e9 69 f8 ff ff       	jmp    80106530 <alltraps>

80106cc7 <vector33>:
.globl vector33
vector33:
  pushl $0
80106cc7:	6a 00                	push   $0x0
  pushl $33
80106cc9:	6a 21                	push   $0x21
  jmp alltraps
80106ccb:	e9 60 f8 ff ff       	jmp    80106530 <alltraps>

80106cd0 <vector34>:
.globl vector34
vector34:
  pushl $0
80106cd0:	6a 00                	push   $0x0
  pushl $34
80106cd2:	6a 22                	push   $0x22
  jmp alltraps
80106cd4:	e9 57 f8 ff ff       	jmp    80106530 <alltraps>

80106cd9 <vector35>:
.globl vector35
vector35:
  pushl $0
80106cd9:	6a 00                	push   $0x0
  pushl $35
80106cdb:	6a 23                	push   $0x23
  jmp alltraps
80106cdd:	e9 4e f8 ff ff       	jmp    80106530 <alltraps>

80106ce2 <vector36>:
.globl vector36
vector36:
  pushl $0
80106ce2:	6a 00                	push   $0x0
  pushl $36
80106ce4:	6a 24                	push   $0x24
  jmp alltraps
80106ce6:	e9 45 f8 ff ff       	jmp    80106530 <alltraps>

80106ceb <vector37>:
.globl vector37
vector37:
  pushl $0
80106ceb:	6a 00                	push   $0x0
  pushl $37
80106ced:	6a 25                	push   $0x25
  jmp alltraps
80106cef:	e9 3c f8 ff ff       	jmp    80106530 <alltraps>

80106cf4 <vector38>:
.globl vector38
vector38:
  pushl $0
80106cf4:	6a 00                	push   $0x0
  pushl $38
80106cf6:	6a 26                	push   $0x26
  jmp alltraps
80106cf8:	e9 33 f8 ff ff       	jmp    80106530 <alltraps>

80106cfd <vector39>:
.globl vector39
vector39:
  pushl $0
80106cfd:	6a 00                	push   $0x0
  pushl $39
80106cff:	6a 27                	push   $0x27
  jmp alltraps
80106d01:	e9 2a f8 ff ff       	jmp    80106530 <alltraps>

80106d06 <vector40>:
.globl vector40
vector40:
  pushl $0
80106d06:	6a 00                	push   $0x0
  pushl $40
80106d08:	6a 28                	push   $0x28
  jmp alltraps
80106d0a:	e9 21 f8 ff ff       	jmp    80106530 <alltraps>

80106d0f <vector41>:
.globl vector41
vector41:
  pushl $0
80106d0f:	6a 00                	push   $0x0
  pushl $41
80106d11:	6a 29                	push   $0x29
  jmp alltraps
80106d13:	e9 18 f8 ff ff       	jmp    80106530 <alltraps>

80106d18 <vector42>:
.globl vector42
vector42:
  pushl $0
80106d18:	6a 00                	push   $0x0
  pushl $42
80106d1a:	6a 2a                	push   $0x2a
  jmp alltraps
80106d1c:	e9 0f f8 ff ff       	jmp    80106530 <alltraps>

80106d21 <vector43>:
.globl vector43
vector43:
  pushl $0
80106d21:	6a 00                	push   $0x0
  pushl $43
80106d23:	6a 2b                	push   $0x2b
  jmp alltraps
80106d25:	e9 06 f8 ff ff       	jmp    80106530 <alltraps>

80106d2a <vector44>:
.globl vector44
vector44:
  pushl $0
80106d2a:	6a 00                	push   $0x0
  pushl $44
80106d2c:	6a 2c                	push   $0x2c
  jmp alltraps
80106d2e:	e9 fd f7 ff ff       	jmp    80106530 <alltraps>

80106d33 <vector45>:
.globl vector45
vector45:
  pushl $0
80106d33:	6a 00                	push   $0x0
  pushl $45
80106d35:	6a 2d                	push   $0x2d
  jmp alltraps
80106d37:	e9 f4 f7 ff ff       	jmp    80106530 <alltraps>

80106d3c <vector46>:
.globl vector46
vector46:
  pushl $0
80106d3c:	6a 00                	push   $0x0
  pushl $46
80106d3e:	6a 2e                	push   $0x2e
  jmp alltraps
80106d40:	e9 eb f7 ff ff       	jmp    80106530 <alltraps>

80106d45 <vector47>:
.globl vector47
vector47:
  pushl $0
80106d45:	6a 00                	push   $0x0
  pushl $47
80106d47:	6a 2f                	push   $0x2f
  jmp alltraps
80106d49:	e9 e2 f7 ff ff       	jmp    80106530 <alltraps>

80106d4e <vector48>:
.globl vector48
vector48:
  pushl $0
80106d4e:	6a 00                	push   $0x0
  pushl $48
80106d50:	6a 30                	push   $0x30
  jmp alltraps
80106d52:	e9 d9 f7 ff ff       	jmp    80106530 <alltraps>

80106d57 <vector49>:
.globl vector49
vector49:
  pushl $0
80106d57:	6a 00                	push   $0x0
  pushl $49
80106d59:	6a 31                	push   $0x31
  jmp alltraps
80106d5b:	e9 d0 f7 ff ff       	jmp    80106530 <alltraps>

80106d60 <vector50>:
.globl vector50
vector50:
  pushl $0
80106d60:	6a 00                	push   $0x0
  pushl $50
80106d62:	6a 32                	push   $0x32
  jmp alltraps
80106d64:	e9 c7 f7 ff ff       	jmp    80106530 <alltraps>

80106d69 <vector51>:
.globl vector51
vector51:
  pushl $0
80106d69:	6a 00                	push   $0x0
  pushl $51
80106d6b:	6a 33                	push   $0x33
  jmp alltraps
80106d6d:	e9 be f7 ff ff       	jmp    80106530 <alltraps>

80106d72 <vector52>:
.globl vector52
vector52:
  pushl $0
80106d72:	6a 00                	push   $0x0
  pushl $52
80106d74:	6a 34                	push   $0x34
  jmp alltraps
80106d76:	e9 b5 f7 ff ff       	jmp    80106530 <alltraps>

80106d7b <vector53>:
.globl vector53
vector53:
  pushl $0
80106d7b:	6a 00                	push   $0x0
  pushl $53
80106d7d:	6a 35                	push   $0x35
  jmp alltraps
80106d7f:	e9 ac f7 ff ff       	jmp    80106530 <alltraps>

80106d84 <vector54>:
.globl vector54
vector54:
  pushl $0
80106d84:	6a 00                	push   $0x0
  pushl $54
80106d86:	6a 36                	push   $0x36
  jmp alltraps
80106d88:	e9 a3 f7 ff ff       	jmp    80106530 <alltraps>

80106d8d <vector55>:
.globl vector55
vector55:
  pushl $0
80106d8d:	6a 00                	push   $0x0
  pushl $55
80106d8f:	6a 37                	push   $0x37
  jmp alltraps
80106d91:	e9 9a f7 ff ff       	jmp    80106530 <alltraps>

80106d96 <vector56>:
.globl vector56
vector56:
  pushl $0
80106d96:	6a 00                	push   $0x0
  pushl $56
80106d98:	6a 38                	push   $0x38
  jmp alltraps
80106d9a:	e9 91 f7 ff ff       	jmp    80106530 <alltraps>

80106d9f <vector57>:
.globl vector57
vector57:
  pushl $0
80106d9f:	6a 00                	push   $0x0
  pushl $57
80106da1:	6a 39                	push   $0x39
  jmp alltraps
80106da3:	e9 88 f7 ff ff       	jmp    80106530 <alltraps>

80106da8 <vector58>:
.globl vector58
vector58:
  pushl $0
80106da8:	6a 00                	push   $0x0
  pushl $58
80106daa:	6a 3a                	push   $0x3a
  jmp alltraps
80106dac:	e9 7f f7 ff ff       	jmp    80106530 <alltraps>

80106db1 <vector59>:
.globl vector59
vector59:
  pushl $0
80106db1:	6a 00                	push   $0x0
  pushl $59
80106db3:	6a 3b                	push   $0x3b
  jmp alltraps
80106db5:	e9 76 f7 ff ff       	jmp    80106530 <alltraps>

80106dba <vector60>:
.globl vector60
vector60:
  pushl $0
80106dba:	6a 00                	push   $0x0
  pushl $60
80106dbc:	6a 3c                	push   $0x3c
  jmp alltraps
80106dbe:	e9 6d f7 ff ff       	jmp    80106530 <alltraps>

80106dc3 <vector61>:
.globl vector61
vector61:
  pushl $0
80106dc3:	6a 00                	push   $0x0
  pushl $61
80106dc5:	6a 3d                	push   $0x3d
  jmp alltraps
80106dc7:	e9 64 f7 ff ff       	jmp    80106530 <alltraps>

80106dcc <vector62>:
.globl vector62
vector62:
  pushl $0
80106dcc:	6a 00                	push   $0x0
  pushl $62
80106dce:	6a 3e                	push   $0x3e
  jmp alltraps
80106dd0:	e9 5b f7 ff ff       	jmp    80106530 <alltraps>

80106dd5 <vector63>:
.globl vector63
vector63:
  pushl $0
80106dd5:	6a 00                	push   $0x0
  pushl $63
80106dd7:	6a 3f                	push   $0x3f
  jmp alltraps
80106dd9:	e9 52 f7 ff ff       	jmp    80106530 <alltraps>

80106dde <vector64>:
.globl vector64
vector64:
  pushl $0
80106dde:	6a 00                	push   $0x0
  pushl $64
80106de0:	6a 40                	push   $0x40
  jmp alltraps
80106de2:	e9 49 f7 ff ff       	jmp    80106530 <alltraps>

80106de7 <vector65>:
.globl vector65
vector65:
  pushl $0
80106de7:	6a 00                	push   $0x0
  pushl $65
80106de9:	6a 41                	push   $0x41
  jmp alltraps
80106deb:	e9 40 f7 ff ff       	jmp    80106530 <alltraps>

80106df0 <vector66>:
.globl vector66
vector66:
  pushl $0
80106df0:	6a 00                	push   $0x0
  pushl $66
80106df2:	6a 42                	push   $0x42
  jmp alltraps
80106df4:	e9 37 f7 ff ff       	jmp    80106530 <alltraps>

80106df9 <vector67>:
.globl vector67
vector67:
  pushl $0
80106df9:	6a 00                	push   $0x0
  pushl $67
80106dfb:	6a 43                	push   $0x43
  jmp alltraps
80106dfd:	e9 2e f7 ff ff       	jmp    80106530 <alltraps>

80106e02 <vector68>:
.globl vector68
vector68:
  pushl $0
80106e02:	6a 00                	push   $0x0
  pushl $68
80106e04:	6a 44                	push   $0x44
  jmp alltraps
80106e06:	e9 25 f7 ff ff       	jmp    80106530 <alltraps>

80106e0b <vector69>:
.globl vector69
vector69:
  pushl $0
80106e0b:	6a 00                	push   $0x0
  pushl $69
80106e0d:	6a 45                	push   $0x45
  jmp alltraps
80106e0f:	e9 1c f7 ff ff       	jmp    80106530 <alltraps>

80106e14 <vector70>:
.globl vector70
vector70:
  pushl $0
80106e14:	6a 00                	push   $0x0
  pushl $70
80106e16:	6a 46                	push   $0x46
  jmp alltraps
80106e18:	e9 13 f7 ff ff       	jmp    80106530 <alltraps>

80106e1d <vector71>:
.globl vector71
vector71:
  pushl $0
80106e1d:	6a 00                	push   $0x0
  pushl $71
80106e1f:	6a 47                	push   $0x47
  jmp alltraps
80106e21:	e9 0a f7 ff ff       	jmp    80106530 <alltraps>

80106e26 <vector72>:
.globl vector72
vector72:
  pushl $0
80106e26:	6a 00                	push   $0x0
  pushl $72
80106e28:	6a 48                	push   $0x48
  jmp alltraps
80106e2a:	e9 01 f7 ff ff       	jmp    80106530 <alltraps>

80106e2f <vector73>:
.globl vector73
vector73:
  pushl $0
80106e2f:	6a 00                	push   $0x0
  pushl $73
80106e31:	6a 49                	push   $0x49
  jmp alltraps
80106e33:	e9 f8 f6 ff ff       	jmp    80106530 <alltraps>

80106e38 <vector74>:
.globl vector74
vector74:
  pushl $0
80106e38:	6a 00                	push   $0x0
  pushl $74
80106e3a:	6a 4a                	push   $0x4a
  jmp alltraps
80106e3c:	e9 ef f6 ff ff       	jmp    80106530 <alltraps>

80106e41 <vector75>:
.globl vector75
vector75:
  pushl $0
80106e41:	6a 00                	push   $0x0
  pushl $75
80106e43:	6a 4b                	push   $0x4b
  jmp alltraps
80106e45:	e9 e6 f6 ff ff       	jmp    80106530 <alltraps>

80106e4a <vector76>:
.globl vector76
vector76:
  pushl $0
80106e4a:	6a 00                	push   $0x0
  pushl $76
80106e4c:	6a 4c                	push   $0x4c
  jmp alltraps
80106e4e:	e9 dd f6 ff ff       	jmp    80106530 <alltraps>

80106e53 <vector77>:
.globl vector77
vector77:
  pushl $0
80106e53:	6a 00                	push   $0x0
  pushl $77
80106e55:	6a 4d                	push   $0x4d
  jmp alltraps
80106e57:	e9 d4 f6 ff ff       	jmp    80106530 <alltraps>

80106e5c <vector78>:
.globl vector78
vector78:
  pushl $0
80106e5c:	6a 00                	push   $0x0
  pushl $78
80106e5e:	6a 4e                	push   $0x4e
  jmp alltraps
80106e60:	e9 cb f6 ff ff       	jmp    80106530 <alltraps>

80106e65 <vector79>:
.globl vector79
vector79:
  pushl $0
80106e65:	6a 00                	push   $0x0
  pushl $79
80106e67:	6a 4f                	push   $0x4f
  jmp alltraps
80106e69:	e9 c2 f6 ff ff       	jmp    80106530 <alltraps>

80106e6e <vector80>:
.globl vector80
vector80:
  pushl $0
80106e6e:	6a 00                	push   $0x0
  pushl $80
80106e70:	6a 50                	push   $0x50
  jmp alltraps
80106e72:	e9 b9 f6 ff ff       	jmp    80106530 <alltraps>

80106e77 <vector81>:
.globl vector81
vector81:
  pushl $0
80106e77:	6a 00                	push   $0x0
  pushl $81
80106e79:	6a 51                	push   $0x51
  jmp alltraps
80106e7b:	e9 b0 f6 ff ff       	jmp    80106530 <alltraps>

80106e80 <vector82>:
.globl vector82
vector82:
  pushl $0
80106e80:	6a 00                	push   $0x0
  pushl $82
80106e82:	6a 52                	push   $0x52
  jmp alltraps
80106e84:	e9 a7 f6 ff ff       	jmp    80106530 <alltraps>

80106e89 <vector83>:
.globl vector83
vector83:
  pushl $0
80106e89:	6a 00                	push   $0x0
  pushl $83
80106e8b:	6a 53                	push   $0x53
  jmp alltraps
80106e8d:	e9 9e f6 ff ff       	jmp    80106530 <alltraps>

80106e92 <vector84>:
.globl vector84
vector84:
  pushl $0
80106e92:	6a 00                	push   $0x0
  pushl $84
80106e94:	6a 54                	push   $0x54
  jmp alltraps
80106e96:	e9 95 f6 ff ff       	jmp    80106530 <alltraps>

80106e9b <vector85>:
.globl vector85
vector85:
  pushl $0
80106e9b:	6a 00                	push   $0x0
  pushl $85
80106e9d:	6a 55                	push   $0x55
  jmp alltraps
80106e9f:	e9 8c f6 ff ff       	jmp    80106530 <alltraps>

80106ea4 <vector86>:
.globl vector86
vector86:
  pushl $0
80106ea4:	6a 00                	push   $0x0
  pushl $86
80106ea6:	6a 56                	push   $0x56
  jmp alltraps
80106ea8:	e9 83 f6 ff ff       	jmp    80106530 <alltraps>

80106ead <vector87>:
.globl vector87
vector87:
  pushl $0
80106ead:	6a 00                	push   $0x0
  pushl $87
80106eaf:	6a 57                	push   $0x57
  jmp alltraps
80106eb1:	e9 7a f6 ff ff       	jmp    80106530 <alltraps>

80106eb6 <vector88>:
.globl vector88
vector88:
  pushl $0
80106eb6:	6a 00                	push   $0x0
  pushl $88
80106eb8:	6a 58                	push   $0x58
  jmp alltraps
80106eba:	e9 71 f6 ff ff       	jmp    80106530 <alltraps>

80106ebf <vector89>:
.globl vector89
vector89:
  pushl $0
80106ebf:	6a 00                	push   $0x0
  pushl $89
80106ec1:	6a 59                	push   $0x59
  jmp alltraps
80106ec3:	e9 68 f6 ff ff       	jmp    80106530 <alltraps>

80106ec8 <vector90>:
.globl vector90
vector90:
  pushl $0
80106ec8:	6a 00                	push   $0x0
  pushl $90
80106eca:	6a 5a                	push   $0x5a
  jmp alltraps
80106ecc:	e9 5f f6 ff ff       	jmp    80106530 <alltraps>

80106ed1 <vector91>:
.globl vector91
vector91:
  pushl $0
80106ed1:	6a 00                	push   $0x0
  pushl $91
80106ed3:	6a 5b                	push   $0x5b
  jmp alltraps
80106ed5:	e9 56 f6 ff ff       	jmp    80106530 <alltraps>

80106eda <vector92>:
.globl vector92
vector92:
  pushl $0
80106eda:	6a 00                	push   $0x0
  pushl $92
80106edc:	6a 5c                	push   $0x5c
  jmp alltraps
80106ede:	e9 4d f6 ff ff       	jmp    80106530 <alltraps>

80106ee3 <vector93>:
.globl vector93
vector93:
  pushl $0
80106ee3:	6a 00                	push   $0x0
  pushl $93
80106ee5:	6a 5d                	push   $0x5d
  jmp alltraps
80106ee7:	e9 44 f6 ff ff       	jmp    80106530 <alltraps>

80106eec <vector94>:
.globl vector94
vector94:
  pushl $0
80106eec:	6a 00                	push   $0x0
  pushl $94
80106eee:	6a 5e                	push   $0x5e
  jmp alltraps
80106ef0:	e9 3b f6 ff ff       	jmp    80106530 <alltraps>

80106ef5 <vector95>:
.globl vector95
vector95:
  pushl $0
80106ef5:	6a 00                	push   $0x0
  pushl $95
80106ef7:	6a 5f                	push   $0x5f
  jmp alltraps
80106ef9:	e9 32 f6 ff ff       	jmp    80106530 <alltraps>

80106efe <vector96>:
.globl vector96
vector96:
  pushl $0
80106efe:	6a 00                	push   $0x0
  pushl $96
80106f00:	6a 60                	push   $0x60
  jmp alltraps
80106f02:	e9 29 f6 ff ff       	jmp    80106530 <alltraps>

80106f07 <vector97>:
.globl vector97
vector97:
  pushl $0
80106f07:	6a 00                	push   $0x0
  pushl $97
80106f09:	6a 61                	push   $0x61
  jmp alltraps
80106f0b:	e9 20 f6 ff ff       	jmp    80106530 <alltraps>

80106f10 <vector98>:
.globl vector98
vector98:
  pushl $0
80106f10:	6a 00                	push   $0x0
  pushl $98
80106f12:	6a 62                	push   $0x62
  jmp alltraps
80106f14:	e9 17 f6 ff ff       	jmp    80106530 <alltraps>

80106f19 <vector99>:
.globl vector99
vector99:
  pushl $0
80106f19:	6a 00                	push   $0x0
  pushl $99
80106f1b:	6a 63                	push   $0x63
  jmp alltraps
80106f1d:	e9 0e f6 ff ff       	jmp    80106530 <alltraps>

80106f22 <vector100>:
.globl vector100
vector100:
  pushl $0
80106f22:	6a 00                	push   $0x0
  pushl $100
80106f24:	6a 64                	push   $0x64
  jmp alltraps
80106f26:	e9 05 f6 ff ff       	jmp    80106530 <alltraps>

80106f2b <vector101>:
.globl vector101
vector101:
  pushl $0
80106f2b:	6a 00                	push   $0x0
  pushl $101
80106f2d:	6a 65                	push   $0x65
  jmp alltraps
80106f2f:	e9 fc f5 ff ff       	jmp    80106530 <alltraps>

80106f34 <vector102>:
.globl vector102
vector102:
  pushl $0
80106f34:	6a 00                	push   $0x0
  pushl $102
80106f36:	6a 66                	push   $0x66
  jmp alltraps
80106f38:	e9 f3 f5 ff ff       	jmp    80106530 <alltraps>

80106f3d <vector103>:
.globl vector103
vector103:
  pushl $0
80106f3d:	6a 00                	push   $0x0
  pushl $103
80106f3f:	6a 67                	push   $0x67
  jmp alltraps
80106f41:	e9 ea f5 ff ff       	jmp    80106530 <alltraps>

80106f46 <vector104>:
.globl vector104
vector104:
  pushl $0
80106f46:	6a 00                	push   $0x0
  pushl $104
80106f48:	6a 68                	push   $0x68
  jmp alltraps
80106f4a:	e9 e1 f5 ff ff       	jmp    80106530 <alltraps>

80106f4f <vector105>:
.globl vector105
vector105:
  pushl $0
80106f4f:	6a 00                	push   $0x0
  pushl $105
80106f51:	6a 69                	push   $0x69
  jmp alltraps
80106f53:	e9 d8 f5 ff ff       	jmp    80106530 <alltraps>

80106f58 <vector106>:
.globl vector106
vector106:
  pushl $0
80106f58:	6a 00                	push   $0x0
  pushl $106
80106f5a:	6a 6a                	push   $0x6a
  jmp alltraps
80106f5c:	e9 cf f5 ff ff       	jmp    80106530 <alltraps>

80106f61 <vector107>:
.globl vector107
vector107:
  pushl $0
80106f61:	6a 00                	push   $0x0
  pushl $107
80106f63:	6a 6b                	push   $0x6b
  jmp alltraps
80106f65:	e9 c6 f5 ff ff       	jmp    80106530 <alltraps>

80106f6a <vector108>:
.globl vector108
vector108:
  pushl $0
80106f6a:	6a 00                	push   $0x0
  pushl $108
80106f6c:	6a 6c                	push   $0x6c
  jmp alltraps
80106f6e:	e9 bd f5 ff ff       	jmp    80106530 <alltraps>

80106f73 <vector109>:
.globl vector109
vector109:
  pushl $0
80106f73:	6a 00                	push   $0x0
  pushl $109
80106f75:	6a 6d                	push   $0x6d
  jmp alltraps
80106f77:	e9 b4 f5 ff ff       	jmp    80106530 <alltraps>

80106f7c <vector110>:
.globl vector110
vector110:
  pushl $0
80106f7c:	6a 00                	push   $0x0
  pushl $110
80106f7e:	6a 6e                	push   $0x6e
  jmp alltraps
80106f80:	e9 ab f5 ff ff       	jmp    80106530 <alltraps>

80106f85 <vector111>:
.globl vector111
vector111:
  pushl $0
80106f85:	6a 00                	push   $0x0
  pushl $111
80106f87:	6a 6f                	push   $0x6f
  jmp alltraps
80106f89:	e9 a2 f5 ff ff       	jmp    80106530 <alltraps>

80106f8e <vector112>:
.globl vector112
vector112:
  pushl $0
80106f8e:	6a 00                	push   $0x0
  pushl $112
80106f90:	6a 70                	push   $0x70
  jmp alltraps
80106f92:	e9 99 f5 ff ff       	jmp    80106530 <alltraps>

80106f97 <vector113>:
.globl vector113
vector113:
  pushl $0
80106f97:	6a 00                	push   $0x0
  pushl $113
80106f99:	6a 71                	push   $0x71
  jmp alltraps
80106f9b:	e9 90 f5 ff ff       	jmp    80106530 <alltraps>

80106fa0 <vector114>:
.globl vector114
vector114:
  pushl $0
80106fa0:	6a 00                	push   $0x0
  pushl $114
80106fa2:	6a 72                	push   $0x72
  jmp alltraps
80106fa4:	e9 87 f5 ff ff       	jmp    80106530 <alltraps>

80106fa9 <vector115>:
.globl vector115
vector115:
  pushl $0
80106fa9:	6a 00                	push   $0x0
  pushl $115
80106fab:	6a 73                	push   $0x73
  jmp alltraps
80106fad:	e9 7e f5 ff ff       	jmp    80106530 <alltraps>

80106fb2 <vector116>:
.globl vector116
vector116:
  pushl $0
80106fb2:	6a 00                	push   $0x0
  pushl $116
80106fb4:	6a 74                	push   $0x74
  jmp alltraps
80106fb6:	e9 75 f5 ff ff       	jmp    80106530 <alltraps>

80106fbb <vector117>:
.globl vector117
vector117:
  pushl $0
80106fbb:	6a 00                	push   $0x0
  pushl $117
80106fbd:	6a 75                	push   $0x75
  jmp alltraps
80106fbf:	e9 6c f5 ff ff       	jmp    80106530 <alltraps>

80106fc4 <vector118>:
.globl vector118
vector118:
  pushl $0
80106fc4:	6a 00                	push   $0x0
  pushl $118
80106fc6:	6a 76                	push   $0x76
  jmp alltraps
80106fc8:	e9 63 f5 ff ff       	jmp    80106530 <alltraps>

80106fcd <vector119>:
.globl vector119
vector119:
  pushl $0
80106fcd:	6a 00                	push   $0x0
  pushl $119
80106fcf:	6a 77                	push   $0x77
  jmp alltraps
80106fd1:	e9 5a f5 ff ff       	jmp    80106530 <alltraps>

80106fd6 <vector120>:
.globl vector120
vector120:
  pushl $0
80106fd6:	6a 00                	push   $0x0
  pushl $120
80106fd8:	6a 78                	push   $0x78
  jmp alltraps
80106fda:	e9 51 f5 ff ff       	jmp    80106530 <alltraps>

80106fdf <vector121>:
.globl vector121
vector121:
  pushl $0
80106fdf:	6a 00                	push   $0x0
  pushl $121
80106fe1:	6a 79                	push   $0x79
  jmp alltraps
80106fe3:	e9 48 f5 ff ff       	jmp    80106530 <alltraps>

80106fe8 <vector122>:
.globl vector122
vector122:
  pushl $0
80106fe8:	6a 00                	push   $0x0
  pushl $122
80106fea:	6a 7a                	push   $0x7a
  jmp alltraps
80106fec:	e9 3f f5 ff ff       	jmp    80106530 <alltraps>

80106ff1 <vector123>:
.globl vector123
vector123:
  pushl $0
80106ff1:	6a 00                	push   $0x0
  pushl $123
80106ff3:	6a 7b                	push   $0x7b
  jmp alltraps
80106ff5:	e9 36 f5 ff ff       	jmp    80106530 <alltraps>

80106ffa <vector124>:
.globl vector124
vector124:
  pushl $0
80106ffa:	6a 00                	push   $0x0
  pushl $124
80106ffc:	6a 7c                	push   $0x7c
  jmp alltraps
80106ffe:	e9 2d f5 ff ff       	jmp    80106530 <alltraps>

80107003 <vector125>:
.globl vector125
vector125:
  pushl $0
80107003:	6a 00                	push   $0x0
  pushl $125
80107005:	6a 7d                	push   $0x7d
  jmp alltraps
80107007:	e9 24 f5 ff ff       	jmp    80106530 <alltraps>

8010700c <vector126>:
.globl vector126
vector126:
  pushl $0
8010700c:	6a 00                	push   $0x0
  pushl $126
8010700e:	6a 7e                	push   $0x7e
  jmp alltraps
80107010:	e9 1b f5 ff ff       	jmp    80106530 <alltraps>

80107015 <vector127>:
.globl vector127
vector127:
  pushl $0
80107015:	6a 00                	push   $0x0
  pushl $127
80107017:	6a 7f                	push   $0x7f
  jmp alltraps
80107019:	e9 12 f5 ff ff       	jmp    80106530 <alltraps>

8010701e <vector128>:
.globl vector128
vector128:
  pushl $0
8010701e:	6a 00                	push   $0x0
  pushl $128
80107020:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80107025:	e9 06 f5 ff ff       	jmp    80106530 <alltraps>

8010702a <vector129>:
.globl vector129
vector129:
  pushl $0
8010702a:	6a 00                	push   $0x0
  pushl $129
8010702c:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80107031:	e9 fa f4 ff ff       	jmp    80106530 <alltraps>

80107036 <vector130>:
.globl vector130
vector130:
  pushl $0
80107036:	6a 00                	push   $0x0
  pushl $130
80107038:	68 82 00 00 00       	push   $0x82
  jmp alltraps
8010703d:	e9 ee f4 ff ff       	jmp    80106530 <alltraps>

80107042 <vector131>:
.globl vector131
vector131:
  pushl $0
80107042:	6a 00                	push   $0x0
  pushl $131
80107044:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80107049:	e9 e2 f4 ff ff       	jmp    80106530 <alltraps>

8010704e <vector132>:
.globl vector132
vector132:
  pushl $0
8010704e:	6a 00                	push   $0x0
  pushl $132
80107050:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80107055:	e9 d6 f4 ff ff       	jmp    80106530 <alltraps>

8010705a <vector133>:
.globl vector133
vector133:
  pushl $0
8010705a:	6a 00                	push   $0x0
  pushl $133
8010705c:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80107061:	e9 ca f4 ff ff       	jmp    80106530 <alltraps>

80107066 <vector134>:
.globl vector134
vector134:
  pushl $0
80107066:	6a 00                	push   $0x0
  pushl $134
80107068:	68 86 00 00 00       	push   $0x86
  jmp alltraps
8010706d:	e9 be f4 ff ff       	jmp    80106530 <alltraps>

80107072 <vector135>:
.globl vector135
vector135:
  pushl $0
80107072:	6a 00                	push   $0x0
  pushl $135
80107074:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80107079:	e9 b2 f4 ff ff       	jmp    80106530 <alltraps>

8010707e <vector136>:
.globl vector136
vector136:
  pushl $0
8010707e:	6a 00                	push   $0x0
  pushl $136
80107080:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80107085:	e9 a6 f4 ff ff       	jmp    80106530 <alltraps>

8010708a <vector137>:
.globl vector137
vector137:
  pushl $0
8010708a:	6a 00                	push   $0x0
  pushl $137
8010708c:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80107091:	e9 9a f4 ff ff       	jmp    80106530 <alltraps>

80107096 <vector138>:
.globl vector138
vector138:
  pushl $0
80107096:	6a 00                	push   $0x0
  pushl $138
80107098:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
8010709d:	e9 8e f4 ff ff       	jmp    80106530 <alltraps>

801070a2 <vector139>:
.globl vector139
vector139:
  pushl $0
801070a2:	6a 00                	push   $0x0
  pushl $139
801070a4:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
801070a9:	e9 82 f4 ff ff       	jmp    80106530 <alltraps>

801070ae <vector140>:
.globl vector140
vector140:
  pushl $0
801070ae:	6a 00                	push   $0x0
  pushl $140
801070b0:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
801070b5:	e9 76 f4 ff ff       	jmp    80106530 <alltraps>

801070ba <vector141>:
.globl vector141
vector141:
  pushl $0
801070ba:	6a 00                	push   $0x0
  pushl $141
801070bc:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
801070c1:	e9 6a f4 ff ff       	jmp    80106530 <alltraps>

801070c6 <vector142>:
.globl vector142
vector142:
  pushl $0
801070c6:	6a 00                	push   $0x0
  pushl $142
801070c8:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801070cd:	e9 5e f4 ff ff       	jmp    80106530 <alltraps>

801070d2 <vector143>:
.globl vector143
vector143:
  pushl $0
801070d2:	6a 00                	push   $0x0
  pushl $143
801070d4:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
801070d9:	e9 52 f4 ff ff       	jmp    80106530 <alltraps>

801070de <vector144>:
.globl vector144
vector144:
  pushl $0
801070de:	6a 00                	push   $0x0
  pushl $144
801070e0:	68 90 00 00 00       	push   $0x90
  jmp alltraps
801070e5:	e9 46 f4 ff ff       	jmp    80106530 <alltraps>

801070ea <vector145>:
.globl vector145
vector145:
  pushl $0
801070ea:	6a 00                	push   $0x0
  pushl $145
801070ec:	68 91 00 00 00       	push   $0x91
  jmp alltraps
801070f1:	e9 3a f4 ff ff       	jmp    80106530 <alltraps>

801070f6 <vector146>:
.globl vector146
vector146:
  pushl $0
801070f6:	6a 00                	push   $0x0
  pushl $146
801070f8:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801070fd:	e9 2e f4 ff ff       	jmp    80106530 <alltraps>

80107102 <vector147>:
.globl vector147
vector147:
  pushl $0
80107102:	6a 00                	push   $0x0
  pushl $147
80107104:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80107109:	e9 22 f4 ff ff       	jmp    80106530 <alltraps>

8010710e <vector148>:
.globl vector148
vector148:
  pushl $0
8010710e:	6a 00                	push   $0x0
  pushl $148
80107110:	68 94 00 00 00       	push   $0x94
  jmp alltraps
80107115:	e9 16 f4 ff ff       	jmp    80106530 <alltraps>

8010711a <vector149>:
.globl vector149
vector149:
  pushl $0
8010711a:	6a 00                	push   $0x0
  pushl $149
8010711c:	68 95 00 00 00       	push   $0x95
  jmp alltraps
80107121:	e9 0a f4 ff ff       	jmp    80106530 <alltraps>

80107126 <vector150>:
.globl vector150
vector150:
  pushl $0
80107126:	6a 00                	push   $0x0
  pushl $150
80107128:	68 96 00 00 00       	push   $0x96
  jmp alltraps
8010712d:	e9 fe f3 ff ff       	jmp    80106530 <alltraps>

80107132 <vector151>:
.globl vector151
vector151:
  pushl $0
80107132:	6a 00                	push   $0x0
  pushl $151
80107134:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80107139:	e9 f2 f3 ff ff       	jmp    80106530 <alltraps>

8010713e <vector152>:
.globl vector152
vector152:
  pushl $0
8010713e:	6a 00                	push   $0x0
  pushl $152
80107140:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80107145:	e9 e6 f3 ff ff       	jmp    80106530 <alltraps>

8010714a <vector153>:
.globl vector153
vector153:
  pushl $0
8010714a:	6a 00                	push   $0x0
  pushl $153
8010714c:	68 99 00 00 00       	push   $0x99
  jmp alltraps
80107151:	e9 da f3 ff ff       	jmp    80106530 <alltraps>

80107156 <vector154>:
.globl vector154
vector154:
  pushl $0
80107156:	6a 00                	push   $0x0
  pushl $154
80107158:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
8010715d:	e9 ce f3 ff ff       	jmp    80106530 <alltraps>

80107162 <vector155>:
.globl vector155
vector155:
  pushl $0
80107162:	6a 00                	push   $0x0
  pushl $155
80107164:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80107169:	e9 c2 f3 ff ff       	jmp    80106530 <alltraps>

8010716e <vector156>:
.globl vector156
vector156:
  pushl $0
8010716e:	6a 00                	push   $0x0
  pushl $156
80107170:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80107175:	e9 b6 f3 ff ff       	jmp    80106530 <alltraps>

8010717a <vector157>:
.globl vector157
vector157:
  pushl $0
8010717a:	6a 00                	push   $0x0
  pushl $157
8010717c:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80107181:	e9 aa f3 ff ff       	jmp    80106530 <alltraps>

80107186 <vector158>:
.globl vector158
vector158:
  pushl $0
80107186:	6a 00                	push   $0x0
  pushl $158
80107188:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
8010718d:	e9 9e f3 ff ff       	jmp    80106530 <alltraps>

80107192 <vector159>:
.globl vector159
vector159:
  pushl $0
80107192:	6a 00                	push   $0x0
  pushl $159
80107194:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80107199:	e9 92 f3 ff ff       	jmp    80106530 <alltraps>

8010719e <vector160>:
.globl vector160
vector160:
  pushl $0
8010719e:	6a 00                	push   $0x0
  pushl $160
801071a0:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801071a5:	e9 86 f3 ff ff       	jmp    80106530 <alltraps>

801071aa <vector161>:
.globl vector161
vector161:
  pushl $0
801071aa:	6a 00                	push   $0x0
  pushl $161
801071ac:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
801071b1:	e9 7a f3 ff ff       	jmp    80106530 <alltraps>

801071b6 <vector162>:
.globl vector162
vector162:
  pushl $0
801071b6:	6a 00                	push   $0x0
  pushl $162
801071b8:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
801071bd:	e9 6e f3 ff ff       	jmp    80106530 <alltraps>

801071c2 <vector163>:
.globl vector163
vector163:
  pushl $0
801071c2:	6a 00                	push   $0x0
  pushl $163
801071c4:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801071c9:	e9 62 f3 ff ff       	jmp    80106530 <alltraps>

801071ce <vector164>:
.globl vector164
vector164:
  pushl $0
801071ce:	6a 00                	push   $0x0
  pushl $164
801071d0:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801071d5:	e9 56 f3 ff ff       	jmp    80106530 <alltraps>

801071da <vector165>:
.globl vector165
vector165:
  pushl $0
801071da:	6a 00                	push   $0x0
  pushl $165
801071dc:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
801071e1:	e9 4a f3 ff ff       	jmp    80106530 <alltraps>

801071e6 <vector166>:
.globl vector166
vector166:
  pushl $0
801071e6:	6a 00                	push   $0x0
  pushl $166
801071e8:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
801071ed:	e9 3e f3 ff ff       	jmp    80106530 <alltraps>

801071f2 <vector167>:
.globl vector167
vector167:
  pushl $0
801071f2:	6a 00                	push   $0x0
  pushl $167
801071f4:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801071f9:	e9 32 f3 ff ff       	jmp    80106530 <alltraps>

801071fe <vector168>:
.globl vector168
vector168:
  pushl $0
801071fe:	6a 00                	push   $0x0
  pushl $168
80107200:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
80107205:	e9 26 f3 ff ff       	jmp    80106530 <alltraps>

8010720a <vector169>:
.globl vector169
vector169:
  pushl $0
8010720a:	6a 00                	push   $0x0
  pushl $169
8010720c:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
80107211:	e9 1a f3 ff ff       	jmp    80106530 <alltraps>

80107216 <vector170>:
.globl vector170
vector170:
  pushl $0
80107216:	6a 00                	push   $0x0
  pushl $170
80107218:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
8010721d:	e9 0e f3 ff ff       	jmp    80106530 <alltraps>

80107222 <vector171>:
.globl vector171
vector171:
  pushl $0
80107222:	6a 00                	push   $0x0
  pushl $171
80107224:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80107229:	e9 02 f3 ff ff       	jmp    80106530 <alltraps>

8010722e <vector172>:
.globl vector172
vector172:
  pushl $0
8010722e:	6a 00                	push   $0x0
  pushl $172
80107230:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
80107235:	e9 f6 f2 ff ff       	jmp    80106530 <alltraps>

8010723a <vector173>:
.globl vector173
vector173:
  pushl $0
8010723a:	6a 00                	push   $0x0
  pushl $173
8010723c:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
80107241:	e9 ea f2 ff ff       	jmp    80106530 <alltraps>

80107246 <vector174>:
.globl vector174
vector174:
  pushl $0
80107246:	6a 00                	push   $0x0
  pushl $174
80107248:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
8010724d:	e9 de f2 ff ff       	jmp    80106530 <alltraps>

80107252 <vector175>:
.globl vector175
vector175:
  pushl $0
80107252:	6a 00                	push   $0x0
  pushl $175
80107254:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80107259:	e9 d2 f2 ff ff       	jmp    80106530 <alltraps>

8010725e <vector176>:
.globl vector176
vector176:
  pushl $0
8010725e:	6a 00                	push   $0x0
  pushl $176
80107260:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80107265:	e9 c6 f2 ff ff       	jmp    80106530 <alltraps>

8010726a <vector177>:
.globl vector177
vector177:
  pushl $0
8010726a:	6a 00                	push   $0x0
  pushl $177
8010726c:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80107271:	e9 ba f2 ff ff       	jmp    80106530 <alltraps>

80107276 <vector178>:
.globl vector178
vector178:
  pushl $0
80107276:	6a 00                	push   $0x0
  pushl $178
80107278:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
8010727d:	e9 ae f2 ff ff       	jmp    80106530 <alltraps>

80107282 <vector179>:
.globl vector179
vector179:
  pushl $0
80107282:	6a 00                	push   $0x0
  pushl $179
80107284:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80107289:	e9 a2 f2 ff ff       	jmp    80106530 <alltraps>

8010728e <vector180>:
.globl vector180
vector180:
  pushl $0
8010728e:	6a 00                	push   $0x0
  pushl $180
80107290:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80107295:	e9 96 f2 ff ff       	jmp    80106530 <alltraps>

8010729a <vector181>:
.globl vector181
vector181:
  pushl $0
8010729a:	6a 00                	push   $0x0
  pushl $181
8010729c:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801072a1:	e9 8a f2 ff ff       	jmp    80106530 <alltraps>

801072a6 <vector182>:
.globl vector182
vector182:
  pushl $0
801072a6:	6a 00                	push   $0x0
  pushl $182
801072a8:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
801072ad:	e9 7e f2 ff ff       	jmp    80106530 <alltraps>

801072b2 <vector183>:
.globl vector183
vector183:
  pushl $0
801072b2:	6a 00                	push   $0x0
  pushl $183
801072b4:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801072b9:	e9 72 f2 ff ff       	jmp    80106530 <alltraps>

801072be <vector184>:
.globl vector184
vector184:
  pushl $0
801072be:	6a 00                	push   $0x0
  pushl $184
801072c0:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801072c5:	e9 66 f2 ff ff       	jmp    80106530 <alltraps>

801072ca <vector185>:
.globl vector185
vector185:
  pushl $0
801072ca:	6a 00                	push   $0x0
  pushl $185
801072cc:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801072d1:	e9 5a f2 ff ff       	jmp    80106530 <alltraps>

801072d6 <vector186>:
.globl vector186
vector186:
  pushl $0
801072d6:	6a 00                	push   $0x0
  pushl $186
801072d8:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801072dd:	e9 4e f2 ff ff       	jmp    80106530 <alltraps>

801072e2 <vector187>:
.globl vector187
vector187:
  pushl $0
801072e2:	6a 00                	push   $0x0
  pushl $187
801072e4:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801072e9:	e9 42 f2 ff ff       	jmp    80106530 <alltraps>

801072ee <vector188>:
.globl vector188
vector188:
  pushl $0
801072ee:	6a 00                	push   $0x0
  pushl $188
801072f0:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801072f5:	e9 36 f2 ff ff       	jmp    80106530 <alltraps>

801072fa <vector189>:
.globl vector189
vector189:
  pushl $0
801072fa:	6a 00                	push   $0x0
  pushl $189
801072fc:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80107301:	e9 2a f2 ff ff       	jmp    80106530 <alltraps>

80107306 <vector190>:
.globl vector190
vector190:
  pushl $0
80107306:	6a 00                	push   $0x0
  pushl $190
80107308:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
8010730d:	e9 1e f2 ff ff       	jmp    80106530 <alltraps>

80107312 <vector191>:
.globl vector191
vector191:
  pushl $0
80107312:	6a 00                	push   $0x0
  pushl $191
80107314:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80107319:	e9 12 f2 ff ff       	jmp    80106530 <alltraps>

8010731e <vector192>:
.globl vector192
vector192:
  pushl $0
8010731e:	6a 00                	push   $0x0
  pushl $192
80107320:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80107325:	e9 06 f2 ff ff       	jmp    80106530 <alltraps>

8010732a <vector193>:
.globl vector193
vector193:
  pushl $0
8010732a:	6a 00                	push   $0x0
  pushl $193
8010732c:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80107331:	e9 fa f1 ff ff       	jmp    80106530 <alltraps>

80107336 <vector194>:
.globl vector194
vector194:
  pushl $0
80107336:	6a 00                	push   $0x0
  pushl $194
80107338:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
8010733d:	e9 ee f1 ff ff       	jmp    80106530 <alltraps>

80107342 <vector195>:
.globl vector195
vector195:
  pushl $0
80107342:	6a 00                	push   $0x0
  pushl $195
80107344:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80107349:	e9 e2 f1 ff ff       	jmp    80106530 <alltraps>

8010734e <vector196>:
.globl vector196
vector196:
  pushl $0
8010734e:	6a 00                	push   $0x0
  pushl $196
80107350:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80107355:	e9 d6 f1 ff ff       	jmp    80106530 <alltraps>

8010735a <vector197>:
.globl vector197
vector197:
  pushl $0
8010735a:	6a 00                	push   $0x0
  pushl $197
8010735c:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80107361:	e9 ca f1 ff ff       	jmp    80106530 <alltraps>

80107366 <vector198>:
.globl vector198
vector198:
  pushl $0
80107366:	6a 00                	push   $0x0
  pushl $198
80107368:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
8010736d:	e9 be f1 ff ff       	jmp    80106530 <alltraps>

80107372 <vector199>:
.globl vector199
vector199:
  pushl $0
80107372:	6a 00                	push   $0x0
  pushl $199
80107374:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80107379:	e9 b2 f1 ff ff       	jmp    80106530 <alltraps>

8010737e <vector200>:
.globl vector200
vector200:
  pushl $0
8010737e:	6a 00                	push   $0x0
  pushl $200
80107380:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80107385:	e9 a6 f1 ff ff       	jmp    80106530 <alltraps>

8010738a <vector201>:
.globl vector201
vector201:
  pushl $0
8010738a:	6a 00                	push   $0x0
  pushl $201
8010738c:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80107391:	e9 9a f1 ff ff       	jmp    80106530 <alltraps>

80107396 <vector202>:
.globl vector202
vector202:
  pushl $0
80107396:	6a 00                	push   $0x0
  pushl $202
80107398:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
8010739d:	e9 8e f1 ff ff       	jmp    80106530 <alltraps>

801073a2 <vector203>:
.globl vector203
vector203:
  pushl $0
801073a2:	6a 00                	push   $0x0
  pushl $203
801073a4:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
801073a9:	e9 82 f1 ff ff       	jmp    80106530 <alltraps>

801073ae <vector204>:
.globl vector204
vector204:
  pushl $0
801073ae:	6a 00                	push   $0x0
  pushl $204
801073b0:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
801073b5:	e9 76 f1 ff ff       	jmp    80106530 <alltraps>

801073ba <vector205>:
.globl vector205
vector205:
  pushl $0
801073ba:	6a 00                	push   $0x0
  pushl $205
801073bc:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801073c1:	e9 6a f1 ff ff       	jmp    80106530 <alltraps>

801073c6 <vector206>:
.globl vector206
vector206:
  pushl $0
801073c6:	6a 00                	push   $0x0
  pushl $206
801073c8:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801073cd:	e9 5e f1 ff ff       	jmp    80106530 <alltraps>

801073d2 <vector207>:
.globl vector207
vector207:
  pushl $0
801073d2:	6a 00                	push   $0x0
  pushl $207
801073d4:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801073d9:	e9 52 f1 ff ff       	jmp    80106530 <alltraps>

801073de <vector208>:
.globl vector208
vector208:
  pushl $0
801073de:	6a 00                	push   $0x0
  pushl $208
801073e0:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801073e5:	e9 46 f1 ff ff       	jmp    80106530 <alltraps>

801073ea <vector209>:
.globl vector209
vector209:
  pushl $0
801073ea:	6a 00                	push   $0x0
  pushl $209
801073ec:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801073f1:	e9 3a f1 ff ff       	jmp    80106530 <alltraps>

801073f6 <vector210>:
.globl vector210
vector210:
  pushl $0
801073f6:	6a 00                	push   $0x0
  pushl $210
801073f8:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801073fd:	e9 2e f1 ff ff       	jmp    80106530 <alltraps>

80107402 <vector211>:
.globl vector211
vector211:
  pushl $0
80107402:	6a 00                	push   $0x0
  pushl $211
80107404:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80107409:	e9 22 f1 ff ff       	jmp    80106530 <alltraps>

8010740e <vector212>:
.globl vector212
vector212:
  pushl $0
8010740e:	6a 00                	push   $0x0
  pushl $212
80107410:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80107415:	e9 16 f1 ff ff       	jmp    80106530 <alltraps>

8010741a <vector213>:
.globl vector213
vector213:
  pushl $0
8010741a:	6a 00                	push   $0x0
  pushl $213
8010741c:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80107421:	e9 0a f1 ff ff       	jmp    80106530 <alltraps>

80107426 <vector214>:
.globl vector214
vector214:
  pushl $0
80107426:	6a 00                	push   $0x0
  pushl $214
80107428:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
8010742d:	e9 fe f0 ff ff       	jmp    80106530 <alltraps>

80107432 <vector215>:
.globl vector215
vector215:
  pushl $0
80107432:	6a 00                	push   $0x0
  pushl $215
80107434:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80107439:	e9 f2 f0 ff ff       	jmp    80106530 <alltraps>

8010743e <vector216>:
.globl vector216
vector216:
  pushl $0
8010743e:	6a 00                	push   $0x0
  pushl $216
80107440:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80107445:	e9 e6 f0 ff ff       	jmp    80106530 <alltraps>

8010744a <vector217>:
.globl vector217
vector217:
  pushl $0
8010744a:	6a 00                	push   $0x0
  pushl $217
8010744c:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80107451:	e9 da f0 ff ff       	jmp    80106530 <alltraps>

80107456 <vector218>:
.globl vector218
vector218:
  pushl $0
80107456:	6a 00                	push   $0x0
  pushl $218
80107458:	68 da 00 00 00       	push   $0xda
  jmp alltraps
8010745d:	e9 ce f0 ff ff       	jmp    80106530 <alltraps>

80107462 <vector219>:
.globl vector219
vector219:
  pushl $0
80107462:	6a 00                	push   $0x0
  pushl $219
80107464:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80107469:	e9 c2 f0 ff ff       	jmp    80106530 <alltraps>

8010746e <vector220>:
.globl vector220
vector220:
  pushl $0
8010746e:	6a 00                	push   $0x0
  pushl $220
80107470:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80107475:	e9 b6 f0 ff ff       	jmp    80106530 <alltraps>

8010747a <vector221>:
.globl vector221
vector221:
  pushl $0
8010747a:	6a 00                	push   $0x0
  pushl $221
8010747c:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80107481:	e9 aa f0 ff ff       	jmp    80106530 <alltraps>

80107486 <vector222>:
.globl vector222
vector222:
  pushl $0
80107486:	6a 00                	push   $0x0
  pushl $222
80107488:	68 de 00 00 00       	push   $0xde
  jmp alltraps
8010748d:	e9 9e f0 ff ff       	jmp    80106530 <alltraps>

80107492 <vector223>:
.globl vector223
vector223:
  pushl $0
80107492:	6a 00                	push   $0x0
  pushl $223
80107494:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80107499:	e9 92 f0 ff ff       	jmp    80106530 <alltraps>

8010749e <vector224>:
.globl vector224
vector224:
  pushl $0
8010749e:	6a 00                	push   $0x0
  pushl $224
801074a0:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801074a5:	e9 86 f0 ff ff       	jmp    80106530 <alltraps>

801074aa <vector225>:
.globl vector225
vector225:
  pushl $0
801074aa:	6a 00                	push   $0x0
  pushl $225
801074ac:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
801074b1:	e9 7a f0 ff ff       	jmp    80106530 <alltraps>

801074b6 <vector226>:
.globl vector226
vector226:
  pushl $0
801074b6:	6a 00                	push   $0x0
  pushl $226
801074b8:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
801074bd:	e9 6e f0 ff ff       	jmp    80106530 <alltraps>

801074c2 <vector227>:
.globl vector227
vector227:
  pushl $0
801074c2:	6a 00                	push   $0x0
  pushl $227
801074c4:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
801074c9:	e9 62 f0 ff ff       	jmp    80106530 <alltraps>

801074ce <vector228>:
.globl vector228
vector228:
  pushl $0
801074ce:	6a 00                	push   $0x0
  pushl $228
801074d0:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
801074d5:	e9 56 f0 ff ff       	jmp    80106530 <alltraps>

801074da <vector229>:
.globl vector229
vector229:
  pushl $0
801074da:	6a 00                	push   $0x0
  pushl $229
801074dc:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
801074e1:	e9 4a f0 ff ff       	jmp    80106530 <alltraps>

801074e6 <vector230>:
.globl vector230
vector230:
  pushl $0
801074e6:	6a 00                	push   $0x0
  pushl $230
801074e8:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
801074ed:	e9 3e f0 ff ff       	jmp    80106530 <alltraps>

801074f2 <vector231>:
.globl vector231
vector231:
  pushl $0
801074f2:	6a 00                	push   $0x0
  pushl $231
801074f4:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
801074f9:	e9 32 f0 ff ff       	jmp    80106530 <alltraps>

801074fe <vector232>:
.globl vector232
vector232:
  pushl $0
801074fe:	6a 00                	push   $0x0
  pushl $232
80107500:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80107505:	e9 26 f0 ff ff       	jmp    80106530 <alltraps>

8010750a <vector233>:
.globl vector233
vector233:
  pushl $0
8010750a:	6a 00                	push   $0x0
  pushl $233
8010750c:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80107511:	e9 1a f0 ff ff       	jmp    80106530 <alltraps>

80107516 <vector234>:
.globl vector234
vector234:
  pushl $0
80107516:	6a 00                	push   $0x0
  pushl $234
80107518:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
8010751d:	e9 0e f0 ff ff       	jmp    80106530 <alltraps>

80107522 <vector235>:
.globl vector235
vector235:
  pushl $0
80107522:	6a 00                	push   $0x0
  pushl $235
80107524:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80107529:	e9 02 f0 ff ff       	jmp    80106530 <alltraps>

8010752e <vector236>:
.globl vector236
vector236:
  pushl $0
8010752e:	6a 00                	push   $0x0
  pushl $236
80107530:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80107535:	e9 f6 ef ff ff       	jmp    80106530 <alltraps>

8010753a <vector237>:
.globl vector237
vector237:
  pushl $0
8010753a:	6a 00                	push   $0x0
  pushl $237
8010753c:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80107541:	e9 ea ef ff ff       	jmp    80106530 <alltraps>

80107546 <vector238>:
.globl vector238
vector238:
  pushl $0
80107546:	6a 00                	push   $0x0
  pushl $238
80107548:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
8010754d:	e9 de ef ff ff       	jmp    80106530 <alltraps>

80107552 <vector239>:
.globl vector239
vector239:
  pushl $0
80107552:	6a 00                	push   $0x0
  pushl $239
80107554:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80107559:	e9 d2 ef ff ff       	jmp    80106530 <alltraps>

8010755e <vector240>:
.globl vector240
vector240:
  pushl $0
8010755e:	6a 00                	push   $0x0
  pushl $240
80107560:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80107565:	e9 c6 ef ff ff       	jmp    80106530 <alltraps>

8010756a <vector241>:
.globl vector241
vector241:
  pushl $0
8010756a:	6a 00                	push   $0x0
  pushl $241
8010756c:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80107571:	e9 ba ef ff ff       	jmp    80106530 <alltraps>

80107576 <vector242>:
.globl vector242
vector242:
  pushl $0
80107576:	6a 00                	push   $0x0
  pushl $242
80107578:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
8010757d:	e9 ae ef ff ff       	jmp    80106530 <alltraps>

80107582 <vector243>:
.globl vector243
vector243:
  pushl $0
80107582:	6a 00                	push   $0x0
  pushl $243
80107584:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80107589:	e9 a2 ef ff ff       	jmp    80106530 <alltraps>

8010758e <vector244>:
.globl vector244
vector244:
  pushl $0
8010758e:	6a 00                	push   $0x0
  pushl $244
80107590:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80107595:	e9 96 ef ff ff       	jmp    80106530 <alltraps>

8010759a <vector245>:
.globl vector245
vector245:
  pushl $0
8010759a:	6a 00                	push   $0x0
  pushl $245
8010759c:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801075a1:	e9 8a ef ff ff       	jmp    80106530 <alltraps>

801075a6 <vector246>:
.globl vector246
vector246:
  pushl $0
801075a6:	6a 00                	push   $0x0
  pushl $246
801075a8:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
801075ad:	e9 7e ef ff ff       	jmp    80106530 <alltraps>

801075b2 <vector247>:
.globl vector247
vector247:
  pushl $0
801075b2:	6a 00                	push   $0x0
  pushl $247
801075b4:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
801075b9:	e9 72 ef ff ff       	jmp    80106530 <alltraps>

801075be <vector248>:
.globl vector248
vector248:
  pushl $0
801075be:	6a 00                	push   $0x0
  pushl $248
801075c0:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
801075c5:	e9 66 ef ff ff       	jmp    80106530 <alltraps>

801075ca <vector249>:
.globl vector249
vector249:
  pushl $0
801075ca:	6a 00                	push   $0x0
  pushl $249
801075cc:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
801075d1:	e9 5a ef ff ff       	jmp    80106530 <alltraps>

801075d6 <vector250>:
.globl vector250
vector250:
  pushl $0
801075d6:	6a 00                	push   $0x0
  pushl $250
801075d8:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
801075dd:	e9 4e ef ff ff       	jmp    80106530 <alltraps>

801075e2 <vector251>:
.globl vector251
vector251:
  pushl $0
801075e2:	6a 00                	push   $0x0
  pushl $251
801075e4:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
801075e9:	e9 42 ef ff ff       	jmp    80106530 <alltraps>

801075ee <vector252>:
.globl vector252
vector252:
  pushl $0
801075ee:	6a 00                	push   $0x0
  pushl $252
801075f0:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
801075f5:	e9 36 ef ff ff       	jmp    80106530 <alltraps>

801075fa <vector253>:
.globl vector253
vector253:
  pushl $0
801075fa:	6a 00                	push   $0x0
  pushl $253
801075fc:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80107601:	e9 2a ef ff ff       	jmp    80106530 <alltraps>

80107606 <vector254>:
.globl vector254
vector254:
  pushl $0
80107606:	6a 00                	push   $0x0
  pushl $254
80107608:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
8010760d:	e9 1e ef ff ff       	jmp    80106530 <alltraps>

80107612 <vector255>:
.globl vector255
vector255:
  pushl $0
80107612:	6a 00                	push   $0x0
  pushl $255
80107614:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80107619:	e9 12 ef ff ff       	jmp    80106530 <alltraps>
	...

80107620 <lgdt>:

struct segdesc;

static inline void
lgdt(struct segdesc *p, int size)
{
80107620:	55                   	push   %ebp
80107621:	89 e5                	mov    %esp,%ebp
80107623:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80107626:	8b 45 0c             	mov    0xc(%ebp),%eax
80107629:	83 e8 01             	sub    $0x1,%eax
8010762c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80107630:	8b 45 08             	mov    0x8(%ebp),%eax
80107633:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80107637:	8b 45 08             	mov    0x8(%ebp),%eax
8010763a:	c1 e8 10             	shr    $0x10,%eax
8010763d:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80107641:	8d 45 fa             	lea    -0x6(%ebp),%eax
80107644:	0f 01 10             	lgdtl  (%eax)
}
80107647:	c9                   	leave  
80107648:	c3                   	ret    

80107649 <ltr>:
  asm volatile("lidt (%0)" : : "r" (pd));
}

static inline void
ltr(ushort sel)
{
80107649:	55                   	push   %ebp
8010764a:	89 e5                	mov    %esp,%ebp
8010764c:	83 ec 04             	sub    $0x4,%esp
8010764f:	8b 45 08             	mov    0x8(%ebp),%eax
80107652:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("ltr %0" : : "r" (sel));
80107656:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
8010765a:	0f 00 d8             	ltr    %ax
}
8010765d:	c9                   	leave  
8010765e:	c3                   	ret    

8010765f <loadgs>:
  return eflags;
}

static inline void
loadgs(ushort v)
{
8010765f:	55                   	push   %ebp
80107660:	89 e5                	mov    %esp,%ebp
80107662:	83 ec 04             	sub    $0x4,%esp
80107665:	8b 45 08             	mov    0x8(%ebp),%eax
80107668:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("movw %0, %%gs" : : "r" (v));
8010766c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80107670:	8e e8                	mov    %eax,%gs
}
80107672:	c9                   	leave  
80107673:	c3                   	ret    

80107674 <lcr3>:
  return val;
}

static inline void
lcr3(uint val) 
{
80107674:	55                   	push   %ebp
80107675:	89 e5                	mov    %esp,%ebp
  asm volatile("movl %0,%%cr3" : : "r" (val));
80107677:	8b 45 08             	mov    0x8(%ebp),%eax
8010767a:	0f 22 d8             	mov    %eax,%cr3
}
8010767d:	5d                   	pop    %ebp
8010767e:	c3                   	ret    

8010767f <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
8010767f:	55                   	push   %ebp
80107680:	89 e5                	mov    %esp,%ebp
80107682:	8b 45 08             	mov    0x8(%ebp),%eax
80107685:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010768a:	5d                   	pop    %ebp
8010768b:	c3                   	ret    

8010768c <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
8010768c:	55                   	push   %ebp
8010768d:	89 e5                	mov    %esp,%ebp
8010768f:	8b 45 08             	mov    0x8(%ebp),%eax
80107692:	2d 00 00 00 80       	sub    $0x80000000,%eax
80107697:	5d                   	pop    %ebp
80107698:	c3                   	ret    

80107699 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80107699:	55                   	push   %ebp
8010769a:	89 e5                	mov    %esp,%ebp
8010769c:	53                   	push   %ebx
8010769d:	83 ec 24             	sub    $0x24,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
801076a0:	e8 df b7 ff ff       	call   80102e84 <cpunum>
801076a5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801076ab:	05 20 f9 10 80       	add    $0x8010f920,%eax
801076b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801076b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076b6:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
801076bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076bf:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
801076c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076c8:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
801076cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076cf:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801076d3:	83 e2 f0             	and    $0xfffffff0,%edx
801076d6:	83 ca 0a             	or     $0xa,%edx
801076d9:	88 50 7d             	mov    %dl,0x7d(%eax)
801076dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076df:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801076e3:	83 ca 10             	or     $0x10,%edx
801076e6:	88 50 7d             	mov    %dl,0x7d(%eax)
801076e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076ec:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801076f0:	83 e2 9f             	and    $0xffffff9f,%edx
801076f3:	88 50 7d             	mov    %dl,0x7d(%eax)
801076f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076f9:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801076fd:	83 ca 80             	or     $0xffffff80,%edx
80107700:	88 50 7d             	mov    %dl,0x7d(%eax)
80107703:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107706:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
8010770a:	83 ca 0f             	or     $0xf,%edx
8010770d:	88 50 7e             	mov    %dl,0x7e(%eax)
80107710:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107713:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107717:	83 e2 ef             	and    $0xffffffef,%edx
8010771a:	88 50 7e             	mov    %dl,0x7e(%eax)
8010771d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107720:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107724:	83 e2 df             	and    $0xffffffdf,%edx
80107727:	88 50 7e             	mov    %dl,0x7e(%eax)
8010772a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010772d:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107731:	83 ca 40             	or     $0x40,%edx
80107734:	88 50 7e             	mov    %dl,0x7e(%eax)
80107737:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010773a:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
8010773e:	83 ca 80             	or     $0xffffff80,%edx
80107741:	88 50 7e             	mov    %dl,0x7e(%eax)
80107744:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107747:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010774b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010774e:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80107755:	ff ff 
80107757:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010775a:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80107761:	00 00 
80107763:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107766:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
8010776d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107770:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80107777:	83 e2 f0             	and    $0xfffffff0,%edx
8010777a:	83 ca 02             	or     $0x2,%edx
8010777d:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80107783:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107786:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
8010778d:	83 ca 10             	or     $0x10,%edx
80107790:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80107796:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107799:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
801077a0:	83 e2 9f             	and    $0xffffff9f,%edx
801077a3:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801077a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077ac:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
801077b3:	83 ca 80             	or     $0xffffff80,%edx
801077b6:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801077bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077bf:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801077c6:	83 ca 0f             	or     $0xf,%edx
801077c9:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801077cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077d2:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801077d9:	83 e2 ef             	and    $0xffffffef,%edx
801077dc:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801077e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077e5:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801077ec:	83 e2 df             	and    $0xffffffdf,%edx
801077ef:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801077f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077f8:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801077ff:	83 ca 40             	or     $0x40,%edx
80107802:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80107808:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010780b:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80107812:	83 ca 80             	or     $0xffffff80,%edx
80107815:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
8010781b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010781e:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80107825:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107828:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
8010782f:	ff ff 
80107831:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107834:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
8010783b:	00 00 
8010783d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107840:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80107847:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010784a:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107851:	83 e2 f0             	and    $0xfffffff0,%edx
80107854:	83 ca 0a             	or     $0xa,%edx
80107857:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
8010785d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107860:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107867:	83 ca 10             	or     $0x10,%edx
8010786a:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107870:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107873:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010787a:	83 ca 60             	or     $0x60,%edx
8010787d:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107883:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107886:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010788d:	83 ca 80             	or     $0xffffff80,%edx
80107890:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107896:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107899:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801078a0:	83 ca 0f             	or     $0xf,%edx
801078a3:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801078a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078ac:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801078b3:	83 e2 ef             	and    $0xffffffef,%edx
801078b6:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801078bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078bf:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801078c6:	83 e2 df             	and    $0xffffffdf,%edx
801078c9:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801078cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078d2:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801078d9:	83 ca 40             	or     $0x40,%edx
801078dc:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801078e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078e5:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801078ec:	83 ca 80             	or     $0xffffff80,%edx
801078ef:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801078f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078f8:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801078ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107902:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
80107909:	ff ff 
8010790b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010790e:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
80107915:	00 00 
80107917:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010791a:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
80107921:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107924:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
8010792b:	83 e2 f0             	and    $0xfffffff0,%edx
8010792e:	83 ca 02             	or     $0x2,%edx
80107931:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107937:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010793a:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107941:	83 ca 10             	or     $0x10,%edx
80107944:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
8010794a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010794d:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107954:	83 ca 60             	or     $0x60,%edx
80107957:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
8010795d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107960:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107967:	83 ca 80             	or     $0xffffff80,%edx
8010796a:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107970:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107973:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
8010797a:	83 ca 0f             	or     $0xf,%edx
8010797d:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107983:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107986:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
8010798d:	83 e2 ef             	and    $0xffffffef,%edx
80107990:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107996:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107999:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801079a0:	83 e2 df             	and    $0xffffffdf,%edx
801079a3:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801079a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079ac:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801079b3:	83 ca 40             	or     $0x40,%edx
801079b6:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801079bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079bf:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801079c6:	83 ca 80             	or     $0xffffff80,%edx
801079c9:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801079cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079d2:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801079d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079dc:	05 b4 00 00 00       	add    $0xb4,%eax
801079e1:	89 c3                	mov    %eax,%ebx
801079e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079e6:	05 b4 00 00 00       	add    $0xb4,%eax
801079eb:	c1 e8 10             	shr    $0x10,%eax
801079ee:	89 c1                	mov    %eax,%ecx
801079f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079f3:	05 b4 00 00 00       	add    $0xb4,%eax
801079f8:	c1 e8 18             	shr    $0x18,%eax
801079fb:	89 c2                	mov    %eax,%edx
801079fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a00:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
80107a07:	00 00 
80107a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a0c:	66 89 98 8a 00 00 00 	mov    %bx,0x8a(%eax)
80107a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a16:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
80107a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a1f:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107a26:	83 e1 f0             	and    $0xfffffff0,%ecx
80107a29:	83 c9 02             	or     $0x2,%ecx
80107a2c:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a35:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107a3c:	83 c9 10             	or     $0x10,%ecx
80107a3f:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a48:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107a4f:	83 e1 9f             	and    $0xffffff9f,%ecx
80107a52:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a5b:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107a62:	83 c9 80             	or     $0xffffff80,%ecx
80107a65:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a6e:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107a75:	83 e1 f0             	and    $0xfffffff0,%ecx
80107a78:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a81:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107a88:	83 e1 ef             	and    $0xffffffef,%ecx
80107a8b:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a94:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107a9b:	83 e1 df             	and    $0xffffffdf,%ecx
80107a9e:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aa7:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107aae:	83 c9 40             	or     $0x40,%ecx
80107ab1:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aba:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107ac1:	83 c9 80             	or     $0xffffff80,%ecx
80107ac4:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107acd:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80107ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ad6:	83 c0 70             	add    $0x70,%eax
80107ad9:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
80107ae0:	00 
80107ae1:	89 04 24             	mov    %eax,(%esp)
80107ae4:	e8 37 fb ff ff       	call   80107620 <lgdt>
  loadgs(SEG_KCPU << 3);
80107ae9:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
80107af0:	e8 6a fb ff ff       	call   8010765f <loadgs>
  
  // Initialize cpu-local storage.
  cpu = c;
80107af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107af8:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
80107afe:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80107b05:	00 00 00 00 
}
80107b09:	83 c4 24             	add    $0x24,%esp
80107b0c:	5b                   	pop    %ebx
80107b0d:	5d                   	pop    %ebp
80107b0e:	c3                   	ret    

80107b0f <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80107b0f:	55                   	push   %ebp
80107b10:	89 e5                	mov    %esp,%ebp
80107b12:	83 ec 28             	sub    $0x28,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80107b15:	8b 45 0c             	mov    0xc(%ebp),%eax
80107b18:	c1 e8 16             	shr    $0x16,%eax
80107b1b:	c1 e0 02             	shl    $0x2,%eax
80107b1e:	03 45 08             	add    0x8(%ebp),%eax
80107b21:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*pde & PTE_P){
80107b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107b27:	8b 00                	mov    (%eax),%eax
80107b29:	83 e0 01             	and    $0x1,%eax
80107b2c:	84 c0                	test   %al,%al
80107b2e:	74 17                	je     80107b47 <walkpgdir+0x38>
    pgtab = (pte_t*)p2v(PTE_ADDR(*pde));
80107b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107b33:	8b 00                	mov    (%eax),%eax
80107b35:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107b3a:	89 04 24             	mov    %eax,(%esp)
80107b3d:	e8 4a fb ff ff       	call   8010768c <p2v>
80107b42:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107b45:	eb 4b                	jmp    80107b92 <walkpgdir+0x83>
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80107b47:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80107b4b:	74 0e                	je     80107b5b <walkpgdir+0x4c>
80107b4d:	e8 b8 af ff ff       	call   80102b0a <kalloc>
80107b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107b55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107b59:	75 07                	jne    80107b62 <walkpgdir+0x53>
      return 0;
80107b5b:	b8 00 00 00 00       	mov    $0x0,%eax
80107b60:	eb 41                	jmp    80107ba3 <walkpgdir+0x94>
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80107b62:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107b69:	00 
80107b6a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107b71:	00 
80107b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b75:	89 04 24             	mov    %eax,(%esp)
80107b78:	e8 25 d5 ff ff       	call   801050a2 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = v2p(pgtab) | PTE_P | PTE_W | PTE_U;
80107b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b80:	89 04 24             	mov    %eax,(%esp)
80107b83:	e8 f7 fa ff ff       	call   8010767f <v2p>
80107b88:	89 c2                	mov    %eax,%edx
80107b8a:	83 ca 07             	or     $0x7,%edx
80107b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107b90:	89 10                	mov    %edx,(%eax)
  }
  return &pgtab[PTX(va)];
80107b92:	8b 45 0c             	mov    0xc(%ebp),%eax
80107b95:	c1 e8 0c             	shr    $0xc,%eax
80107b98:	25 ff 03 00 00       	and    $0x3ff,%eax
80107b9d:	c1 e0 02             	shl    $0x2,%eax
80107ba0:	03 45 f4             	add    -0xc(%ebp),%eax
}
80107ba3:	c9                   	leave  
80107ba4:	c3                   	ret    

80107ba5 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80107ba5:	55                   	push   %ebp
80107ba6:	89 e5                	mov    %esp,%ebp
80107ba8:	83 ec 28             	sub    $0x28,%esp
  char *a, *last;
  pte_t *pte;
  
  a = (char*)PGROUNDDOWN((uint)va);
80107bab:	8b 45 0c             	mov    0xc(%ebp),%eax
80107bae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107bb3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80107bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
80107bb9:	03 45 10             	add    0x10(%ebp),%eax
80107bbc:	83 e8 01             	sub    $0x1,%eax
80107bbf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107bc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80107bc7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
80107bce:	00 
80107bcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
80107bd6:	8b 45 08             	mov    0x8(%ebp),%eax
80107bd9:	89 04 24             	mov    %eax,(%esp)
80107bdc:	e8 2e ff ff ff       	call   80107b0f <walkpgdir>
80107be1:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107be4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107be8:	75 07                	jne    80107bf1 <mappages+0x4c>
      return -1;
80107bea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107bef:	eb 46                	jmp    80107c37 <mappages+0x92>
    if(*pte & PTE_P)
80107bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bf4:	8b 00                	mov    (%eax),%eax
80107bf6:	83 e0 01             	and    $0x1,%eax
80107bf9:	84 c0                	test   %al,%al
80107bfb:	74 0c                	je     80107c09 <mappages+0x64>
      panic("remap");
80107bfd:	c7 04 24 30 8a 10 80 	movl   $0x80108a30,(%esp)
80107c04:	e8 31 89 ff ff       	call   8010053a <panic>
    *pte = pa | perm | PTE_P;
80107c09:	8b 45 18             	mov    0x18(%ebp),%eax
80107c0c:	0b 45 14             	or     0x14(%ebp),%eax
80107c0f:	89 c2                	mov    %eax,%edx
80107c11:	83 ca 01             	or     $0x1,%edx
80107c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107c17:	89 10                	mov    %edx,(%eax)
    if(a == last)
80107c19:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107c1c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107c1f:	74 10                	je     80107c31 <mappages+0x8c>
      break;
    a += PGSIZE;
80107c21:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
    pa += PGSIZE;
80107c28:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
  }
80107c2f:	eb 96                	jmp    80107bc7 <mappages+0x22>
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
80107c31:	90                   	nop
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80107c32:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107c37:	c9                   	leave  
80107c38:	c3                   	ret    

80107c39 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80107c39:	55                   	push   %ebp
80107c3a:	89 e5                	mov    %esp,%ebp
80107c3c:	53                   	push   %ebx
80107c3d:	83 ec 34             	sub    $0x34,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80107c40:	e8 c5 ae ff ff       	call   80102b0a <kalloc>
80107c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107c48:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80107c4c:	75 0a                	jne    80107c58 <setupkvm+0x1f>
    return 0;
80107c4e:	b8 00 00 00 00       	mov    $0x0,%eax
80107c53:	e9 99 00 00 00       	jmp    80107cf1 <setupkvm+0xb8>
  memset(pgdir, 0, PGSIZE);
80107c58:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107c5f:	00 
80107c60:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107c67:	00 
80107c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107c6b:	89 04 24             	mov    %eax,(%esp)
80107c6e:	e8 2f d4 ff ff       	call   801050a2 <memset>
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
80107c73:	c7 04 24 00 00 00 0e 	movl   $0xe000000,(%esp)
80107c7a:	e8 0d fa ff ff       	call   8010768c <p2v>
80107c7f:	3d 00 00 00 fe       	cmp    $0xfe000000,%eax
80107c84:	76 0c                	jbe    80107c92 <setupkvm+0x59>
    panic("PHYSTOP too high");
80107c86:	c7 04 24 36 8a 10 80 	movl   $0x80108a36,(%esp)
80107c8d:	e8 a8 88 ff ff       	call   8010053a <panic>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107c92:	c7 45 f4 a0 b4 10 80 	movl   $0x8010b4a0,-0xc(%ebp)
80107c99:	eb 49                	jmp    80107ce4 <setupkvm+0xab>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
80107c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107c9e:	8b 48 0c             	mov    0xc(%eax),%ecx
80107ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ca4:	8b 50 04             	mov    0x4(%eax),%edx
80107ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107caa:	8b 58 08             	mov    0x8(%eax),%ebx
80107cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107cb0:	8b 40 04             	mov    0x4(%eax),%eax
80107cb3:	29 c3                	sub    %eax,%ebx
80107cb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107cb8:	8b 00                	mov    (%eax),%eax
80107cba:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80107cbe:	89 54 24 0c          	mov    %edx,0xc(%esp)
80107cc2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80107cc6:	89 44 24 04          	mov    %eax,0x4(%esp)
80107cca:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107ccd:	89 04 24             	mov    %eax,(%esp)
80107cd0:	e8 d0 fe ff ff       	call   80107ba5 <mappages>
80107cd5:	85 c0                	test   %eax,%eax
80107cd7:	79 07                	jns    80107ce0 <setupkvm+0xa7>
                (uint)k->phys_start, k->perm) < 0)
      return 0;
80107cd9:	b8 00 00 00 00       	mov    $0x0,%eax
80107cde:	eb 11                	jmp    80107cf1 <setupkvm+0xb8>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107ce0:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
80107ce4:	b8 e0 b4 10 80       	mov    $0x8010b4e0,%eax
80107ce9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80107cec:	72 ad                	jb     80107c9b <setupkvm+0x62>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
80107cee:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80107cf1:	83 c4 34             	add    $0x34,%esp
80107cf4:	5b                   	pop    %ebx
80107cf5:	5d                   	pop    %ebp
80107cf6:	c3                   	ret    

80107cf7 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80107cf7:	55                   	push   %ebp
80107cf8:	89 e5                	mov    %esp,%ebp
80107cfa:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107cfd:	e8 37 ff ff ff       	call   80107c39 <setupkvm>
80107d02:	a3 f8 28 11 80       	mov    %eax,0x801128f8
  switchkvm();
80107d07:	e8 02 00 00 00       	call   80107d0e <switchkvm>
}
80107d0c:	c9                   	leave  
80107d0d:	c3                   	ret    

80107d0e <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80107d0e:	55                   	push   %ebp
80107d0f:	89 e5                	mov    %esp,%ebp
80107d11:	83 ec 04             	sub    $0x4,%esp
  lcr3(v2p(kpgdir));   // switch to the kernel page table
80107d14:	a1 f8 28 11 80       	mov    0x801128f8,%eax
80107d19:	89 04 24             	mov    %eax,(%esp)
80107d1c:	e8 5e f9 ff ff       	call   8010767f <v2p>
80107d21:	89 04 24             	mov    %eax,(%esp)
80107d24:	e8 4b f9 ff ff       	call   80107674 <lcr3>
}
80107d29:	c9                   	leave  
80107d2a:	c3                   	ret    

80107d2b <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80107d2b:	55                   	push   %ebp
80107d2c:	89 e5                	mov    %esp,%ebp
80107d2e:	53                   	push   %ebx
80107d2f:	83 ec 14             	sub    $0x14,%esp
  pushcli();
80107d32:	e8 65 d2 ff ff       	call   80104f9c <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107d37:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107d3d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107d44:	83 c2 08             	add    $0x8,%edx
80107d47:	89 d3                	mov    %edx,%ebx
80107d49:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107d50:	83 c2 08             	add    $0x8,%edx
80107d53:	c1 ea 10             	shr    $0x10,%edx
80107d56:	89 d1                	mov    %edx,%ecx
80107d58:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107d5f:	83 c2 08             	add    $0x8,%edx
80107d62:	c1 ea 18             	shr    $0x18,%edx
80107d65:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
80107d6c:	67 00 
80107d6e:	66 89 98 a2 00 00 00 	mov    %bx,0xa2(%eax)
80107d75:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80107d7b:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107d82:	83 e1 f0             	and    $0xfffffff0,%ecx
80107d85:	83 c9 09             	or     $0x9,%ecx
80107d88:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107d8e:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107d95:	83 c9 10             	or     $0x10,%ecx
80107d98:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107d9e:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107da5:	83 e1 9f             	and    $0xffffff9f,%ecx
80107da8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107dae:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107db5:	83 c9 80             	or     $0xffffff80,%ecx
80107db8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107dbe:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107dc5:	83 e1 f0             	and    $0xfffffff0,%ecx
80107dc8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107dce:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107dd5:	83 e1 ef             	and    $0xffffffef,%ecx
80107dd8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107dde:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107de5:	83 e1 df             	and    $0xffffffdf,%ecx
80107de8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107dee:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107df5:	83 c9 40             	or     $0x40,%ecx
80107df8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107dfe:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107e05:	83 e1 7f             	and    $0x7f,%ecx
80107e08:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107e0e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80107e14:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107e1a:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107e21:	83 e2 ef             	and    $0xffffffef,%edx
80107e24:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
80107e2a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107e30:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107e36:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107e3c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80107e43:	8b 52 08             	mov    0x8(%edx),%edx
80107e46:	81 c2 00 10 00 00    	add    $0x1000,%edx
80107e4c:	89 50 0c             	mov    %edx,0xc(%eax)
  ltr(SEG_TSS << 3);
80107e4f:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
80107e56:	e8 ee f7 ff ff       	call   80107649 <ltr>
  if(p->pgdir == 0)
80107e5b:	8b 45 08             	mov    0x8(%ebp),%eax
80107e5e:	8b 40 04             	mov    0x4(%eax),%eax
80107e61:	85 c0                	test   %eax,%eax
80107e63:	75 0c                	jne    80107e71 <switchuvm+0x146>
    panic("switchuvm: no pgdir");
80107e65:	c7 04 24 47 8a 10 80 	movl   $0x80108a47,(%esp)
80107e6c:	e8 c9 86 ff ff       	call   8010053a <panic>
  lcr3(v2p(p->pgdir));  // switch to new address space
80107e71:	8b 45 08             	mov    0x8(%ebp),%eax
80107e74:	8b 40 04             	mov    0x4(%eax),%eax
80107e77:	89 04 24             	mov    %eax,(%esp)
80107e7a:	e8 00 f8 ff ff       	call   8010767f <v2p>
80107e7f:	89 04 24             	mov    %eax,(%esp)
80107e82:	e8 ed f7 ff ff       	call   80107674 <lcr3>
  popcli();
80107e87:	e8 58 d1 ff ff       	call   80104fe4 <popcli>
}
80107e8c:	83 c4 14             	add    $0x14,%esp
80107e8f:	5b                   	pop    %ebx
80107e90:	5d                   	pop    %ebp
80107e91:	c3                   	ret    

80107e92 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80107e92:	55                   	push   %ebp
80107e93:	89 e5                	mov    %esp,%ebp
80107e95:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  
  if(sz >= PGSIZE)
80107e98:	81 7d 10 ff 0f 00 00 	cmpl   $0xfff,0x10(%ebp)
80107e9f:	76 0c                	jbe    80107ead <inituvm+0x1b>
    panic("inituvm: more than a page");
80107ea1:	c7 04 24 5b 8a 10 80 	movl   $0x80108a5b,(%esp)
80107ea8:	e8 8d 86 ff ff       	call   8010053a <panic>
  mem = kalloc();
80107ead:	e8 58 ac ff ff       	call   80102b0a <kalloc>
80107eb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(mem, 0, PGSIZE);
80107eb5:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107ebc:	00 
80107ebd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107ec4:	00 
80107ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ec8:	89 04 24             	mov    %eax,(%esp)
80107ecb:	e8 d2 d1 ff ff       	call   801050a2 <memset>
  mappages(pgdir, 0, PGSIZE, v2p(mem), PTE_W|PTE_U);
80107ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ed3:	89 04 24             	mov    %eax,(%esp)
80107ed6:	e8 a4 f7 ff ff       	call   8010767f <v2p>
80107edb:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80107ee2:	00 
80107ee3:	89 44 24 0c          	mov    %eax,0xc(%esp)
80107ee7:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107eee:	00 
80107eef:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107ef6:	00 
80107ef7:	8b 45 08             	mov    0x8(%ebp),%eax
80107efa:	89 04 24             	mov    %eax,(%esp)
80107efd:	e8 a3 fc ff ff       	call   80107ba5 <mappages>
  memmove(mem, init, sz);
80107f02:	8b 45 10             	mov    0x10(%ebp),%eax
80107f05:	89 44 24 08          	mov    %eax,0x8(%esp)
80107f09:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f0c:	89 44 24 04          	mov    %eax,0x4(%esp)
80107f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f13:	89 04 24             	mov    %eax,(%esp)
80107f16:	e8 5a d2 ff ff       	call   80105175 <memmove>
}
80107f1b:	c9                   	leave  
80107f1c:	c3                   	ret    

80107f1d <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80107f1d:	55                   	push   %ebp
80107f1e:	89 e5                	mov    %esp,%ebp
80107f20:	53                   	push   %ebx
80107f21:	83 ec 24             	sub    $0x24,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80107f24:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f27:	25 ff 0f 00 00       	and    $0xfff,%eax
80107f2c:	85 c0                	test   %eax,%eax
80107f2e:	74 0c                	je     80107f3c <loaduvm+0x1f>
    panic("loaduvm: addr must be page aligned");
80107f30:	c7 04 24 78 8a 10 80 	movl   $0x80108a78,(%esp)
80107f37:	e8 fe 85 ff ff       	call   8010053a <panic>
  for(i = 0; i < sz; i += PGSIZE){
80107f3c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80107f43:	e9 ae 00 00 00       	jmp    80107ff6 <loaduvm+0xd9>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107f48:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f4b:	8b 55 0c             	mov    0xc(%ebp),%edx
80107f4e:	8d 04 02             	lea    (%edx,%eax,1),%eax
80107f51:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80107f58:	00 
80107f59:	89 44 24 04          	mov    %eax,0x4(%esp)
80107f5d:	8b 45 08             	mov    0x8(%ebp),%eax
80107f60:	89 04 24             	mov    %eax,(%esp)
80107f63:	e8 a7 fb ff ff       	call   80107b0f <walkpgdir>
80107f68:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107f6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107f6f:	75 0c                	jne    80107f7d <loaduvm+0x60>
      panic("loaduvm: address should exist");
80107f71:	c7 04 24 9b 8a 10 80 	movl   $0x80108a9b,(%esp)
80107f78:	e8 bd 85 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
80107f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f80:	8b 00                	mov    (%eax),%eax
80107f82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107f87:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(sz - i < PGSIZE)
80107f8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f8d:	8b 55 18             	mov    0x18(%ebp),%edx
80107f90:	89 d1                	mov    %edx,%ecx
80107f92:	29 c1                	sub    %eax,%ecx
80107f94:	89 c8                	mov    %ecx,%eax
80107f96:	3d ff 0f 00 00       	cmp    $0xfff,%eax
80107f9b:	77 11                	ja     80107fae <loaduvm+0x91>
      n = sz - i;
80107f9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107fa0:	8b 55 18             	mov    0x18(%ebp),%edx
80107fa3:	89 d1                	mov    %edx,%ecx
80107fa5:	29 c1                	sub    %eax,%ecx
80107fa7:	89 c8                	mov    %ecx,%eax
80107fa9:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107fac:	eb 07                	jmp    80107fb5 <loaduvm+0x98>
    else
      n = PGSIZE;
80107fae:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
    if(readi(ip, p2v(pa), offset+i, n) != n)
80107fb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107fb8:	8b 55 14             	mov    0x14(%ebp),%edx
80107fbb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
80107fbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107fc1:	89 04 24             	mov    %eax,(%esp)
80107fc4:	e8 c3 f6 ff ff       	call   8010768c <p2v>
80107fc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
80107fcc:	89 54 24 0c          	mov    %edx,0xc(%esp)
80107fd0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80107fd4:	89 44 24 04          	mov    %eax,0x4(%esp)
80107fd8:	8b 45 10             	mov    0x10(%ebp),%eax
80107fdb:	89 04 24             	mov    %eax,(%esp)
80107fde:	e8 91 9d ff ff       	call   80101d74 <readi>
80107fe3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107fe6:	74 07                	je     80107fef <loaduvm+0xd2>
      return -1;
80107fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107fed:	eb 18                	jmp    80108007 <loaduvm+0xea>
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80107fef:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
80107ff6:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107ff9:	3b 45 18             	cmp    0x18(%ebp),%eax
80107ffc:	0f 82 46 ff ff ff    	jb     80107f48 <loaduvm+0x2b>
    else
      n = PGSIZE;
    if(readi(ip, p2v(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80108002:	b8 00 00 00 00       	mov    $0x0,%eax
}
80108007:	83 c4 24             	add    $0x24,%esp
8010800a:	5b                   	pop    %ebx
8010800b:	5d                   	pop    %ebp
8010800c:	c3                   	ret    

8010800d <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
8010800d:	55                   	push   %ebp
8010800e:	89 e5                	mov    %esp,%ebp
80108010:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80108013:	8b 45 10             	mov    0x10(%ebp),%eax
80108016:	85 c0                	test   %eax,%eax
80108018:	79 0a                	jns    80108024 <allocuvm+0x17>
    return 0;
8010801a:	b8 00 00 00 00       	mov    $0x0,%eax
8010801f:	e9 c1 00 00 00       	jmp    801080e5 <allocuvm+0xd8>
  if(newsz < oldsz)
80108024:	8b 45 10             	mov    0x10(%ebp),%eax
80108027:	3b 45 0c             	cmp    0xc(%ebp),%eax
8010802a:	73 08                	jae    80108034 <allocuvm+0x27>
    return oldsz;
8010802c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010802f:	e9 b1 00 00 00       	jmp    801080e5 <allocuvm+0xd8>

  a = PGROUNDUP(oldsz);
80108034:	8b 45 0c             	mov    0xc(%ebp),%eax
80108037:	05 ff 0f 00 00       	add    $0xfff,%eax
8010803c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108041:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; a < newsz; a += PGSIZE){
80108044:	e9 8d 00 00 00       	jmp    801080d6 <allocuvm+0xc9>
    mem = kalloc();
80108049:	e8 bc aa ff ff       	call   80102b0a <kalloc>
8010804e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(mem == 0){
80108051:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80108055:	75 2c                	jne    80108083 <allocuvm+0x76>
      cprintf("allocuvm out of memory\n");
80108057:	c7 04 24 b9 8a 10 80 	movl   $0x80108ab9,(%esp)
8010805e:	e8 37 83 ff ff       	call   8010039a <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80108063:	8b 45 0c             	mov    0xc(%ebp),%eax
80108066:	89 44 24 08          	mov    %eax,0x8(%esp)
8010806a:	8b 45 10             	mov    0x10(%ebp),%eax
8010806d:	89 44 24 04          	mov    %eax,0x4(%esp)
80108071:	8b 45 08             	mov    0x8(%ebp),%eax
80108074:	89 04 24             	mov    %eax,(%esp)
80108077:	e8 6b 00 00 00       	call   801080e7 <deallocuvm>
      return 0;
8010807c:	b8 00 00 00 00       	mov    $0x0,%eax
80108081:	eb 62                	jmp    801080e5 <allocuvm+0xd8>
    }
    memset(mem, 0, PGSIZE);
80108083:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010808a:	00 
8010808b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80108092:	00 
80108093:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108096:	89 04 24             	mov    %eax,(%esp)
80108099:	e8 04 d0 ff ff       	call   801050a2 <memset>
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
8010809e:	8b 45 f0             	mov    -0x10(%ebp),%eax
801080a1:	89 04 24             	mov    %eax,(%esp)
801080a4:	e8 d6 f5 ff ff       	call   8010767f <v2p>
801080a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
801080ac:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
801080b3:	00 
801080b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
801080b8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801080bf:	00 
801080c0:	89 54 24 04          	mov    %edx,0x4(%esp)
801080c4:	8b 45 08             	mov    0x8(%ebp),%eax
801080c7:	89 04 24             	mov    %eax,(%esp)
801080ca:	e8 d6 fa ff ff       	call   80107ba5 <mappages>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
801080cf:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
801080d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801080d9:	3b 45 10             	cmp    0x10(%ebp),%eax
801080dc:	0f 82 67 ff ff ff    	jb     80108049 <allocuvm+0x3c>
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
  }
  return newsz;
801080e2:	8b 45 10             	mov    0x10(%ebp),%eax
}
801080e5:	c9                   	leave  
801080e6:	c3                   	ret    

801080e7 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801080e7:	55                   	push   %ebp
801080e8:	89 e5                	mov    %esp,%ebp
801080ea:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801080ed:	8b 45 10             	mov    0x10(%ebp),%eax
801080f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
801080f3:	72 08                	jb     801080fd <deallocuvm+0x16>
    return oldsz;
801080f5:	8b 45 0c             	mov    0xc(%ebp),%eax
801080f8:	e9 a4 00 00 00       	jmp    801081a1 <deallocuvm+0xba>

  a = PGROUNDUP(newsz);
801080fd:	8b 45 10             	mov    0x10(%ebp),%eax
80108100:	05 ff 0f 00 00       	add    $0xfff,%eax
80108105:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010810a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(; a  < oldsz; a += PGSIZE){
8010810d:	e9 80 00 00 00       	jmp    80108192 <deallocuvm+0xab>
    pte = walkpgdir(pgdir, (char*)a, 0);
80108112:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108115:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010811c:	00 
8010811d:	89 44 24 04          	mov    %eax,0x4(%esp)
80108121:	8b 45 08             	mov    0x8(%ebp),%eax
80108124:	89 04 24             	mov    %eax,(%esp)
80108127:	e8 e3 f9 ff ff       	call   80107b0f <walkpgdir>
8010812c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(!pte)
8010812f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108133:	75 09                	jne    8010813e <deallocuvm+0x57>
      a += (NPTENTRIES - 1) * PGSIZE;
80108135:	81 45 ec 00 f0 3f 00 	addl   $0x3ff000,-0x14(%ebp)
8010813c:	eb 4d                	jmp    8010818b <deallocuvm+0xa4>
    else if((*pte & PTE_P) != 0){
8010813e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108141:	8b 00                	mov    (%eax),%eax
80108143:	83 e0 01             	and    $0x1,%eax
80108146:	84 c0                	test   %al,%al
80108148:	74 41                	je     8010818b <deallocuvm+0xa4>
      pa = PTE_ADDR(*pte);
8010814a:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010814d:	8b 00                	mov    (%eax),%eax
8010814f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108154:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(pa == 0)
80108157:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010815b:	75 0c                	jne    80108169 <deallocuvm+0x82>
        panic("kfree");
8010815d:	c7 04 24 d1 8a 10 80 	movl   $0x80108ad1,(%esp)
80108164:	e8 d1 83 ff ff       	call   8010053a <panic>
      char *v = p2v(pa);
80108169:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010816c:	89 04 24             	mov    %eax,(%esp)
8010816f:	e8 18 f5 ff ff       	call   8010768c <p2v>
80108174:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
80108177:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010817a:	89 04 24             	mov    %eax,(%esp)
8010817d:	e8 ef a8 ff ff       	call   80102a71 <kfree>
      *pte = 0;
80108182:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108185:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010818b:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
80108192:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108195:	3b 45 0c             	cmp    0xc(%ebp),%eax
80108198:	0f 82 74 ff ff ff    	jb     80108112 <deallocuvm+0x2b>
      char *v = p2v(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
8010819e:	8b 45 10             	mov    0x10(%ebp),%eax
}
801081a1:	c9                   	leave  
801081a2:	c3                   	ret    

801081a3 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801081a3:	55                   	push   %ebp
801081a4:	89 e5                	mov    %esp,%ebp
801081a6:	83 ec 28             	sub    $0x28,%esp
  uint i;

  if(pgdir == 0)
801081a9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801081ad:	75 0c                	jne    801081bb <freevm+0x18>
    panic("freevm: no pgdir");
801081af:	c7 04 24 d7 8a 10 80 	movl   $0x80108ad7,(%esp)
801081b6:	e8 7f 83 ff ff       	call   8010053a <panic>
  deallocuvm(pgdir, KERNBASE, 0);
801081bb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801081c2:	00 
801081c3:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
801081ca:	80 
801081cb:	8b 45 08             	mov    0x8(%ebp),%eax
801081ce:	89 04 24             	mov    %eax,(%esp)
801081d1:	e8 11 ff ff ff       	call   801080e7 <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
801081d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801081dd:	eb 3c                	jmp    8010821b <freevm+0x78>
    if(pgdir[i] & PTE_P){
801081df:	8b 45 f0             	mov    -0x10(%ebp),%eax
801081e2:	c1 e0 02             	shl    $0x2,%eax
801081e5:	03 45 08             	add    0x8(%ebp),%eax
801081e8:	8b 00                	mov    (%eax),%eax
801081ea:	83 e0 01             	and    $0x1,%eax
801081ed:	84 c0                	test   %al,%al
801081ef:	74 26                	je     80108217 <freevm+0x74>
      char * v = p2v(PTE_ADDR(pgdir[i]));
801081f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801081f4:	c1 e0 02             	shl    $0x2,%eax
801081f7:	03 45 08             	add    0x8(%ebp),%eax
801081fa:	8b 00                	mov    (%eax),%eax
801081fc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108201:	89 04 24             	mov    %eax,(%esp)
80108204:	e8 83 f4 ff ff       	call   8010768c <p2v>
80108209:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
8010820c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010820f:	89 04 24             	mov    %eax,(%esp)
80108212:	e8 5a a8 ff ff       	call   80102a71 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80108217:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
8010821b:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
80108222:	76 bb                	jbe    801081df <freevm+0x3c>
    if(pgdir[i] & PTE_P){
      char * v = p2v(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80108224:	8b 45 08             	mov    0x8(%ebp),%eax
80108227:	89 04 24             	mov    %eax,(%esp)
8010822a:	e8 42 a8 ff ff       	call   80102a71 <kfree>
}
8010822f:	c9                   	leave  
80108230:	c3                   	ret    

80108231 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80108231:	55                   	push   %ebp
80108232:	89 e5                	mov    %esp,%ebp
80108234:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80108237:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010823e:	00 
8010823f:	8b 45 0c             	mov    0xc(%ebp),%eax
80108242:	89 44 24 04          	mov    %eax,0x4(%esp)
80108246:	8b 45 08             	mov    0x8(%ebp),%eax
80108249:	89 04 24             	mov    %eax,(%esp)
8010824c:	e8 be f8 ff ff       	call   80107b0f <walkpgdir>
80108251:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pte == 0)
80108254:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108258:	75 0c                	jne    80108266 <clearpteu+0x35>
    panic("clearpteu");
8010825a:	c7 04 24 e8 8a 10 80 	movl   $0x80108ae8,(%esp)
80108261:	e8 d4 82 ff ff       	call   8010053a <panic>
  *pte &= ~PTE_U;
80108266:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108269:	8b 00                	mov    (%eax),%eax
8010826b:	89 c2                	mov    %eax,%edx
8010826d:	83 e2 fb             	and    $0xfffffffb,%edx
80108270:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108273:	89 10                	mov    %edx,(%eax)
}
80108275:	c9                   	leave  
80108276:	c3                   	ret    

80108277 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80108277:	55                   	push   %ebp
80108278:	89 e5                	mov    %esp,%ebp
8010827a:	53                   	push   %ebx
8010827b:	83 ec 44             	sub    $0x44,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
8010827e:	e8 b6 f9 ff ff       	call   80107c39 <setupkvm>
80108283:	89 45 e0             	mov    %eax,-0x20(%ebp)
80108286:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
8010828a:	75 0a                	jne    80108296 <copyuvm+0x1f>
    return 0;
8010828c:	b8 00 00 00 00       	mov    $0x0,%eax
80108291:	e9 fd 00 00 00       	jmp    80108393 <copyuvm+0x11c>
  for(i = 0; i < sz; i += PGSIZE){
80108296:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
8010829d:	e9 cc 00 00 00       	jmp    8010836e <copyuvm+0xf7>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801082a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801082a5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801082ac:	00 
801082ad:	89 44 24 04          	mov    %eax,0x4(%esp)
801082b1:	8b 45 08             	mov    0x8(%ebp),%eax
801082b4:	89 04 24             	mov    %eax,(%esp)
801082b7:	e8 53 f8 ff ff       	call   80107b0f <walkpgdir>
801082bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801082bf:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
801082c3:	75 0c                	jne    801082d1 <copyuvm+0x5a>
      panic("copyuvm: pte should exist");
801082c5:	c7 04 24 f2 8a 10 80 	movl   $0x80108af2,(%esp)
801082cc:	e8 69 82 ff ff       	call   8010053a <panic>
    if(!(*pte & PTE_P))
801082d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801082d4:	8b 00                	mov    (%eax),%eax
801082d6:	83 e0 01             	and    $0x1,%eax
801082d9:	85 c0                	test   %eax,%eax
801082db:	75 0c                	jne    801082e9 <copyuvm+0x72>
      panic("copyuvm: page not present");
801082dd:	c7 04 24 0c 8b 10 80 	movl   $0x80108b0c,(%esp)
801082e4:	e8 51 82 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
801082e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801082ec:	8b 00                	mov    (%eax),%eax
801082ee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801082f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    flags = PTE_FLAGS(*pte);
801082f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801082f9:	8b 00                	mov    (%eax),%eax
801082fb:	25 ff 0f 00 00       	and    $0xfff,%eax
80108300:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mem = kalloc()) == 0)
80108303:	e8 02 a8 ff ff       	call   80102b0a <kalloc>
80108308:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010830b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010830f:	74 6e                	je     8010837f <copyuvm+0x108>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
80108311:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108314:	89 04 24             	mov    %eax,(%esp)
80108317:	e8 70 f3 ff ff       	call   8010768c <p2v>
8010831c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108323:	00 
80108324:	89 44 24 04          	mov    %eax,0x4(%esp)
80108328:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010832b:	89 04 24             	mov    %eax,(%esp)
8010832e:	e8 42 ce ff ff       	call   80105175 <memmove>
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
80108333:	8b 5d f0             	mov    -0x10(%ebp),%ebx
80108336:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108339:	89 04 24             	mov    %eax,(%esp)
8010833c:	e8 3e f3 ff ff       	call   8010767f <v2p>
80108341:	8b 55 ec             	mov    -0x14(%ebp),%edx
80108344:	89 5c 24 10          	mov    %ebx,0x10(%esp)
80108348:	89 44 24 0c          	mov    %eax,0xc(%esp)
8010834c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108353:	00 
80108354:	89 54 24 04          	mov    %edx,0x4(%esp)
80108358:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010835b:	89 04 24             	mov    %eax,(%esp)
8010835e:	e8 42 f8 ff ff       	call   80107ba5 <mappages>
80108363:	85 c0                	test   %eax,%eax
80108365:	78 1b                	js     80108382 <copyuvm+0x10b>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80108367:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
8010836e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108371:	3b 45 0c             	cmp    0xc(%ebp),%eax
80108374:	0f 82 28 ff ff ff    	jb     801082a2 <copyuvm+0x2b>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
  }
  return d;
8010837a:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010837d:	eb 14                	jmp    80108393 <copyuvm+0x11c>
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
8010837f:	90                   	nop
80108380:	eb 01                	jmp    80108383 <copyuvm+0x10c>
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
80108382:	90                   	nop
  }
  return d;

bad:
  freevm(d);
80108383:	8b 45 e0             	mov    -0x20(%ebp),%eax
80108386:	89 04 24             	mov    %eax,(%esp)
80108389:	e8 15 fe ff ff       	call   801081a3 <freevm>
  return 0;
8010838e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80108393:	83 c4 44             	add    $0x44,%esp
80108396:	5b                   	pop    %ebx
80108397:	5d                   	pop    %ebp
80108398:	c3                   	ret    

80108399 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80108399:	55                   	push   %ebp
8010839a:	89 e5                	mov    %esp,%ebp
8010839c:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
8010839f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801083a6:	00 
801083a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801083aa:	89 44 24 04          	mov    %eax,0x4(%esp)
801083ae:	8b 45 08             	mov    0x8(%ebp),%eax
801083b1:	89 04 24             	mov    %eax,(%esp)
801083b4:	e8 56 f7 ff ff       	call   80107b0f <walkpgdir>
801083b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((*pte & PTE_P) == 0)
801083bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801083bf:	8b 00                	mov    (%eax),%eax
801083c1:	83 e0 01             	and    $0x1,%eax
801083c4:	85 c0                	test   %eax,%eax
801083c6:	75 07                	jne    801083cf <uva2ka+0x36>
    return 0;
801083c8:	b8 00 00 00 00       	mov    $0x0,%eax
801083cd:	eb 25                	jmp    801083f4 <uva2ka+0x5b>
  if((*pte & PTE_U) == 0)
801083cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801083d2:	8b 00                	mov    (%eax),%eax
801083d4:	83 e0 04             	and    $0x4,%eax
801083d7:	85 c0                	test   %eax,%eax
801083d9:	75 07                	jne    801083e2 <uva2ka+0x49>
    return 0;
801083db:	b8 00 00 00 00       	mov    $0x0,%eax
801083e0:	eb 12                	jmp    801083f4 <uva2ka+0x5b>
  return (char*)p2v(PTE_ADDR(*pte));
801083e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801083e5:	8b 00                	mov    (%eax),%eax
801083e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801083ec:	89 04 24             	mov    %eax,(%esp)
801083ef:	e8 98 f2 ff ff       	call   8010768c <p2v>
}
801083f4:	c9                   	leave  
801083f5:	c3                   	ret    

801083f6 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801083f6:	55                   	push   %ebp
801083f7:	89 e5                	mov    %esp,%ebp
801083f9:	83 ec 28             	sub    $0x28,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
801083fc:	8b 45 10             	mov    0x10(%ebp),%eax
801083ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
  while(len > 0){
80108402:	e9 8b 00 00 00       	jmp    80108492 <copyout+0x9c>
    va0 = (uint)PGROUNDDOWN(va);
80108407:	8b 45 0c             	mov    0xc(%ebp),%eax
8010840a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010840f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80108412:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108415:	89 44 24 04          	mov    %eax,0x4(%esp)
80108419:	8b 45 08             	mov    0x8(%ebp),%eax
8010841c:	89 04 24             	mov    %eax,(%esp)
8010841f:	e8 75 ff ff ff       	call   80108399 <uva2ka>
80108424:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pa0 == 0)
80108427:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010842b:	75 07                	jne    80108434 <copyout+0x3e>
      return -1;
8010842d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108432:	eb 6d                	jmp    801084a1 <copyout+0xab>
    n = PGSIZE - (va - va0);
80108434:	8b 45 0c             	mov    0xc(%ebp),%eax
80108437:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010843a:	89 d1                	mov    %edx,%ecx
8010843c:	29 c1                	sub    %eax,%ecx
8010843e:	89 c8                	mov    %ecx,%eax
80108440:	05 00 10 00 00       	add    $0x1000,%eax
80108445:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(n > len)
80108448:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010844b:	3b 45 14             	cmp    0x14(%ebp),%eax
8010844e:	76 06                	jbe    80108456 <copyout+0x60>
      n = len;
80108450:	8b 45 14             	mov    0x14(%ebp),%eax
80108453:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(pa0 + (va - va0), buf, n);
80108456:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108459:	8b 55 0c             	mov    0xc(%ebp),%edx
8010845c:	89 d1                	mov    %edx,%ecx
8010845e:	29 c1                	sub    %eax,%ecx
80108460:	89 c8                	mov    %ecx,%eax
80108462:	03 45 ec             	add    -0x14(%ebp),%eax
80108465:	8b 55 f0             	mov    -0x10(%ebp),%edx
80108468:	89 54 24 08          	mov    %edx,0x8(%esp)
8010846c:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010846f:	89 54 24 04          	mov    %edx,0x4(%esp)
80108473:	89 04 24             	mov    %eax,(%esp)
80108476:	e8 fa cc ff ff       	call   80105175 <memmove>
    len -= n;
8010847b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010847e:	29 45 14             	sub    %eax,0x14(%ebp)
    buf += n;
80108481:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108484:	01 45 e8             	add    %eax,-0x18(%ebp)
    va = va0 + PGSIZE;
80108487:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010848a:	05 00 10 00 00       	add    $0x1000,%eax
8010848f:	89 45 0c             	mov    %eax,0xc(%ebp)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80108492:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80108496:	0f 85 6b ff ff ff    	jne    80108407 <copyout+0x11>
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010849c:	b8 00 00 00 00       	mov    $0x0,%eax
}
801084a1:	c9                   	leave  
801084a2:	c3                   	ret    
