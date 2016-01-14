#ld: 
#name: PIC30 special operators in readonly section
#objects: /ld-pic30-coff/cert0750a.out /ld-pic30-coff/cert0750b.out
#objdump: -D -Msymbolic

.*cert0750\.o:     file format coff-pic30

Disassembly of section \.reset:

00000000 \<\.reset\>:
   0:	de 02 04    	goto      0x2de \<__reset\>
   2:	00 00 00 
Disassembly of section \.text:

00000100 \<\.handle\>:
 100:	16 05 04    	goto      0x516 \<text1_b\>
 102:	00 00 00 
 104:	16 06 04    	goto      0x616 \<text2_b\>
 106:	00 00 00 
 108:	18 06 04    	goto      0x618 \<text3_b\>
 10a:	00 00 00 
 10c:	1a 06 04    	goto      0x61a \<text4_b\>
 10e:	00 00 00 
 110:	1c 06 04    	goto      0x61c \<text5_b\>
 112:	00 00 00 
 114:	1e 06 04    	goto      0x61e \<text6_b\>
 116:	00 00 00 
 118:	20 06 04    	goto      0x620 \<text7_b\>
 11a:	00 00 00 
 11c:	22 06 04    	goto      0x622 \<text8_b\>
 11e:	00 00 00 
 120:	60 0a 04    	goto      0xa60 \<text9_b\>
 122:	00 00 00 
 124:	62 0a 04    	goto      0xa62 \<texta_b\>
 126:	00 00 00 
 128:	64 0a 04    	goto      0xa64 \<textb_b\>
 12a:	00 00 00 
 12c:	66 0a 04    	goto      0xa66 \<textc_b\>
 12e:	00 00 00 
 130:	68 0a 04    	goto      0xa68 \<textd_b\>
 132:	00 00 00 
 134:	6a 0a 04    	goto      0xa6a \<texte_b\>
 136:	00 00 00 
 138:	6c 0a 04    	goto      0xa6c \<textf_b\>
 13a:	00 00 00 
 13c:	46 2a 04    	goto      0x2a46 \<foo_x0_b\>
 13e:	00 00 00 
 140:	48 2a 04    	goto      0x2a48 \<foo_x1_b\>
 142:	00 00 00 
 144:	4a 2a 04    	goto      0x2a4a \<foo_x2_b\>
 146:	00 00 00 
 148:	4c 2a 04    	goto      0x2a4c \<foo_x3_b\>
 14a:	00 00 00 
 14c:	4e 2a 04    	goto      0x2a4e \<foo_x4_b\>
 14e:	00 00 00 
 150:	46 2b 04    	goto      0x2b46 \<foo_x5_b\>
 152:	00 00 00 
 154:	48 2b 04    	goto      0x2b48 \<foo_x6_b\>
 156:	00 00 00 
 158:	86 2f 04    	goto      0x2f86 \<foo_x7_b\>
 15a:	00 00 00 
 15c:	88 2f 04    	goto      0x2f88 \<foo_x8_b\>
 15e:	00 00 00 
 160:	8a 2f 04    	goto      0x2f8a \<foo_x9_b\>
 162:	00 00 00 
 164:	8c 2f 04    	goto      0x2f8c \<foo_xa_b\>
 166:	00 00 00 
 168:	d0 01 04    	goto      0x1d0 \<text1_a\>
 16a:	00 00 00 
 16c:	d0 02 04    	goto      0x2d0 \<text2_a\>
 16e:	00 00 00 
 170:	d2 02 04    	goto      0x2d2 \<text3_a\>
 172:	00 00 00 
 174:	d4 02 04    	goto      0x2d4 \<text4_a\>
 176:	00 00 00 
 178:	d6 02 04    	goto      0x2d6 \<text5_a\>
 17a:	00 00 00 
 17c:	d8 02 04    	goto      0x2d8 \<text6_a\>
 17e:	00 00 00 
 180:	da 02 04    	goto      0x2da \<text7_a\>
 182:	00 00 00 
 184:	dc 02 04    	goto      0x2dc \<text8_a\>
 186:	00 00 00 
 188:	08 05 04    	goto      0x508 \<text9_a\>
 18a:	00 00 00 
 18c:	0a 05 04    	goto      0x50a \<texta_a\>
 18e:	00 00 00 
 190:	0c 05 04    	goto      0x50c \<textb_a\>
 192:	00 00 00 
 194:	0e 05 04    	goto      0x50e \<textc_a\>
 196:	00 00 00 
 198:	10 05 04    	goto      0x510 \<textd_a\>
 19a:	00 00 00 
 19c:	12 05 04    	goto      0x512 \<texte_a\>
 19e:	00 00 00 
 1a0:	14 05 04    	goto      0x514 \<textf_a\>
 1a2:	00 00 00 
 1a4:	fe 24 04    	goto      0x24fe \<foo_x0_a\>
 1a6:	00 00 00 
 1a8:	00 25 04    	goto      0x2500 \<foo_x1_a\>
 1aa:	00 00 00 
 1ac:	02 25 04    	goto      0x2502 \<foo_x2_a\>
 1ae:	00 00 00 
 1b0:	04 25 04    	goto      0x2504 \<foo_x3_a\>
 1b2:	00 00 00 
 1b4:	06 25 04    	goto      0x2506 \<foo_x4_a\>
 1b6:	00 00 00 
 1b8:	fe 25 04    	goto      0x25fe \<foo_x5_a\>
 1ba:	00 00 00 
 1bc:	00 26 04    	goto      0x2600 \<foo_x6_a\>
 1be:	00 00 00 
 1c0:	3e 2a 04    	goto      0x2a3e \<foo_x7_a\>
 1c2:	00 00 00 
 1c4:	40 2a 04    	goto      0x2a40 \<foo_x8_a\>
 1c6:	00 00 00 
 1c8:	42 2a 04    	goto      0x2a42 \<foo_x9_a\>
 1ca:	00 00 00 
 1cc:	44 2a 04    	goto      0x2a44 \<foo_xa_a\>
 1ce:	00 00 00 

000001d0 \<text1_a\>:
 1d0:	01 00 00    	nop       
	\.\.\.

000002d0 \<text2_a\>:
 2d0:	02 00 00    	nop       

000002d2 \<text3_a\>:
 2d2:	03 00 00    	nop       

000002d4 \<text4_a\>:
 2d4:	04 00 00    	nop       

000002d6 \<text5_a\>:
 2d6:	05 00 00    	nop       

000002d8 \<text6_a\>:
 2d8:	06 00 00    	nop       

000002da \<text7_a\>:
 2da:	07 00 00    	nop       

000002dc \<text8_a\>:
 2dc:	08 00 00    	nop       

000002de \<__reset\>:
 2de:	ff ff 37    	bra       \.
 2e0:	16 05 00    	nop       
 2e2:	16 06 00    	nop       
 2e4:	18 06 00    	nop       
 2e6:	1a 06 00    	nop       
 2e8:	1c 06 00    	nop       
 2ea:	1e 06 00    	nop       
 2ec:	20 06 00    	nop       
 2ee:	22 06 00    	nop       
 2f0:	60 0a 00    	nop       
 2f2:	62 0a 00    	nop       
 2f4:	64 0a 00    	nop       
 2f6:	66 0a 00    	nop       
 2f8:	68 0a 00    	nop       
 2fa:	6a 0a 00    	nop       
 2fc:	6c 0a 00    	nop       
 2fe:	a8 1f 00    	nop       
 300:	a9 1f 00    	nop       
 302:	aa 1f 00    	nop       
 304:	ab 1f 00    	nop       
 306:	ac 1f 00    	nop       
 308:	a8 20 00    	nop       
 30a:	a9 20 00    	nop       
 30c:	aa 20 00    	nop       
 30e:	fb 24 00    	nop       
 310:	fc 24 00    	nop       
 312:	fd 24 00    	nop       
 314:	46 2a 00    	nop       
 316:	48 2a 00    	nop       
 318:	4a 2a 00    	nop       
 31a:	4c 2a 00    	nop       
 31c:	4e 2a 00    	nop       
 31e:	46 2b 00    	nop       
 320:	48 2b 00    	nop       
 322:	86 2f 00    	nop       
 324:	88 2f 00    	nop       
 326:	8a 2f 00    	nop       
 328:	8c 2f 00    	nop       
 32a:	f6 15 00    	nop       
 32c:	f7 15 00    	nop       
 32e:	f8 15 00    	nop       
 330:	f9 15 00    	nop       
 332:	fa 15 00    	nop       
 334:	fb 15 00    	nop       
 336:	fc 15 00    	nop       
 338:	fd 15 00    	nop       
 33a:	4e 1a 00    	nop       
 33c:	4f 1a 00    	nop       
 33e:	50 1a 00    	nop       
	\.\.\.
 400:	16 85 00    	nop       
 402:	16 86 00    	nop       
 404:	18 86 00    	nop       
 406:	1a 86 00    	nop       
 408:	1c 86 00    	nop       
 40a:	1e 86 00    	nop       
 40c:	20 86 00    	nop       
 40e:	22 86 00    	nop       
 410:	60 8a 00    	nop       
 412:	62 8a 00    	nop       
 414:	64 8a 00    	nop       
 416:	66 8a 00    	nop       
 418:	68 8a 00    	nop       
 41a:	6a 8a 00    	nop       
 41c:	6c 8a 00    	nop       
 41e:	a8 9f 00    	nop       
 420:	a9 9f 00    	nop       
 422:	aa 9f 00    	nop       
 424:	ab 9f 00    	nop       
 426:	ac 9f 00    	nop       
 428:	a8 a0 00    	nop       
 42a:	a9 a0 00    	nop       
 42c:	aa a0 00    	nop       
 42e:	fb a4 00    	nop       
 430:	fc a4 00    	nop       
 432:	fd a4 00    	nop       
 434:	46 aa 00    	nop       
 436:	48 aa 00    	nop       
 438:	4a aa 00    	nop       
 43a:	4c aa 00    	nop       
 43c:	4e aa 00    	nop       
 43e:	46 ab 00    	nop       
 440:	48 ab 00    	nop       
 442:	86 af 00    	nop       
 444:	88 af 00    	nop       
 446:	8a af 00    	nop       
 448:	8c af 00    	nop       
 44a:	f6 95 00    	nop       
 44c:	f7 95 00    	nop       
 44e:	f8 95 00    	nop       
 450:	f9 95 00    	nop       
 452:	fa 95 00    	nop       
 454:	fb 95 00    	nop       
 456:	fc 95 00    	nop       
 458:	fd 95 00    	nop       
 45a:	4e 9a 00    	nop       
 45c:	4f 9a 00    	nop       
 45e:	50 9a 00    	nop       
 460:	16 05 00    	nop       
 462:	16 06 00    	nop       
 464:	18 06 00    	nop       
 466:	1a 06 00    	nop       
 468:	1c 06 00    	nop       
 46a:	1e 06 00    	nop       
 46c:	20 06 00    	nop       
 46e:	22 06 00    	nop       
 470:	60 0a 00    	nop       
 472:	62 0a 00    	nop       
 474:	64 0a 00    	nop       
 476:	66 0a 00    	nop       
 478:	68 0a 00    	nop       
 47a:	6a 0a 00    	nop       
 47c:	6c 0a 00    	nop       
 47e:	a8 1f 00    	nop       
 480:	a9 1f 00    	nop       
 482:	aa 1f 00    	nop       
 484:	ab 1f 00    	nop       
 486:	ac 1f 00    	nop       
 488:	a8 20 00    	nop       
 48a:	a9 20 00    	nop       
 48c:	aa 20 00    	nop       
 48e:	fb 24 00    	nop       
 490:	fc 24 00    	nop       
 492:	fd 24 00    	nop       
 494:	46 2a 00    	nop       
 496:	48 2a 00    	nop       
 498:	4a 2a 00    	nop       
 49a:	4c 2a 00    	nop       
 49c:	4e 2a 00    	nop       
 49e:	46 2b 00    	nop       
 4a0:	48 2b 00    	nop       
 4a2:	86 2f 00    	nop       
 4a4:	88 2f 00    	nop       
 4a6:	8a 2f 00    	nop       
 4a8:	8c 2f 00    	nop       
 4aa:	f6 15 00    	nop       
 4ac:	f7 15 00    	nop       
 4ae:	f8 15 00    	nop       
 4b0:	f9 15 00    	nop       
 4b2:	fa 15 00    	nop       
 4b4:	fb 15 00    	nop       
 4b6:	fc 15 00    	nop       
 4b8:	fd 15 00    	nop       
 4ba:	4e 1a 00    	nop       
 4bc:	4f 1a 00    	nop       
 4be:	50 1a 00    	nop       
 4c0:	16 05 00    	nop       
 4c2:	16 06 00    	nop       
 4c4:	18 06 00    	nop       
 4c6:	1a 06 00    	nop       
 4c8:	1c 06 00    	nop       
 4ca:	1e 06 00    	nop       
 4cc:	20 06 00    	nop       
 4ce:	22 06 00    	nop       
 4d0:	60 0a 00    	nop       
 4d2:	62 0a 00    	nop       
 4d4:	64 0a 00    	nop       
 4d6:	66 0a 00    	nop       
 4d8:	68 0a 00    	nop       
 4da:	6a 0a 00    	nop       
 4dc:	6c 0a 00    	nop       
 4de:	46 2a 00    	nop       
 4e0:	48 2a 00    	nop       
 4e2:	4a 2a 00    	nop       
 4e4:	4c 2a 00    	nop       
 4e6:	4e 2a 00    	nop       
 4e8:	46 2b 00    	nop       
 4ea:	48 2b 00    	nop       
 4ec:	86 2f 00    	nop       
 4ee:	88 2f 00    	nop       
 4f0:	8a 2f 00    	nop       
 4f2:	8c 2f 00    	nop       
 4f4:	e0 96 20    	mov\.w     #0x96e \<\.sizeof\.\.text\>, w0
 4f6:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
 4f8:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
 4fa:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
 4fc:	80 8b 20    	mov\.w     #0x8b8 \<\.sizeof\.\.const\>, w0
 4fe:	00 10 20    	mov\.w     #0x100 \<\.handle\>, w0
 500:	00 80 20    	mov\.w     #0x800 \<data0_a\>, w0
 502:	20 a5 21    	mov\.w     #0x1a52 \<\.startof\.foo_r\>, w0
 504:	e0 4f 22    	mov\.w     #0x24fe \<foo_x0_a\>, w0
 506:	a0 19 21    	mov\.w     #0x119a \<\.startof\.\.const\>, w0

00000508 \<text9_a\>:
 508:	09 00 00    	nop       

0000050a \<texta_a\>:
 50a:	0a 00 00    	nop       

0000050c \<textb_a\>:
 50c:	0b 00 00    	nop       

0000050e \<textc_a\>:
 50e:	0c 00 00    	nop       

00000510 \<textd_a\>:
 510:	0d 00 00    	nop       

00000512 \<texte_a\>:
 512:	0e 00 00    	nop       

00000514 \<textf_a\>:
 514:	0f 00 00    	nop       

00000516 \<text1_b\>:
 516:	01 00 00    	nop       
	\.\.\.

00000616 \<text2_b\>:
 616:	02 00 00    	nop       

00000618 \<text3_b\>:
 618:	03 00 00    	nop       

0000061a \<text4_b\>:
 61a:	04 00 00    	nop       

0000061c \<text5_b\>:
 61c:	05 00 00    	nop       

0000061e \<text6_b\>:
 61e:	06 00 00    	nop       

00000620 \<text7_b\>:
 620:	07 00 00    	nop       

00000622 \<text8_b\>:
 622:	08 d0 00    	nop       
 624:	01 00 00    	nop       
 626:	00 d0 00    	nop       
 628:	02 00 00    	nop       
 62a:	00 d2 00    	nop       
 62c:	02 00 00    	nop       
 62e:	00 d4 00    	nop       
 630:	02 00 00    	nop       
 632:	00 d6 00    	nop       
 634:	02 00 00    	nop       
 636:	00 d8 00    	nop       
 638:	02 00 00    	nop       
 63a:	00 da 00    	nop       
 63c:	02 00 00    	nop       
 63e:	00 dc 00    	nop       
 640:	02 00 00    	nop       
 642:	00 08 00    	nop       
 644:	05 00 00    	nop       
 646:	00 0a 00    	nop       
 648:	05 00 00    	nop       
 64a:	00 0c 00    	nop       
 64c:	05 00 00    	nop       
 64e:	00 0e 00    	nop       
 650:	05 00 00    	nop       
 652:	00 10 00    	nop       
 654:	05 00 00    	nop       
 656:	00 12 00    	nop       
 658:	05 00 00    	nop       
 65a:	00 14 00    	nop       
 65c:	05 00 00    	nop       
 65e:	00 52 00    	nop       
 660:	1a 00 00    	nop       
 662:	00 53 00    	nop       
 664:	1a 00 00    	nop       
 666:	00 54 00    	nop       
 668:	1a 00 00    	nop       
 66a:	00 55 00    	nop       
 66c:	1a 00 00    	nop       
 66e:	00 56 00    	nop       
 670:	1a 00 00    	nop       
 672:	00 52 00    	nop       
 674:	1b 00 00    	nop       
 676:	00 53 00    	nop       
 678:	1b 00 00    	nop       
 67a:	00 54 00    	nop       
 67c:	1b 00 00    	nop       
 67e:	00 a5 00    	nop       
 680:	1f 00 00    	nop       
 682:	00 a6 00    	nop       
 684:	1f 00 00    	nop       
 686:	00 a7 00    	nop       
 688:	1f 00 00    	nop       
 68a:	00 fe 00    	nop       
 68c:	24 00 00    	nop       
 68e:	00 00 00    	nop       
 690:	25 00 00    	nop       
 692:	00 02 00    	nop       
 694:	25 00 00    	nop       
 696:	00 04 00    	nop       
 698:	25 00 00    	nop       
 69a:	00 06 00    	nop       
 69c:	25 00 00    	nop       
 69e:	00 fe 00    	nop       
 6a0:	25 00 00    	nop       
 6a2:	00 00 00    	nop       
 6a4:	26 00 00    	nop       
 6a6:	00 3e 00    	nop       
 6a8:	2a 00 00    	nop       
 6aa:	00 40 00    	nop       
 6ac:	2a 00 00    	nop       
 6ae:	00 42 00    	nop       
 6b0:	2a 00 00    	nop       
 6b2:	00 44 00    	nop       
 6b4:	2a 00 00    	nop       
 6b6:	00 9a 00    	nop       
 6b8:	11 00 00    	nop       
 6ba:	00 9b 00    	nop       
 6bc:	11 00 00    	nop       
 6be:	00 9c 00    	nop       
 6c0:	11 00 00    	nop       
 6c2:	00 9d 00    	nop       
 6c4:	11 00 00    	nop       
 6c6:	00 9e 00    	nop       
 6c8:	11 00 00    	nop       
 6ca:	00 9f 00    	nop       
 6cc:	11 00 00    	nop       
 6ce:	00 a0 00    	nop       
 6d0:	11 00 00    	nop       
 6d2:	00 a1 00    	nop       
 6d4:	11 00 00    	nop       
 6d6:	00 f2 00    	nop       
 6d8:	15 00 00    	nop       
 6da:	00 f3 00    	nop       
 6dc:	15 00 00    	nop       
 6de:	00 f4 00    	nop       
 6e0:	15 00 00    	nop       
	\.\.\.
 862:	00 d0 00    	nop       
 864:	81 00 00    	nop       
 866:	00 d0 00    	nop       
 868:	82 00 00    	nop       
 86a:	00 d2 00    	nop       
 86c:	82 00 00    	nop       
 86e:	00 d4 00    	nop       
 870:	82 00 00    	nop       
 872:	00 d6 00    	nop       
 874:	82 00 00    	nop       
 876:	00 d8 00    	nop       
 878:	82 00 00    	nop       
 87a:	00 da 00    	nop       
 87c:	82 00 00    	nop       
 87e:	00 dc 00    	nop       
 880:	82 00 00    	nop       
 882:	00 08 00    	nop       
 884:	85 00 00    	nop       
 886:	00 0a 00    	nop       
 888:	85 00 00    	nop       
 88a:	00 0c 00    	nop       
 88c:	85 00 00    	nop       
 88e:	00 0e 00    	nop       
 890:	85 00 00    	nop       
 892:	00 10 00    	nop       
 894:	85 00 00    	nop       
 896:	00 12 00    	nop       
 898:	85 00 00    	nop       
 89a:	00 14 00    	nop       
 89c:	85 00 00    	nop       
 89e:	00 52 00    	nop       
 8a0:	9a 00 00    	nop       
 8a2:	00 53 00    	nop       
 8a4:	9a 00 00    	nop       
 8a6:	00 54 00    	nop       
 8a8:	9a 00 00    	nop       
 8aa:	00 55 00    	nop       
 8ac:	9a 00 00    	nop       
 8ae:	00 56 00    	nop       
 8b0:	9a 00 00    	nop       
 8b2:	00 52 00    	nop       
 8b4:	9b 00 00    	nop       
 8b6:	00 53 00    	nop       
 8b8:	9b 00 00    	nop       
 8ba:	00 54 00    	nop       
 8bc:	9b 00 00    	nop       
 8be:	00 a5 00    	nop       
 8c0:	9f 00 00    	nop       
 8c2:	00 a6 00    	nop       
 8c4:	9f 00 00    	nop       
 8c6:	00 a7 00    	nop       
 8c8:	9f 00 00    	nop       
 8ca:	00 fe 00    	nop       
 8cc:	a4 00 00    	nop       
 8ce:	00 00 00    	nop       
 8d0:	a5 00 00    	nop       
 8d2:	00 02 00    	nop       
 8d4:	a5 00 00    	nop       
 8d6:	00 04 00    	nop       
 8d8:	a5 00 00    	nop       
 8da:	00 06 00    	nop       
 8dc:	a5 00 00    	nop       
 8de:	00 fe 00    	nop       
 8e0:	a5 00 00    	nop       
 8e2:	00 00 00    	nop       
 8e4:	a6 00 00    	nop       
 8e6:	00 3e 00    	nop       
 8e8:	aa 00 00    	nop       
 8ea:	00 40 00    	nop       
 8ec:	aa 00 00    	nop       
 8ee:	00 42 00    	nop       
 8f0:	aa 00 00    	nop       
 8f2:	00 44 00    	nop       
 8f4:	aa 00 00    	nop       
 8f6:	00 9a 00    	nop       
 8f8:	91 00 00    	nop       
 8fa:	00 9b 00    	nop       
 8fc:	91 00 00    	nop       
 8fe:	00 9c 00    	nop       
 900:	91 00 00    	nop       
 902:	00 9d 00    	nop       
 904:	91 00 00    	nop       
 906:	00 9e 00    	nop       
 908:	91 00 00    	nop       
 90a:	00 9f 00    	nop       
 90c:	91 00 00    	nop       
 90e:	00 a0 00    	nop       
 910:	91 00 00    	nop       
 912:	00 a1 00    	nop       
 914:	91 00 00    	nop       
 916:	00 f2 00    	nop       
 918:	95 00 00    	nop       
 91a:	00 f3 00    	nop       
 91c:	95 00 00    	nop       
 91e:	00 f4 00    	nop       
 920:	95 00 00    	nop       
 922:	00 d0 00    	nop       
 924:	01 00 00    	nop       
 926:	00 d0 00    	nop       
 928:	02 00 00    	nop       
 92a:	00 d2 00    	nop       
 92c:	02 00 00    	nop       
 92e:	00 d4 00    	nop       
 930:	02 00 00    	nop       
 932:	00 d6 00    	nop       
 934:	02 00 00    	nop       
 936:	00 d8 00    	nop       
 938:	02 00 00    	nop       
 93a:	00 da 00    	nop       
 93c:	02 00 00    	nop       
 93e:	00 dc 00    	nop       
 940:	02 00 00    	nop       
 942:	00 08 00    	nop       
 944:	05 00 00    	nop       
 946:	00 0a 00    	nop       
 948:	05 00 00    	nop       
 94a:	00 0c 00    	nop       
 94c:	05 00 00    	nop       
 94e:	00 0e 00    	nop       
 950:	05 00 00    	nop       
 952:	00 10 00    	nop       
 954:	05 00 00    	nop       
 956:	00 12 00    	nop       
 958:	05 00 00    	nop       
 95a:	00 14 00    	nop       
 95c:	05 00 00    	nop       
 95e:	00 52 00    	nop       
 960:	1a 00 00    	nop       
 962:	00 53 00    	nop       
 964:	1a 00 00    	nop       
 966:	00 54 00    	nop       
 968:	1a 00 00    	nop       
 96a:	00 55 00    	nop       
 96c:	1a 00 00    	nop       
 96e:	00 56 00    	nop       
 970:	1a 00 00    	nop       
 972:	00 52 00    	nop       
 974:	1b 00 00    	nop       
 976:	00 53 00    	nop       
 978:	1b 00 00    	nop       
 97a:	00 54 00    	nop       
 97c:	1b 00 00    	nop       
 97e:	00 a5 00    	nop       
 980:	1f 00 00    	nop       
 982:	00 a6 00    	nop       
 984:	1f 00 00    	nop       
 986:	00 a7 00    	nop       
 988:	1f 00 00    	nop       
 98a:	00 fe 00    	nop       
 98c:	24 00 00    	nop       
 98e:	00 00 00    	nop       
 990:	25 00 00    	nop       
 992:	00 02 00    	nop       
 994:	25 00 00    	nop       
 996:	00 04 00    	nop       
 998:	25 00 00    	nop       
 99a:	00 06 00    	nop       
 99c:	25 00 00    	nop       
 99e:	00 fe 00    	nop       
 9a0:	25 00 00    	nop       
 9a2:	00 00 00    	nop       
 9a4:	26 00 00    	nop       
 9a6:	00 3e 00    	nop       
 9a8:	2a 00 00    	nop       
 9aa:	00 40 00    	nop       
 9ac:	2a 00 00    	nop       
 9ae:	00 42 00    	nop       
 9b0:	2a 00 00    	nop       
 9b2:	00 44 00    	nop       
 9b4:	2a 00 00    	nop       
 9b6:	00 9a 00    	nop       
 9b8:	11 00 00    	nop       
 9ba:	00 9b 00    	nop       
 9bc:	11 00 00    	nop       
 9be:	00 9c 00    	nop       
 9c0:	11 00 00    	nop       
 9c2:	00 9d 00    	nop       
 9c4:	11 00 00    	nop       
 9c6:	00 9e 00    	nop       
 9c8:	11 00 00    	nop       
 9ca:	00 9f 00    	nop       
 9cc:	11 00 00    	nop       
 9ce:	00 a0 00    	nop       
 9d0:	11 00 00    	nop       
 9d2:	00 a1 00    	nop       
 9d4:	11 00 00    	nop       
 9d6:	00 f2 00    	nop       
 9d8:	15 00 00    	nop       
 9da:	00 f3 00    	nop       
 9dc:	15 00 00    	nop       
 9de:	00 f4 00    	nop       
 9e0:	15 00 00    	nop       
 9e2:	00 d0 00    	nop       
 9e4:	01 00 00    	nop       
 9e6:	00 d0 00    	nop       
 9e8:	02 00 00    	nop       
 9ea:	00 d2 00    	nop       
 9ec:	02 00 00    	nop       
 9ee:	00 d4 00    	nop       
 9f0:	02 00 00    	nop       
 9f2:	00 d6 00    	nop       
 9f4:	02 00 00    	nop       
 9f6:	00 d8 00    	nop       
 9f8:	02 00 00    	nop       
 9fa:	00 da 00    	nop       
 9fc:	02 00 00    	nop       
 9fe:	00 dc 00    	nop       
 a00:	02 00 00    	nop       
 a02:	00 08 00    	nop       
 a04:	05 00 00    	nop       
 a06:	00 0a 00    	nop       
 a08:	05 00 00    	nop       
 a0a:	00 0c 00    	nop       
 a0c:	05 00 00    	nop       
 a0e:	00 0e 00    	nop       
 a10:	05 00 00    	nop       
 a12:	00 10 00    	nop       
 a14:	05 00 00    	nop       
 a16:	00 12 00    	nop       
 a18:	05 00 00    	nop       
 a1a:	00 14 00    	nop       
 a1c:	05 00 00    	nop       
 a1e:	00 fe 00    	nop       
 a20:	24 00 00    	nop       
 a22:	00 00 00    	nop       
 a24:	25 00 00    	nop       
 a26:	00 02 00    	nop       
 a28:	25 00 00    	nop       
 a2a:	00 04 00    	nop       
 a2c:	25 00 00    	nop       
 a2e:	00 06 00    	nop       
 a30:	25 00 00    	nop       
 a32:	00 fe 00    	nop       
 a34:	25 00 00    	nop       
 a36:	00 00 00    	nop       
 a38:	26 00 00    	nop       
 a3a:	00 3e 00    	nop       
 a3c:	2a 00 00    	nop       
 a3e:	00 40 00    	nop       
 a40:	2a 00 00    	nop       
 a42:	00 42 00    	nop       
 a44:	2a 00 00    	nop       
 a46:	00 44 00    	nop       
 a48:	2a 00 00    	nop       
 a4a:	00 00 00    	nop       
 a4c:	e0 96 20    	mov\.w     #0x96e \<\.sizeof\.\.text\>, w0
 a4e:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
 a50:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
 a52:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
 a54:	80 8b 20    	mov\.w     #0x8b8 \<\.sizeof\.\.const\>, w0
 a56:	00 10 20    	mov\.w     #0x100 \<\.handle\>, w0
 a58:	00 80 20    	mov\.w     #0x800 \<data0_a\>, w0
 a5a:	20 a5 21    	mov\.w     #0x1a52 \<\.startof\.foo_r\>, w0
 a5c:	e0 4f 22    	mov\.w     #0x24fe \<foo_x0_a\>, w0
 a5e:	a0 19 21    	mov\.w     #0x119a \<\.startof\.\.const\>, w0

00000a60 \<text9_b\>:
 a60:	09 00 00    	nop       

00000a62 \<texta_b\>:
 a62:	0a 00 00    	nop       

00000a64 \<textb_b\>:
 a64:	0b 00 00    	nop       

00000a66 \<textc_b\>:
 a66:	0c 00 00    	nop       

00000a68 \<textd_b\>:
 a68:	0d 00 00    	nop       

00000a6a \<texte_b\>:
 a6a:	0e 00 00    	nop       

00000a6c \<textf_b\>:
 a6c:	0f 00 00    	nop       
Disassembly of section \.dinit:

00000a6e \<\.dinit\>:
     a6e:	00 08 00    	nop       
     a70:	ac 0a 00    	nop       
     a72:	02 00 00    	nop       
     a74:	10 11 12    	subr\.w    w4, \[w0\], \[w2--\]
     a76:	13 14 00    	nop       
	\.\.\.
     b1e:	00 15 16    	subr\.w    w12, w0, \[w10--\]
     b20:	17 16 05    	retlw\.w   #0x161, w7
     b22:	00 00 16    	subr\.w    w12, w0, w0
     b24:	06 00 00    	nop       
     b26:	18 06 00    	nop       
     b28:	00 1a 06    	\.pword 0x061a00
     b2a:	00 00 1c    	subbr\.w   w8, w0, w0
     b2c:	06 00 00    	nop       
     b2e:	1e 06 00    	nop       
     b30:	00 20 06    	\.pword 0x062000
     b32:	00 00 22    	mov\.w     #0x2000, w0
     b34:	06 00 00    	nop       
     b36:	60 0a 00    	nop       
     b38:	00 62 0a    	\.pword 0x0a6200
     b3a:	00 00 64    	and\.w     w8, w0, w0
     b3c:	0a 00 00    	nop       
     b3e:	66 0a 00    	nop       
     b40:	00 68 0a    	\.pword 0x0a6800
     b42:	00 00 6a    	xor\.w     w4, w0, w0
     b44:	0a 00 00    	nop       
     b46:	6c 0a 00    	nop       
     b48:	00 a8 1f    	subbr\.w   w15, w0, \[\+\+w0\]
     b4a:	00 00 a9    	bclr\.b    0x0 \<WREG0\>, #0x0 \<WREG0\>
     b4c:	1f 00 00    	nop       
     b4e:	aa 1f 00    	nop       
     b50:	00 ab 1f    	subbr\.w   w15, w0, \[\+\+w6\]
     b52:	00 00 ac    	btsts\.b   0x0 \<WREG0\>, #0x0 \<WREG0\>
     b54:	1f 00 00    	nop       
     b56:	a8 20 00    	nop       
     b58:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
     b5a:	00 00 aa    	btg\.b     0x0 \<WREG0\>, #0x0 \<WREG0\>
     b5c:	20 00 00    	nop       
     b5e:	fb 24 00    	nop       
     b60:	00 fc 24    	mov\.w     #0x4fc0, w0
     b62:	00 00 fd    	exch      w0, w0
     b64:	24 00 00    	nop       
     b66:	46 2a 00    	nop       
     b68:	00 48 2a    	mov\.w     #0xa480, w0
     b6a:	00 00 4a    	addc\.w    w4, w0, w0
     b6c:	2a 00 00    	nop       
     b6e:	4c 2a 00    	nop       
     b70:	00 4e 2a    	mov\.w     #0xa4e0, w0
     b72:	00 00 46    	add\.w     w12, w0, w0
     b74:	2b 00 00    	nop       
     b76:	48 2b 00    	nop       
     b78:	00 86 2f    	mov\.w     #0xf860, w0
     b7a:	00 00 88    	mov\.w     w0, 0x0
     b7c:	2f 00 00    	nop       
     b7e:	8a 2f 00    	nop       
     b80:	00 8c 2f    	mov\.w     #0xf8c0, w0
     b82:	00 00 f6    	\.pword 0xf60000
     b84:	15 00 00    	nop       
     b86:	f7 15 00    	nop       
     b88:	00 f8 15    	\.pword 0x15f800
     b8a:	00 00 f9    	pop       0x0 \<WREG0\>
     b8c:	15 00 00    	nop       
     b8e:	fa 15 00    	nop       
     b90:	00 fb 15    	\.pword 0x15fb00
     b92:	00 00 fc    	disi      #0x0 \<WREG0\>
     b94:	15 00 00    	nop       
     b96:	fd 15 00    	nop       
     b98:	00 4e 1a    	subbr\.b   w4, w0, \[w12\]
     b9a:	00 00 4f    	addc\.w    w14, w0, w0
     b9c:	1a 00 00    	nop       
     b9e:	50 1a 00    	nop       
	\.\.\.
     ca0:	00 16 85    	mov\.w     0xa2c0, w0
     ca2:	00 00 16    	subr\.w    w12, w0, w0
     ca4:	86 00 00    	nop       
     ca6:	18 86 00    	nop       
     ca8:	00 1a 86    	mov\.w     0xc340, w0
     caa:	00 00 1c    	subbr\.w   w8, w0, w0
     cac:	86 00 00    	nop       
     cae:	1e 86 00    	nop       
     cb0:	00 20 86    	mov\.w     0xc400, w0
     cb2:	00 00 22    	mov\.w     #0x2000, w0
     cb4:	86 00 00    	nop       
     cb6:	60 8a 00    	nop       
     cb8:	00 62 8a    	mov\.w     w0, 0x4c40
     cba:	00 00 64    	and\.w     w8, w0, w0
     cbc:	8a 00 00    	nop       
     cbe:	66 8a 00    	nop       
     cc0:	00 68 8a    	mov\.w     w0, 0x4d00
     cc2:	00 00 6a    	xor\.w     w4, w0, w0
     cc4:	8a 00 00    	nop       
     cc6:	6c 8a 00    	nop       
     cc8:	00 a8 9f    	mov\.w     w0, \[w0-48\]
     cca:	00 00 a9    	bclr\.b    0x0 \<WREG0\>, #0x0 \<WREG0\>
     ccc:	9f 00 00    	nop       
     cce:	aa 9f 00    	nop       
     cd0:	00 ab 9f    	mov\.w     w0, \[w6-48\]
     cd2:	00 00 ac    	btsts\.b   0x0 \<WREG0\>, #0x0 \<WREG0\>
     cd4:	9f 00 00    	nop       
     cd6:	a8 a0 00    	nop       
     cd8:	00 a9 a0    	\.pword 0xa0a900
     cda:	00 00 aa    	btg\.b     0x0 \<WREG0\>, #0x0 \<WREG0\>
     cdc:	a0 00 00    	nop       
     cde:	fb a4 00    	nop       
     ce0:	00 fc a4    	\.pword 0xa4fc00
     ce2:	00 00 fd    	exch      w0, w0
     ce4:	a4 00 00    	nop       
     ce6:	46 aa 00    	nop       
     ce8:	00 48 aa    	btg\.b     0x800 \<data0_a\>, #0x2 \<WREG1\>
     cea:	00 00 4a    	addc\.w    w4, w0, w0
     cec:	aa 00 00    	nop       
     cee:	4c aa 00    	nop       
     cf0:	00 4e aa    	btg\.b     0xe00, #0x2 \<WREG1\>
     cf2:	00 00 46    	add\.w     w12, w0, w0
     cf4:	ab 00 00    	nop       
     cf6:	48 ab 00    	nop       
     cf8:	00 86 af    	btsc\.b    0x600, #0x4 \<WREG2\>
     cfa:	00 00 88    	mov\.w     w0, 0x0
     cfc:	af 00 00    	nop       
     cfe:	8a af 00    	nop       
     d00:	00 8c af    	btsc\.b    0xc00, #0x4 \<WREG2\>
     d02:	00 00 f6    	\.pword 0xf60000
     d04:	95 00 00    	nop       
     d06:	f7 95 00    	nop       
     d08:	00 f8 95    	mov\.b     \[w0-264\], w0
     d0a:	00 00 f9    	pop       0x0 \<WREG0\>
     d0c:	95 00 00    	nop       
     d0e:	fa 95 00    	nop       
     d10:	00 fb 95    	mov\.b     \[w0-264\], w6
     d12:	00 00 fc    	disi      #0x0 \<WREG0\>
     d14:	95 00 00    	nop       
     d16:	fd 95 00    	nop       
     d18:	00 4e 9a    	mov\.b     w0, \[w12\+264\]
     d1a:	00 00 4f    	addc\.w    w14, w0, w0
     d1c:	9a 00 00    	nop       
     d1e:	50 9a 00    	nop       
     d20:	00 16 05    	retlw\.w   #0x160, w0
     d22:	00 00 16    	subr\.w    w12, w0, w0
     d24:	06 00 00    	nop       
     d26:	18 06 00    	nop       
     d28:	00 1a 06    	\.pword 0x061a00
     d2a:	00 00 1c    	subbr\.w   w8, w0, w0
     d2c:	06 00 00    	nop       
     d2e:	1e 06 00    	nop       
     d30:	00 20 06    	\.pword 0x062000
     d32:	00 00 22    	mov\.w     #0x2000, w0
     d34:	06 00 00    	nop       
     d36:	60 0a 00    	nop       
     d38:	00 62 0a    	\.pword 0x0a6200
     d3a:	00 00 64    	and\.w     w8, w0, w0
     d3c:	0a 00 00    	nop       
     d3e:	66 0a 00    	nop       
     d40:	00 68 0a    	\.pword 0x0a6800
     d42:	00 00 6a    	xor\.w     w4, w0, w0
     d44:	0a 00 00    	nop       
     d46:	6c 0a 00    	nop       
     d48:	00 a8 1f    	subbr\.w   w15, w0, \[\+\+w0\]
     d4a:	00 00 a9    	bclr\.b    0x0 \<WREG0\>, #0x0 \<WREG0\>
     d4c:	1f 00 00    	nop       
     d4e:	aa 1f 00    	nop       
     d50:	00 ab 1f    	subbr\.w   w15, w0, \[\+\+w6\]
     d52:	00 00 ac    	btsts\.b   0x0 \<WREG0\>, #0x0 \<WREG0\>
     d54:	1f 00 00    	nop       
     d56:	a8 20 00    	nop       
     d58:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
     d5a:	00 00 aa    	btg\.b     0x0 \<WREG0\>, #0x0 \<WREG0\>
     d5c:	20 00 00    	nop       
     d5e:	fb 24 00    	nop       
     d60:	00 fc 24    	mov\.w     #0x4fc0, w0
     d62:	00 00 fd    	exch      w0, w0
     d64:	24 00 00    	nop       
     d66:	46 2a 00    	nop       
     d68:	00 48 2a    	mov\.w     #0xa480, w0
     d6a:	00 00 4a    	addc\.w    w4, w0, w0
     d6c:	2a 00 00    	nop       
     d6e:	4c 2a 00    	nop       
     d70:	00 4e 2a    	mov\.w     #0xa4e0, w0
     d72:	00 00 46    	add\.w     w12, w0, w0
     d74:	2b 00 00    	nop       
     d76:	48 2b 00    	nop       
     d78:	00 86 2f    	mov\.w     #0xf860, w0
     d7a:	00 00 88    	mov\.w     w0, 0x0
     d7c:	2f 00 00    	nop       
     d7e:	8a 2f 00    	nop       
     d80:	00 8c 2f    	mov\.w     #0xf8c0, w0
     d82:	00 00 f6    	\.pword 0xf60000
     d84:	15 00 00    	nop       
     d86:	f7 15 00    	nop       
     d88:	00 f8 15    	\.pword 0x15f800
     d8a:	00 00 f9    	pop       0x0 \<WREG0\>
     d8c:	15 00 00    	nop       
     d8e:	fa 15 00    	nop       
     d90:	00 fb 15    	\.pword 0x15fb00
     d92:	00 00 fc    	disi      #0x0 \<WREG0\>
     d94:	15 00 00    	nop       
     d96:	fd 15 00    	nop       
     d98:	00 4e 1a    	subbr\.b   w4, w0, \[w12\]
     d9a:	00 00 4f    	addc\.w    w14, w0, w0
     d9c:	1a 00 00    	nop       
     d9e:	50 1a 00    	nop       
     da0:	00 16 05    	retlw\.w   #0x160, w0
     da2:	00 00 16    	subr\.w    w12, w0, w0
     da4:	06 00 00    	nop       
     da6:	18 06 00    	nop       
     da8:	00 1a 06    	\.pword 0x061a00
     daa:	00 00 1c    	subbr\.w   w8, w0, w0
     dac:	06 00 00    	nop       
     dae:	1e 06 00    	nop       
     db0:	00 20 06    	\.pword 0x062000
     db2:	00 00 22    	mov\.w     #0x2000, w0
     db4:	06 00 00    	nop       
     db6:	60 0a 00    	nop       
     db8:	00 62 0a    	\.pword 0x0a6200
     dba:	00 00 64    	and\.w     w8, w0, w0
     dbc:	0a 00 00    	nop       
     dbe:	66 0a 00    	nop       
     dc0:	00 68 0a    	\.pword 0x0a6800
     dc2:	00 00 6a    	xor\.w     w4, w0, w0
     dc4:	0a 00 00    	nop       
     dc6:	6c 0a 00    	nop       
     dc8:	00 46 2a    	mov\.w     #0xa460, w0
     dca:	00 00 48    	addc\.w    w0, w0, w0
     dcc:	2a 00 00    	nop       
     dce:	4a 2a 00    	nop       
     dd0:	00 4c 2a    	mov\.w     #0xa4c0, w0
     dd2:	00 00 4e    	addc\.w    w12, w0, w0
     dd4:	2a 00 00    	nop       
     dd6:	46 2b 00    	nop       
     dd8:	00 48 2b    	mov\.w     #0xb480, w0
     dda:	00 00 86    	mov\.w     0xc000, w0
     ddc:	2f 00 00    	nop       
     dde:	88 2f 00    	nop       
     de0:	00 8a 2f    	mov\.w     #0xf8a0, w0
     de2:	00 00 8c    	mov\.w     w0, 0x8000
     de4:	2f 00 00    	nop       
     de6:	6e 09 00    	nop       
     de8:	00 ac 0a    	\.pword 0x0aac00
     dea:	00 00 ac    	btsts\.b   0x0 \<WREG0\>, #0x0 \<WREG0\>
     dec:	0a 00 00    	nop       
     dee:	90 0a 00    	nop       
     df0:	00 b8 08    	do        w0, \. \+ 0x2
     df2:	00 00 00 
     df4:	01 00 00    	nop       
     df6:	00 08 00    	nop       
     df8:	00 52 1a    	subbr\.b   w4, w0, \[w4--\]
     dfa:	00 00 fe    	reset     
     dfc:	24 00 00    	nop       
     dfe:	9a 11 00    	nop       
     e00:	00 18 19    	subbr\.w   w2, w0, \[w0\+\+\]
     e02:	1a 10 11    	subr\.w    w2, \[w10\], \[w0--\]
     e04:	12 13 14    	subr\.w    w8, \[w2\], \[w6--\]
	\.\.\.
     eac:	00 00 15    	subr\.w    w10, w0, w0
     eae:	16 17 d0    	sl\.w      \[w6\], \[w14--\]
     eb0:	01 00 00    	nop       
     eb2:	d0 02 00    	nop       
     eb4:	00 d2 02    	call      0xd200 \<foo_ra_b\+0x2d03\>
     eb6:	00 00 d4 
     eb8:	02 00 00    	nop       
     eba:	d6 02 00    	nop       
     ebc:	00 d8 02    	call      0xd800 \<foo_ra_b\+0x3303\>
     ebe:	00 00 da 
     ec0:	02 00 00    	nop       
     ec2:	dc 02 00    	nop       
     ec4:	00 08 05    	retlw\.w   #0x80, w0
     ec6:	00 00 0a    	\.pword 0x0a0000
     ec8:	05 00 00    	nop       
     eca:	0c 05 00    	nop       
     ecc:	00 0e 05    	retlw\.w   #0xe0, w0
     ece:	00 00 10    	subr\.w    w0, w0, w0
     ed0:	05 00 00    	nop       
     ed2:	12 05 00    	nop       
     ed4:	00 14 05    	retlw\.w   #0x140, w0
     ed6:	00 00 52    	sub\.w     w4, w0, w0
     ed8:	1a 00 00    	nop       
     eda:	53 1a 00    	nop       
     edc:	00 54 1a    	subbr\.b   w4, w0, \[w8--\]
     ede:	00 00 55    	sub\.w     w10, w0, w0
     ee0:	1a 00 00    	nop       
     ee2:	56 1a 00    	nop       
     ee4:	00 52 1b    	subbr\.b   w6, w0, \[w4--\]
     ee6:	00 00 53    	sub\.w     w6, w0, w0
     ee8:	1b 00 00    	nop       
     eea:	54 1b 00    	nop       
     eec:	00 a5 1f    	subbr\.w   w15, w0, \[--w10\]
     eee:	00 00 a6    	btss\.w    w0, #0x0 \<WREG0\>
     ef0:	1f 00 00    	nop       
     ef2:	a7 1f 00    	nop       
     ef4:	00 fe 24    	mov\.w     #0x4fe0, w0
     ef6:	00 00 00    	nop       
     ef8:	25 00 00    	nop       
     efa:	02 25 00    	nop       
     efc:	00 04 25    	mov\.w     #0x5040, w0
     efe:	00 00 06    	return    
     f00:	25 00 00    	nop       
     f02:	fe 25 00    	nop       
     f04:	00 00 26    	mov\.w     #0x6000, w0
     f06:	00 00 3e    	bra       GTU, \. \+ 0x2
     f08:	2a 00 00    	nop       
     f0a:	40 2a 00    	nop       
     f0c:	00 42 2a    	mov\.w     #0xa420, w0
     f0e:	00 00 44    	add\.w     w8, w0, w0
     f10:	2a 00 00    	nop       
     f12:	9a 11 00    	nop       
     f14:	00 9b 11    	subr\.w    w3, w0, \[w6\+\+\]
     f16:	00 00 9c    	mov\.w     w0, \[w0-1024\]
     f18:	11 00 00    	nop       
     f1a:	9d 11 00    	nop       
     f1c:	00 9e 11    	subr\.w    w3, w0, \[w12\+\+\]
     f1e:	00 00 9f    	mov\.w     w0, \[w0-256\]
     f20:	11 00 00    	nop       
     f22:	a0 11 00    	nop       
     f24:	00 a1 11    	subr\.w    w3, w0, \[--w2\]
     f26:	00 00 f2    	mac       w6 \* w6, A, \[w8\], w4, \[w10\], w4
     f28:	15 00 00    	nop       
     f2a:	f3 15 00    	nop       
     f2c:	00 f4 15    	\.pword 0x15f400
	\.\.\.
    102e:	00 00 d0    	sl\.w      w0, w0
    1030:	81 00 00    	nop       
    1032:	d0 82 00    	nop       
    1034:	00 d2 82    	mov\.w     0x5a40, w0
    1036:	00 00 d4    	sl\.w      0x0 \<WREG0\>, WREG
    1038:	82 00 00    	nop       
    103a:	d6 82 00    	nop       
    103c:	00 d8 82    	mov\.w     0x5b00, w0
    103e:	00 00 da    	\.pword 0xda0000
    1040:	82 00 00    	nop       
    1042:	dc 82 00    	nop       
    1044:	00 08 85    	mov\.w     0xa100, w0
    1046:	00 00 0a    	\.pword 0x0a0000
    1048:	85 00 00    	nop       
    104a:	0c 85 00    	nop       
    104c:	00 0e 85    	mov\.w     0xa1c0, w0
    104e:	00 00 10    	subr\.w    w0, w0, w0
    1050:	85 00 00    	nop       
    1052:	12 85 00    	nop       
    1054:	00 14 85    	mov\.w     0xa280, w0
    1056:	00 00 52    	sub\.w     w4, w0, w0
    1058:	9a 00 00    	nop       
    105a:	53 9a 00    	nop       
    105c:	00 54 9a    	mov\.b     w0, \[w8\+272\]
    105e:	00 00 55    	sub\.w     w10, w0, w0
    1060:	9a 00 00    	nop       
    1062:	56 9a 00    	nop       
    1064:	00 52 9b    	mov\.b     w0, \[w4\+400\]
    1066:	00 00 53    	sub\.w     w6, w0, w0
    1068:	9b 00 00    	nop       
    106a:	54 9b 00    	nop       
    106c:	00 a5 9f    	mov\.w     w0, \[w10-64\]
    106e:	00 00 a6    	btss\.w    w0, #0x0 \<WREG0\>
    1070:	9f 00 00    	nop       
    1072:	a7 9f 00    	nop       
    1074:	00 fe a4    	\.pword 0xa4fe00
    1076:	00 00 00    	nop       
    1078:	a5 00 00    	nop       
    107a:	02 a5 00    	nop       
    107c:	00 04 a5    	\.pword 0xa50400
    107e:	00 00 06    	return    
    1080:	a5 00 00    	nop       
    1082:	fe a5 00    	nop       
    1084:	00 00 a6    	btss\.w    w0, #0x0 \<WREG0\>
    1086:	00 00 3e    	bra       GTU, \. \+ 0x2
    1088:	aa 00 00    	nop       
    108a:	40 aa 00    	nop       
    108c:	00 42 aa    	btg\.b     0x200, #0x2 \<WREG1\>
    108e:	00 00 44    	add\.w     w8, w0, w0
    1090:	aa 00 00    	nop       
    1092:	9a 91 00    	nop       
    1094:	00 9b 91    	mov\.w     \[w0\+432\], w6
    1096:	00 00 9c    	mov\.w     w0, \[w0-1024\]
    1098:	91 00 00    	nop       
    109a:	9d 91 00    	nop       
    109c:	00 9e 91    	mov\.w     \[w0\+432\], w12
    109e:	00 00 9f    	mov\.w     w0, \[w0-256\]
    10a0:	91 00 00    	nop       
    10a2:	a0 91 00    	nop       
    10a4:	00 a1 91    	mov\.w     \[w0\+448\], w2
    10a6:	00 00 f2    	mac       w6 \* w6, A, \[w8\], w4, \[w10\], w4
    10a8:	95 00 00    	nop       
    10aa:	f3 95 00    	nop       
    10ac:	00 f4 95    	mov\.b     \[w0-272\], w8
    10ae:	00 00 d0    	sl\.w      w0, w0
    10b0:	01 00 00    	nop       
    10b2:	d0 02 00    	nop       
    10b4:	00 d2 02    	call      0xd200 \<foo_ra_b\+0x2d03\>
    10b6:	00 00 d4 
    10b8:	02 00 00    	nop       
    10ba:	d6 02 00    	nop       
    10bc:	00 d8 02    	call      0xd800 \<foo_ra_b\+0x3303\>
    10be:	00 00 da 
    10c0:	02 00 00    	nop       
    10c2:	dc 02 00    	nop       
    10c4:	00 08 05    	retlw\.w   #0x80, w0
    10c6:	00 00 0a    	\.pword 0x0a0000
    10c8:	05 00 00    	nop       
    10ca:	0c 05 00    	nop       
    10cc:	00 0e 05    	retlw\.w   #0xe0, w0
    10ce:	00 00 10    	subr\.w    w0, w0, w0
    10d0:	05 00 00    	nop       
    10d2:	12 05 00    	nop       
    10d4:	00 14 05    	retlw\.w   #0x140, w0
    10d6:	00 00 52    	sub\.w     w4, w0, w0
    10d8:	1a 00 00    	nop       
    10da:	53 1a 00    	nop       
    10dc:	00 54 1a    	subbr\.b   w4, w0, \[w8--\]
    10de:	00 00 55    	sub\.w     w10, w0, w0
    10e0:	1a 00 00    	nop       
    10e2:	56 1a 00    	nop       
    10e4:	00 52 1b    	subbr\.b   w6, w0, \[w4--\]
    10e6:	00 00 53    	sub\.w     w6, w0, w0
    10e8:	1b 00 00    	nop       
    10ea:	54 1b 00    	nop       
    10ec:	00 a5 1f    	subbr\.w   w15, w0, \[--w10\]
    10ee:	00 00 a6    	btss\.w    w0, #0x0 \<WREG0\>
    10f0:	1f 00 00    	nop       
    10f2:	a7 1f 00    	nop       
    10f4:	00 fe 24    	mov\.w     #0x4fe0, w0
    10f6:	00 00 00    	nop       
    10f8:	25 00 00    	nop       
    10fa:	02 25 00    	nop       
    10fc:	00 04 25    	mov\.w     #0x5040, w0
    10fe:	00 00 06    	return    
    1100:	25 00 00    	nop       
    1102:	fe 25 00    	nop       
    1104:	00 00 26    	mov\.w     #0x6000, w0
    1106:	00 00 3e    	bra       GTU, \. \+ 0x2
    1108:	2a 00 00    	nop       
    110a:	40 2a 00    	nop       
    110c:	00 42 2a    	mov\.w     #0xa420, w0
    110e:	00 00 44    	add\.w     w8, w0, w0
    1110:	2a 00 00    	nop       
    1112:	9a 11 00    	nop       
    1114:	00 9b 11    	subr\.w    w3, w0, \[w6\+\+\]
    1116:	00 00 9c    	mov\.w     w0, \[w0-1024\]
    1118:	11 00 00    	nop       
    111a:	9d 11 00    	nop       
    111c:	00 9e 11    	subr\.w    w3, w0, \[w12\+\+\]
    111e:	00 00 9f    	mov\.w     w0, \[w0-256\]
    1120:	11 00 00    	nop       
    1122:	a0 11 00    	nop       
    1124:	00 a1 11    	subr\.w    w3, w0, \[--w2\]
    1126:	00 00 f2    	mac       w6 \* w6, A, \[w8\], w4, \[w10\], w4
    1128:	15 00 00    	nop       
    112a:	f3 15 00    	nop       
    112c:	00 f4 15    	\.pword 0x15f400
    112e:	00 00 d0    	sl\.w      w0, w0
    1130:	01 00 00    	nop       
    1132:	d0 02 00    	nop       
    1134:	00 d2 02    	call      0xd200 \<foo_ra_b\+0x2d03\>
    1136:	00 00 d4 
    1138:	02 00 00    	nop       
    113a:	d6 02 00    	nop       
    113c:	00 d8 02    	call      0xd800 \<foo_ra_b\+0x3303\>
    113e:	00 00 da 
    1140:	02 00 00    	nop       
    1142:	dc 02 00    	nop       
    1144:	00 08 05    	retlw\.w   #0x80, w0
    1146:	00 00 0a    	\.pword 0x0a0000
    1148:	05 00 00    	nop       
    114a:	0c 05 00    	nop       
    114c:	00 0e 05    	retlw\.w   #0xe0, w0
    114e:	00 00 10    	subr\.w    w0, w0, w0
    1150:	05 00 00    	nop       
    1152:	12 05 00    	nop       
    1154:	00 14 05    	retlw\.w   #0x140, w0
    1156:	00 00 fe    	reset     
    1158:	24 00 00    	nop       
    115a:	00 25 00    	nop       
    115c:	00 02 25    	mov\.w     #0x5020, w0
    115e:	00 00 04    	goto      0x250000 \<foo_ra_b\+0x245b03\>
    1160:	25 00 00 
    1162:	06 25 00    	nop       
    1164:	00 fe 25    	mov\.w     #0x5fe0, w0
    1166:	00 00 00    	nop       
    1168:	26 00 00    	nop       
    116a:	3e 2a 00    	nop       
    116c:	00 40 2a    	mov\.w     #0xa400, w0
    116e:	00 00 42    	add\.w     w4, w0, w0
    1170:	2a 00 00    	nop       
    1172:	44 2a 00    	nop       
    1174:	00 6e 09    	\.pword 0x096e00
    1176:	00 00 ac    	btsts\.b   0x0 \<WREG0\>, #0x0 \<WREG0\>
    1178:	0a 00 00    	nop       
    117a:	ac 0a 00    	nop       
    117c:	00 90 0a    	\.pword 0x0a9000
    117e:	00 00 b8    	mul\.uu    w0, w0, w0
    1180:	08 00 00    	nop       
    1182:	00 01 00    	nop       
    1184:	00 00 08    	do        #0x0 \<WREG0\>, \. \+ 0x2
    1186:	00 00 52 
    1188:	1a 00 00    	nop       
    118a:	fe 24 00    	nop       
    118c:	00 9a 11    	subr\.w    w3, w0, \[w4\+\+\]
    118e:	00 00 18    	subbr\.w   w0, w0, w0
    1190:	19 1a 00    	nop       
    1192:	ac 12 00    	nop       
    1194:	ac 0a 00    	nop       
	\.\.\.
Disassembly of section \.const:

0000919a \<const0_a\>:
    919a:	60 61       	\.word 0x6160

0000919b \<const1_a\>:
	\.\.\.

0000919c \<const2_a\>:
    919c:	62 63       	\.word 0x6362

0000919d \<const3_a\>:
	\.\.\.

0000919e \<const4_a\>:
    919e:	64 65       	\.word 0x6564

0000919f \<const5_a\>:
	\.\.\.

000091a0 \<const6_a\>:
    91a0:	66 67       	\.word 0x6766

000091a1 \<const7_a\>:
    91a1:	00 00       	\.word 0
    91a3:	00 00       	\.word 0
    91a5:	00 00       	\.word 0
    91a7:	00 00       	\.word 0
    91a9:	00 00       	\.word 0
    91ab:	00 00       	\.word 0
    91ad:	00 00       	\.word 0
    91af:	00 00       	\.word 0
    91b1:	00 00       	\.word 0
    91b3:	00 00       	\.word 0
    91b5:	00 00       	\.word 0
    91b7:	00 00       	\.word 0
    91b9:	00 00       	\.word 0
    91bb:	00 00       	\.word 0
    91bd:	00 00       	\.word 0
    91bf:	00 00       	\.word 0
    91c1:	00 00       	\.word 0
    91c3:	00 00       	\.word 0
    91c5:	00 00       	\.word 0
    91c7:	00 00       	\.word 0
    91c9:	00 00       	\.word 0
    91cb:	00 00       	\.word 0
    91cd:	00 00       	\.word 0
    91cf:	00 00       	\.word 0
    91d1:	00 00       	\.word 0
    91d3:	00 00       	\.word 0
    91d5:	00 00       	\.word 0
    91d7:	00 00       	\.word 0
    91d9:	00 00       	\.word 0
    91db:	00 00       	\.word 0
    91dd:	00 00       	\.word 0
    91df:	00 00       	\.word 0
    91e1:	00 00       	\.word 0
    91e3:	00 00       	\.word 0
    91e5:	00 00       	\.word 0
    91e7:	00 00       	\.word 0
    91e9:	00 00       	\.word 0
    91eb:	00 00       	\.word 0
    91ed:	00 00       	\.word 0
    91ef:	00 00       	\.word 0
    91f1:	00 00       	\.word 0
    91f3:	00 00       	\.word 0
    91f5:	00 00       	\.word 0
    91f7:	00 00       	\.word 0
    91f9:	00 00       	\.word 0
    91fb:	00 00       	\.word 0
    91fd:	00 00       	\.word 0
    91ff:	00 00       	\.word 0
    9201:	00 00       	\.word 0
    9203:	00 00       	\.word 0
    9205:	00 00       	\.word 0
    9207:	00 00       	\.word 0
    9209:	00 00       	\.word 0
    920b:	00 00       	\.word 0
    920d:	00 00       	\.word 0
    920f:	00 00       	\.word 0
    9211:	00 00       	\.word 0
    9213:	00 00       	\.word 0
    9215:	00 00       	\.word 0
    9217:	00 00       	\.word 0
    9219:	00 00       	\.word 0
    921b:	00 00       	\.word 0
    921d:	00 00       	\.word 0
    921f:	00 00       	\.word 0
    9221:	00 00       	\.word 0
    9223:	00 00       	\.word 0
    9225:	00 00       	\.word 0
    9227:	00 00       	\.word 0
    9229:	00 00       	\.word 0
    922b:	00 00       	\.word 0
    922d:	00 00       	\.word 0
    922f:	00 00       	\.word 0
    9231:	00 00       	\.word 0
    9233:	00 00       	\.word 0
    9235:	00 00       	\.word 0
    9237:	00 00       	\.word 0
    9239:	00 00       	\.word 0
    923b:	00 00       	\.word 0
    923d:	00 00       	\.word 0
    923f:	00 00       	\.word 0
    9241:	00 00       	\.word 0
    9243:	00 00       	\.word 0
    9245:	00 00       	\.word 0
    9247:	00 00       	\.word 0
    9249:	00 00       	\.word 0
    924b:	00 00       	\.word 0
    924d:	00 00       	\.word 0
    924f:	00 00       	\.word 0
    9251:	00 00       	\.word 0
    9253:	00 00       	\.word 0
    9255:	00 00       	\.word 0
    9257:	00 00       	\.word 0
    9259:	00 00       	\.word 0
    925b:	00 00       	\.word 0
    925d:	00 00       	\.word 0
	\.\.\.
    93e1:	00 00       	\.word 0
    93e3:	00 00       	\.word 0
    93e5:	00 00       	\.word 0
    93e7:	00 00       	\.word 0
    93e9:	00 00       	\.word 0
    93eb:	00 00       	\.word 0
    93ed:	00 00       	\.word 0
    93ef:	00 00       	\.word 0
    93f1:	00 00       	\.word 0
    93f3:	00 00       	\.word 0
    93f5:	00 00       	\.word 0
    93f7:	00 00       	\.word 0
    93f9:	00 00       	\.word 0
    93fb:	00 00       	\.word 0
    93fd:	00 00       	\.word 0
    93ff:	00 00       	\.word 0
    9401:	00 00       	\.word 0
    9403:	00 00       	\.word 0
    9405:	00 00       	\.word 0
    9407:	00 00       	\.word 0
    9409:	00 00       	\.word 0
    940b:	00 00       	\.word 0
    940d:	00 00       	\.word 0
    940f:	00 00       	\.word 0
    9411:	00 00       	\.word 0
    9413:	00 00       	\.word 0
    9415:	00 00       	\.word 0
    9417:	00 00       	\.word 0
    9419:	00 00       	\.word 0
    941b:	00 00       	\.word 0
    941d:	00 00       	\.word 0
    941f:	00 00       	\.word 0
    9421:	00 00       	\.word 0
    9423:	00 00       	\.word 0
    9425:	00 00       	\.word 0
    9427:	00 00       	\.word 0
    9429:	00 00       	\.word 0
    942b:	00 00       	\.word 0
    942d:	00 00       	\.word 0
    942f:	00 00       	\.word 0
    9431:	00 00       	\.word 0
    9433:	00 00       	\.word 0
    9435:	00 00       	\.word 0
    9437:	00 00       	\.word 0
    9439:	00 00       	\.word 0
    943b:	00 00       	\.word 0
    943d:	00 00       	\.word 0
    943f:	00 00       	\.word 0
    9441:	00 00       	\.word 0
    9443:	00 00       	\.word 0
    9445:	00 00       	\.word 0
    9447:	00 00       	\.word 0
    9449:	00 00       	\.word 0
    944b:	00 00       	\.word 0
    944d:	00 00       	\.word 0
    944f:	00 00       	\.word 0
    9451:	00 00       	\.word 0
    9453:	00 00       	\.word 0
    9455:	00 00       	\.word 0
    9457:	00 00       	\.word 0
    9459:	00 00       	\.word 0
    945b:	00 00       	\.word 0
    945d:	00 00       	\.word 0
    945f:	00 00       	\.word 0
    9461:	00 00       	\.word 0
    9463:	00 00       	\.word 0
    9465:	00 00       	\.word 0
    9467:	00 00       	\.word 0
    9469:	00 00       	\.word 0
    946b:	00 00       	\.word 0
    946d:	00 00       	\.word 0
    946f:	00 00       	\.word 0
    9471:	00 00       	\.word 0
    9473:	00 00       	\.word 0
    9475:	00 00       	\.word 0
    9477:	00 00       	\.word 0
    9479:	00 00       	\.word 0
    947b:	00 00       	\.word 0
    947d:	00 00       	\.word 0
    947f:	00 00       	\.word 0
    9481:	00 00       	\.word 0
    9483:	00 00       	\.word 0
    9485:	00 00       	\.word 0
    9487:	00 00       	\.word 0
    9489:	00 00       	\.word 0
    948b:	00 00       	\.word 0
    948d:	00 00       	\.word 0
    948f:	00 00       	\.word 0
    9491:	00 00       	\.word 0
    9493:	00 00       	\.word 0
    9495:	00 00       	\.word 0
    9497:	00 00       	\.word 0
    9499:	00 00       	\.word 0
    949b:	00 00       	\.word 0
    949d:	00 00       	\.word 0
    949f:	00 00       	\.word 0
    94a1:	00 00       	\.word 0
    94a3:	00 00       	\.word 0
    94a5:	00 00       	\.word 0
    94a7:	00 00       	\.word 0
    94a9:	00 00       	\.word 0
    94ab:	00 00       	\.word 0
    94ad:	00 00       	\.word 0
    94af:	00 00       	\.word 0
    94b1:	00 00       	\.word 0
    94b3:	00 00       	\.word 0
    94b5:	00 00       	\.word 0
    94b7:	00 00       	\.word 0
    94b9:	00 00       	\.word 0
    94bb:	00 00       	\.word 0
    94bd:	00 00       	\.word 0
    94bf:	00 00       	\.word 0
    94c1:	00 00       	\.word 0
    94c3:	00 00       	\.word 0
    94c5:	00 00       	\.word 0
    94c7:	00 00       	\.word 0
    94c9:	00 00       	\.word 0
    94cb:	00 00       	\.word 0
    94cd:	00 00       	\.word 0
    94cf:	00 00       	\.word 0
    94d1:	00 00       	\.word 0
    94d3:	00 00       	\.word 0
    94d5:	00 00       	\.word 0
    94d7:	00 00       	\.word 0
    94d9:	00 00       	\.word 0
    94db:	00 00       	\.word 0
    94dd:	00 00       	\.word 0
    94df:	00 00       	\.word 0
    94e1:	00 00       	\.word 0
    94e3:	00 00       	\.word 0
    94e5:	00 00       	\.word 0
    94e7:	00 00       	\.word 0
    94e9:	00 00       	\.word 0
    94eb:	00 00       	\.word 0
    94ed:	00 00       	\.word 0
    94ef:	00 00       	\.word 0
    94f1:	00 00       	\.word 0
    94f3:	00 00       	\.word 0
    94f5:	00 00       	\.word 0
    94f7:	00 00       	\.word 0
    94f9:	00 00       	\.word 0
    94fb:	00 00       	\.word 0
    94fd:	00 00       	\.word 0
    94ff:	00 00       	\.word 0
    9501:	00 00       	\.word 0
    9503:	00 00       	\.word 0
    9505:	00 00       	\.word 0
    9507:	00 00       	\.word 0
    9509:	00 00       	\.word 0
    950b:	00 00       	\.word 0
    950d:	00 00       	\.word 0
    950f:	00 00       	\.word 0
    9511:	00 00       	\.word 0
    9513:	00 00       	\.word 0
    9515:	00 00       	\.word 0
    9517:	00 00       	\.word 0
    9519:	00 00       	\.word 0
    951b:	00 00       	\.word 0
    951d:	00 00       	\.word 0
    951f:	00 00       	\.word 0
    9521:	00 00       	\.word 0
    9523:	00 00       	\.word 0
    9525:	00 00       	\.word 0
    9527:	00 00       	\.word 0
    9529:	00 00       	\.word 0
    952b:	00 00       	\.word 0
    952d:	00 00       	\.word 0
    952f:	00 00       	\.word 0
    9531:	00 00       	\.word 0
    9533:	00 00       	\.word 0
    9535:	00 00       	\.word 0
    9537:	00 00       	\.word 0
    9539:	00 00       	\.word 0
    953b:	00 00       	\.word 0
    953d:	00 00       	\.word 0
    953f:	00 00       	\.word 0
    9541:	00 00       	\.word 0
    9543:	00 00       	\.word 0
    9545:	00 00       	\.word 0
    9547:	00 00       	\.word 0
    9549:	00 00       	\.word 0
    954b:	00 00       	\.word 0
    954d:	00 00       	\.word 0
    954f:	00 00       	\.word 0
    9551:	00 00       	\.word 0
    9553:	00 00       	\.word 0
    9555:	00 00       	\.word 0
    9557:	00 00       	\.word 0
    9559:	00 00       	\.word 0
    955b:	00 00       	\.word 0
    955d:	00 00       	\.word 0
    955f:	00 00       	\.word 0
    9561:	00 00       	\.word 0
    9563:	00 00       	\.word 0
    9565:	00 00       	\.word 0
    9567:	00 00       	\.word 0
    9569:	00 00       	\.word 0
    956b:	00 00       	\.word 0
    956d:	00 00       	\.word 0
    956f:	00 00       	\.word 0
    9571:	00 00       	\.word 0
    9573:	00 00       	\.word 0
    9575:	00 00       	\.word 0
    9577:	00 00       	\.word 0
    9579:	00 00       	\.word 0
    957b:	00 00       	\.word 0
    957d:	00 00       	\.word 0
    957f:	00 00       	\.word 0
    9581:	00 00       	\.word 0
    9583:	00 00       	\.word 0
    9585:	00 00       	\.word 0
    9587:	00 00       	\.word 0
    9589:	00 00       	\.word 0
    958b:	00 00       	\.word 0
    958d:	00 00       	\.word 0
    958f:	00 00       	\.word 0
    9591:	00 00       	\.word 0
    9593:	00 00       	\.word 0
    9595:	00 00       	\.word 0
    9597:	00 00       	\.word 0
    9599:	00 00       	\.word 0
    959b:	00 00       	\.word 0
    959d:	00 00       	\.word 0
    959f:	00 00       	\.word 0
    95a1:	00 00       	\.word 0
    95a3:	00 00       	\.word 0
    95a5:	00 00       	\.word 0
    95a7:	00 00       	\.word 0
    95a9:	00 00       	\.word 0
    95ab:	00 00       	\.word 0
    95ad:	00 00       	\.word 0
    95af:	00 00       	\.word 0
    95b1:	00 00       	\.word 0
    95b3:	00 00       	\.word 0
    95b5:	00 00       	\.word 0
    95b7:	00 00       	\.word 0
    95b9:	00 00       	\.word 0
    95bb:	00 00       	\.word 0
    95bd:	00 00       	\.word 0
    95bf:	00 00       	\.word 0
    95c1:	00 00       	\.word 0
    95c3:	00 00       	\.word 0
    95c5:	00 00       	\.word 0
    95c7:	00 00       	\.word 0
    95c9:	00 00       	\.word 0
    95cb:	00 00       	\.word 0
    95cd:	00 00       	\.word 0
    95cf:	00 00       	\.word 0
    95d1:	00 00       	\.word 0
    95d3:	00 00       	\.word 0
    95d5:	00 00       	\.word 0
    95d7:	00 00       	\.word 0
    95d9:	00 00       	\.word 0
    95db:	00 00       	\.word 0
    95dd:	00 00       	\.word 0
    95df:	00 00       	\.word 0
    95e1:	00 00       	\.word 0
    95e3:	00 00       	\.word 0
    95e5:	00 00       	\.word 0
    95e7:	00 00       	\.word 0
    95e9:	00 00       	\.word 0
    95eb:	00 00       	\.word 0
    95ed:	00 00       	\.word 0
    95ef:	00 00       	\.word 0
	\.\.\.

000095f2 \<const8_a\>:
    95f2:	68 69       	\.word 0x6968

000095f3 \<const9_a\>:
	\.\.\.

000095f4 \<consta_a\>:
    95f4:	6a 00       	\.word 0x6a

000095f6 \<const0_b\>:
    95f6:	60 61       	\.word 0x6160

000095f7 \<const1_b\>:
	\.\.\.

000095f8 \<const2_b\>:
    95f8:	62 63       	\.word 0x6362

000095f9 \<const3_b\>:
	\.\.\.

000095fa \<const4_b\>:
    95fa:	64 65       	\.word 0x6564

000095fb \<const5_b\>:
	\.\.\.

000095fc \<const6_b\>:
    95fc:	66 67       	\.word 0x6766

000095fd \<const7_b\>:
    95fd:	00 00       	\.word 0
    95ff:	00 00       	\.word 0
    9601:	00 00       	\.word 0
    9603:	00 00       	\.word 0
    9605:	00 00       	\.word 0
    9607:	00 00       	\.word 0
    9609:	00 00       	\.word 0
    960b:	00 00       	\.word 0
    960d:	00 00       	\.word 0
    960f:	00 00       	\.word 0
    9611:	00 00       	\.word 0
    9613:	00 00       	\.word 0
    9615:	00 00       	\.word 0
    9617:	00 00       	\.word 0
    9619:	00 00       	\.word 0
    961b:	00 00       	\.word 0
    961d:	00 00       	\.word 0
    961f:	00 00       	\.word 0
    9621:	00 00       	\.word 0
    9623:	00 00       	\.word 0
    9625:	00 00       	\.word 0
    9627:	00 00       	\.word 0
    9629:	00 00       	\.word 0
    962b:	00 00       	\.word 0
    962d:	00 00       	\.word 0
    962f:	00 00       	\.word 0
    9631:	00 00       	\.word 0
    9633:	00 00       	\.word 0
    9635:	00 00       	\.word 0
    9637:	00 00       	\.word 0
    9639:	00 00       	\.word 0
    963b:	00 00       	\.word 0
    963d:	00 00       	\.word 0
    963f:	00 00       	\.word 0
    9641:	00 00       	\.word 0
    9643:	00 00       	\.word 0
    9645:	00 00       	\.word 0
    9647:	00 00       	\.word 0
    9649:	00 00       	\.word 0
    964b:	00 00       	\.word 0
    964d:	00 00       	\.word 0
    964f:	00 00       	\.word 0
    9651:	00 00       	\.word 0
    9653:	00 00       	\.word 0
    9655:	00 00       	\.word 0
    9657:	00 00       	\.word 0
    9659:	00 00       	\.word 0
    965b:	00 00       	\.word 0
    965d:	00 00       	\.word 0
    965f:	00 00       	\.word 0
    9661:	00 00       	\.word 0
    9663:	00 00       	\.word 0
    9665:	00 00       	\.word 0
    9667:	00 00       	\.word 0
    9669:	00 00       	\.word 0
    966b:	00 00       	\.word 0
    966d:	00 00       	\.word 0
    966f:	00 00       	\.word 0
    9671:	00 00       	\.word 0
    9673:	00 00       	\.word 0
    9675:	00 00       	\.word 0
    9677:	00 00       	\.word 0
    9679:	00 00       	\.word 0
    967b:	00 00       	\.word 0
    967d:	00 00       	\.word 0
    967f:	00 00       	\.word 0
    9681:	00 00       	\.word 0
    9683:	00 00       	\.word 0
    9685:	00 00       	\.word 0
    9687:	00 00       	\.word 0
    9689:	00 00       	\.word 0
    968b:	00 00       	\.word 0
    968d:	00 00       	\.word 0
    968f:	00 00       	\.word 0
    9691:	00 00       	\.word 0
    9693:	00 00       	\.word 0
    9695:	00 00       	\.word 0
    9697:	00 00       	\.word 0
    9699:	00 00       	\.word 0
    969b:	00 00       	\.word 0
    969d:	00 00       	\.word 0
    969f:	00 00       	\.word 0
    96a1:	00 00       	\.word 0
    96a3:	00 00       	\.word 0
    96a5:	00 00       	\.word 0
    96a7:	00 00       	\.word 0
    96a9:	00 00       	\.word 0
    96ab:	00 00       	\.word 0
    96ad:	00 00       	\.word 0
    96af:	00 00       	\.word 0
    96b1:	00 00       	\.word 0
    96b3:	00 00       	\.word 0
    96b5:	00 00       	\.word 0
    96b7:	00 00       	\.word 0
    96b9:	00 00       	\.word 0
	\.\.\.
    983d:	00 00       	\.word 0
    983f:	00 00       	\.word 0
    9841:	00 00       	\.word 0
    9843:	00 00       	\.word 0
    9845:	00 00       	\.word 0
    9847:	00 00       	\.word 0
    9849:	00 00       	\.word 0
    984b:	00 00       	\.word 0
    984d:	00 00       	\.word 0
    984f:	00 00       	\.word 0
    9851:	00 00       	\.word 0
    9853:	00 00       	\.word 0
    9855:	00 00       	\.word 0
    9857:	00 00       	\.word 0
    9859:	00 00       	\.word 0
    985b:	00 00       	\.word 0
    985d:	00 00       	\.word 0
    985f:	00 00       	\.word 0
    9861:	00 00       	\.word 0
    9863:	00 00       	\.word 0
    9865:	00 00       	\.word 0
    9867:	00 00       	\.word 0
    9869:	00 00       	\.word 0
    986b:	00 00       	\.word 0
    986d:	00 00       	\.word 0
    986f:	00 00       	\.word 0
    9871:	00 00       	\.word 0
    9873:	00 00       	\.word 0
    9875:	00 00       	\.word 0
    9877:	00 00       	\.word 0
    9879:	00 00       	\.word 0
    987b:	00 00       	\.word 0
    987d:	00 00       	\.word 0
    987f:	00 00       	\.word 0
    9881:	00 00       	\.word 0
    9883:	00 00       	\.word 0
    9885:	00 00       	\.word 0
    9887:	00 00       	\.word 0
    9889:	00 00       	\.word 0
    988b:	00 00       	\.word 0
    988d:	00 00       	\.word 0
    988f:	00 00       	\.word 0
    9891:	00 00       	\.word 0
    9893:	00 00       	\.word 0
    9895:	00 00       	\.word 0
    9897:	00 00       	\.word 0
    9899:	00 00       	\.word 0
    989b:	00 00       	\.word 0
    989d:	00 00       	\.word 0
    989f:	00 00       	\.word 0
    98a1:	00 00       	\.word 0
    98a3:	00 00       	\.word 0
    98a5:	00 00       	\.word 0
    98a7:	00 00       	\.word 0
    98a9:	00 00       	\.word 0
    98ab:	00 00       	\.word 0
    98ad:	00 00       	\.word 0
    98af:	00 00       	\.word 0
    98b1:	00 00       	\.word 0
    98b3:	00 00       	\.word 0
    98b5:	00 00       	\.word 0
    98b7:	00 00       	\.word 0
    98b9:	00 00       	\.word 0
    98bb:	00 00       	\.word 0
    98bd:	00 00       	\.word 0
    98bf:	00 00       	\.word 0
    98c1:	00 00       	\.word 0
    98c3:	00 00       	\.word 0
    98c5:	00 00       	\.word 0
    98c7:	00 00       	\.word 0
    98c9:	00 00       	\.word 0
    98cb:	00 00       	\.word 0
    98cd:	00 00       	\.word 0
    98cf:	00 00       	\.word 0
    98d1:	00 00       	\.word 0
    98d3:	00 00       	\.word 0
    98d5:	00 00       	\.word 0
    98d7:	00 00       	\.word 0
    98d9:	00 00       	\.word 0
    98db:	00 00       	\.word 0
    98dd:	00 00       	\.word 0
    98df:	00 00       	\.word 0
    98e1:	00 00       	\.word 0
    98e3:	00 00       	\.word 0
    98e5:	00 00       	\.word 0
    98e7:	00 00       	\.word 0
    98e9:	00 00       	\.word 0
    98eb:	00 00       	\.word 0
    98ed:	00 00       	\.word 0
    98ef:	00 00       	\.word 0
    98f1:	00 00       	\.word 0
    98f3:	00 00       	\.word 0
    98f5:	00 00       	\.word 0
    98f7:	00 00       	\.word 0
    98f9:	00 00       	\.word 0
    98fb:	00 00       	\.word 0
    98fd:	00 00       	\.word 0
    98ff:	00 00       	\.word 0
    9901:	00 00       	\.word 0
    9903:	00 00       	\.word 0
    9905:	00 00       	\.word 0
    9907:	00 00       	\.word 0
    9909:	00 00       	\.word 0
    990b:	00 00       	\.word 0
    990d:	00 00       	\.word 0
    990f:	00 00       	\.word 0
    9911:	00 00       	\.word 0
    9913:	00 00       	\.word 0
    9915:	00 00       	\.word 0
    9917:	00 00       	\.word 0
    9919:	00 00       	\.word 0
    991b:	00 00       	\.word 0
    991d:	00 00       	\.word 0
    991f:	00 00       	\.word 0
    9921:	00 00       	\.word 0
    9923:	00 00       	\.word 0
    9925:	00 00       	\.word 0
    9927:	00 00       	\.word 0
    9929:	00 00       	\.word 0
    992b:	00 00       	\.word 0
    992d:	00 00       	\.word 0
    992f:	00 00       	\.word 0
    9931:	00 00       	\.word 0
    9933:	00 00       	\.word 0
    9935:	00 00       	\.word 0
    9937:	00 00       	\.word 0
    9939:	00 00       	\.word 0
    993b:	00 00       	\.word 0
    993d:	00 00       	\.word 0
    993f:	00 00       	\.word 0
    9941:	00 00       	\.word 0
    9943:	00 00       	\.word 0
    9945:	00 00       	\.word 0
    9947:	00 00       	\.word 0
    9949:	00 00       	\.word 0
    994b:	00 00       	\.word 0
    994d:	00 00       	\.word 0
    994f:	00 00       	\.word 0
    9951:	00 00       	\.word 0
    9953:	00 00       	\.word 0
    9955:	00 00       	\.word 0
    9957:	00 00       	\.word 0
    9959:	00 00       	\.word 0
    995b:	00 00       	\.word 0
    995d:	00 00       	\.word 0
    995f:	00 00       	\.word 0
    9961:	00 00       	\.word 0
    9963:	00 00       	\.word 0
    9965:	00 00       	\.word 0
    9967:	00 00       	\.word 0
    9969:	00 00       	\.word 0
    996b:	00 00       	\.word 0
    996d:	00 00       	\.word 0
    996f:	00 00       	\.word 0
    9971:	00 00       	\.word 0
    9973:	00 00       	\.word 0
    9975:	00 00       	\.word 0
    9977:	00 00       	\.word 0
    9979:	00 00       	\.word 0
    997b:	00 00       	\.word 0
    997d:	00 00       	\.word 0
    997f:	00 00       	\.word 0
    9981:	00 00       	\.word 0
    9983:	00 00       	\.word 0
    9985:	00 00       	\.word 0
    9987:	00 00       	\.word 0
    9989:	00 00       	\.word 0
    998b:	00 00       	\.word 0
    998d:	00 00       	\.word 0
    998f:	00 00       	\.word 0
    9991:	00 00       	\.word 0
    9993:	00 00       	\.word 0
    9995:	00 00       	\.word 0
    9997:	00 00       	\.word 0
    9999:	00 00       	\.word 0
    999b:	00 00       	\.word 0
    999d:	00 00       	\.word 0
    999f:	00 00       	\.word 0
    99a1:	00 00       	\.word 0
    99a3:	00 00       	\.word 0
    99a5:	00 00       	\.word 0
    99a7:	00 00       	\.word 0
    99a9:	00 00       	\.word 0
    99ab:	00 00       	\.word 0
    99ad:	00 00       	\.word 0
    99af:	00 00       	\.word 0
    99b1:	00 00       	\.word 0
    99b3:	00 00       	\.word 0
    99b5:	00 00       	\.word 0
    99b7:	00 00       	\.word 0
    99b9:	00 00       	\.word 0
    99bb:	00 00       	\.word 0
    99bd:	00 00       	\.word 0
    99bf:	00 00       	\.word 0
    99c1:	00 00       	\.word 0
    99c3:	00 00       	\.word 0
    99c5:	00 00       	\.word 0
    99c7:	00 00       	\.word 0
    99c9:	00 00       	\.word 0
    99cb:	00 00       	\.word 0
    99cd:	00 00       	\.word 0
    99cf:	00 00       	\.word 0
    99d1:	00 00       	\.word 0
    99d3:	00 00       	\.word 0
    99d5:	00 00       	\.word 0
    99d7:	00 00       	\.word 0
    99d9:	00 00       	\.word 0
    99db:	00 00       	\.word 0
    99dd:	00 00       	\.word 0
    99df:	00 00       	\.word 0
    99e1:	00 00       	\.word 0
    99e3:	00 00       	\.word 0
    99e5:	00 00       	\.word 0
    99e7:	00 00       	\.word 0
    99e9:	00 00       	\.word 0
    99eb:	00 00       	\.word 0
    99ed:	00 00       	\.word 0
    99ef:	00 00       	\.word 0
    99f1:	00 00       	\.word 0
    99f3:	00 00       	\.word 0
    99f5:	00 00       	\.word 0
    99f7:	00 00       	\.word 0
    99f9:	00 00       	\.word 0
    99fb:	00 00       	\.word 0
    99fd:	00 00       	\.word 0
    99ff:	00 00       	\.word 0
    9a01:	00 00       	\.word 0
    9a03:	00 00       	\.word 0
    9a05:	00 00       	\.word 0
    9a07:	00 00       	\.word 0
    9a09:	00 00       	\.word 0
    9a0b:	00 00       	\.word 0
    9a0d:	00 00       	\.word 0
    9a0f:	00 00       	\.word 0
    9a11:	00 00       	\.word 0
    9a13:	00 00       	\.word 0
    9a15:	00 00       	\.word 0
    9a17:	00 00       	\.word 0
    9a19:	00 00       	\.word 0
    9a1b:	00 00       	\.word 0
    9a1d:	00 00       	\.word 0
    9a1f:	00 00       	\.word 0
    9a21:	00 00       	\.word 0
    9a23:	00 00       	\.word 0
    9a25:	00 00       	\.word 0
    9a27:	00 00       	\.word 0
    9a29:	00 00       	\.word 0
    9a2b:	00 00       	\.word 0
    9a2d:	00 00       	\.word 0
    9a2f:	00 00       	\.word 0
    9a31:	00 00       	\.word 0
    9a33:	00 00       	\.word 0
    9a35:	00 00       	\.word 0
    9a37:	00 00       	\.word 0
    9a39:	00 00       	\.word 0
    9a3b:	00 00       	\.word 0
    9a3d:	00 00       	\.word 0
    9a3f:	00 00       	\.word 0
    9a41:	00 00       	\.word 0
    9a43:	00 00       	\.word 0
    9a45:	00 00       	\.word 0
    9a47:	00 00       	\.word 0
    9a49:	00 00       	\.word 0
    9a4b:	00 00       	\.word 0
	\.\.\.

00009a4e \<const8_b\>:
    9a4e:	68 69       	\.word 0x6968

00009a4f \<const9_b\>:
	\.\.\.

00009a50 \<consta_b\>:
    9a50:	6a 00       	\.word 0x6a
Disassembly of section \.ivt:

00000004 \<\.ivt\>:
	\.\.\.
Disassembly of section \.aivt:

00000084 \<\.aivt\>:
	\.\.\.
Disassembly of section foo_r:

00009a52 \<foo_r0_a\>:
    9a52:	20 21       	\.word 0x2120

00009a53 \<foo_r1_a\>:
	\.\.\.

00009a54 \<foo_r2_a\>:
    9a54:	22 23       	\.word 0x2322

00009a55 \<foo_r3_a\>:
	\.\.\.

00009a56 \<foo_r4_a\>:
    9a56:	24 00       	\.word 0x24
	\.\.\.

00009b52 \<foo_r5_a\>:
    9b52:	25 26       	\.word 0x2625

00009b53 \<foo_r6_a\>:
	\.\.\.

00009b54 \<foo_r7_a\>:
    9b54:	27 16       	\.word 0x1627
    9b56:	05 00       	\.word 0x5
    9b58:	00 16       	\.word 0x1600
    9b5a:	06 00       	\.word 0x6
    9b5c:	00 18       	\.word 0x1800
    9b5e:	06 00       	\.word 0x6
    9b60:	00 1a       	\.word 0x1a00
    9b62:	06 00       	\.word 0x6
    9b64:	00 1c       	\.word 0x1c00
    9b66:	06 00       	\.word 0x6
    9b68:	00 1e       	\.word 0x1e00
    9b6a:	06 00       	\.word 0x6
    9b6c:	00 20       	\.word 0x2000
    9b6e:	06 00       	\.word 0x6
    9b70:	00 22       	\.word 0x2200
    9b72:	06 00       	\.word 0x6
    9b74:	00 60       	\.word 0x6000
    9b76:	0a 00       	\.word 0xa
    9b78:	00 62       	\.word 0x6200
    9b7a:	0a 00       	\.word 0xa
    9b7c:	00 64       	\.word 0x6400
    9b7e:	0a 00       	\.word 0xa
    9b80:	00 66       	\.word 0x6600
    9b82:	0a 00       	\.word 0xa
    9b84:	00 68       	\.word 0x6800
    9b86:	0a 00       	\.word 0xa
    9b88:	00 6a       	\.word 0x6a00
    9b8a:	0a 00       	\.word 0xa
    9b8c:	00 6c       	\.word 0x6c00
    9b8e:	0a 00       	\.word 0xa
    9b90:	00 a8       	\.word 0xa800
    9b92:	1f 00       	\.word 0x1f
    9b94:	00 a9       	\.word 0xa900
    9b96:	1f 00       	\.word 0x1f
    9b98:	00 aa       	\.word 0xaa00
    9b9a:	1f 00       	\.word 0x1f
    9b9c:	00 ab       	\.word 0xab00
    9b9e:	1f 00       	\.word 0x1f
    9ba0:	00 ac       	\.word 0xac00
    9ba2:	1f 00       	\.word 0x1f
    9ba4:	00 a8       	\.word 0xa800
    9ba6:	20 00       	\.word 0x20
    9ba8:	00 a9       	\.word 0xa900
    9baa:	20 00       	\.word 0x20
    9bac:	00 aa       	\.word 0xaa00
    9bae:	20 00       	\.word 0x20
    9bb0:	00 fb       	\.word 0xfb00
    9bb2:	24 00       	\.word 0x24
    9bb4:	00 fc       	\.word 0xfc00
    9bb6:	24 00       	\.word 0x24
    9bb8:	00 fd       	\.word 0xfd00
    9bba:	24 00       	\.word 0x24
    9bbc:	00 46       	\.word 0x4600
    9bbe:	2a 00       	\.word 0x2a
    9bc0:	00 48       	\.word 0x4800
    9bc2:	2a 00       	\.word 0x2a
    9bc4:	00 4a       	\.word 0x4a00
    9bc6:	2a 00       	\.word 0x2a
    9bc8:	00 4c       	\.word 0x4c00
    9bca:	2a 00       	\.word 0x2a
    9bcc:	00 4e       	\.word 0x4e00
    9bce:	2a 00       	\.word 0x2a
    9bd0:	00 46       	\.word 0x4600
    9bd2:	2b 00       	\.word 0x2b
    9bd4:	00 48       	\.word 0x4800
    9bd6:	2b 00       	\.word 0x2b
    9bd8:	00 86       	\.word 0x8600
    9bda:	2f 00       	\.word 0x2f
    9bdc:	00 88       	\.word 0x8800
    9bde:	2f 00       	\.word 0x2f
    9be0:	00 8a       	\.word 0x8a00
    9be2:	2f 00       	\.word 0x2f
    9be4:	00 8c       	\.word 0x8c00
    9be6:	2f 00       	\.word 0x2f
    9be8:	00 f6       	\.word 0xf600
    9bea:	15 00       	\.word 0x15
    9bec:	00 f7       	\.word 0xf700
    9bee:	15 00       	\.word 0x15
    9bf0:	00 f8       	\.word 0xf800
    9bf2:	15 00       	\.word 0x15
    9bf4:	00 f9       	\.word 0xf900
    9bf6:	15 00       	\.word 0x15
    9bf8:	00 fa       	\.word 0xfa00
    9bfa:	15 00       	\.word 0x15
    9bfc:	00 fb       	\.word 0xfb00
    9bfe:	15 00       	\.word 0x15
    9c00:	00 fc       	\.word 0xfc00
    9c02:	15 00       	\.word 0x15
    9c04:	00 fd       	\.word 0xfd00
    9c06:	15 00       	\.word 0x15
    9c08:	00 4e       	\.word 0x4e00
    9c0a:	1a 00       	\.word 0x1a
    9c0c:	00 4f       	\.word 0x4f00
    9c0e:	1a 00       	\.word 0x1a
    9c10:	00 50       	\.word 0x5000
    9c12:	1a 00       	\.word 0x1a
	\.\.\.
    9d94:	00 16       	\.word 0x1600
    9d96:	85 00       	\.word 0x85
    9d98:	00 16       	\.word 0x1600
    9d9a:	86 00       	\.word 0x86
    9d9c:	00 18       	\.word 0x1800
    9d9e:	86 00       	\.word 0x86
    9da0:	00 1a       	\.word 0x1a00
    9da2:	86 00       	\.word 0x86
    9da4:	00 1c       	\.word 0x1c00
    9da6:	86 00       	\.word 0x86
    9da8:	00 1e       	\.word 0x1e00
    9daa:	86 00       	\.word 0x86
    9dac:	00 20       	\.word 0x2000
    9dae:	86 00       	\.word 0x86
    9db0:	00 22       	\.word 0x2200
    9db2:	86 00       	\.word 0x86
    9db4:	00 60       	\.word 0x6000
    9db6:	8a 00       	\.word 0x8a
    9db8:	00 62       	\.word 0x6200
    9dba:	8a 00       	\.word 0x8a
    9dbc:	00 64       	\.word 0x6400
    9dbe:	8a 00       	\.word 0x8a
    9dc0:	00 66       	\.word 0x6600
    9dc2:	8a 00       	\.word 0x8a
    9dc4:	00 68       	\.word 0x6800
    9dc6:	8a 00       	\.word 0x8a
    9dc8:	00 6a       	\.word 0x6a00
    9dca:	8a 00       	\.word 0x8a
    9dcc:	00 6c       	\.word 0x6c00
    9dce:	8a 00       	\.word 0x8a
    9dd0:	00 a8       	\.word 0xa800
    9dd2:	9f 00       	\.word 0x9f
    9dd4:	00 a9       	\.word 0xa900
    9dd6:	9f 00       	\.word 0x9f
    9dd8:	00 aa       	\.word 0xaa00
    9dda:	9f 00       	\.word 0x9f
    9ddc:	00 ab       	\.word 0xab00
    9dde:	9f 00       	\.word 0x9f
    9de0:	00 ac       	\.word 0xac00
    9de2:	9f 00       	\.word 0x9f
    9de4:	00 a8       	\.word 0xa800
    9de6:	a0 00       	\.word 0xa0
    9de8:	00 a9       	\.word 0xa900
    9dea:	a0 00       	\.word 0xa0
    9dec:	00 aa       	\.word 0xaa00
    9dee:	a0 00       	\.word 0xa0
    9df0:	00 fb       	\.word 0xfb00
    9df2:	a4 00       	\.word 0xa4
    9df4:	00 fc       	\.word 0xfc00
    9df6:	a4 00       	\.word 0xa4
    9df8:	00 fd       	\.word 0xfd00
    9dfa:	a4 00       	\.word 0xa4
    9dfc:	00 46       	\.word 0x4600
    9dfe:	aa 00       	\.word 0xaa
    9e00:	00 48       	\.word 0x4800
    9e02:	aa 00       	\.word 0xaa
    9e04:	00 4a       	\.word 0x4a00
    9e06:	aa 00       	\.word 0xaa
    9e08:	00 4c       	\.word 0x4c00
    9e0a:	aa 00       	\.word 0xaa
    9e0c:	00 4e       	\.word 0x4e00
    9e0e:	aa 00       	\.word 0xaa
    9e10:	00 46       	\.word 0x4600
    9e12:	ab 00       	\.word 0xab
    9e14:	00 48       	\.word 0x4800
    9e16:	ab 00       	\.word 0xab
    9e18:	00 86       	\.word 0x8600
    9e1a:	af 00       	\.word 0xaf
    9e1c:	00 88       	\.word 0x8800
    9e1e:	af 00       	\.word 0xaf
    9e20:	00 8a       	\.word 0x8a00
    9e22:	af 00       	\.word 0xaf
    9e24:	00 8c       	\.word 0x8c00
    9e26:	af 00       	\.word 0xaf
    9e28:	00 f6       	\.word 0xf600
    9e2a:	95 00       	\.word 0x95
    9e2c:	00 f7       	\.word 0xf700
    9e2e:	95 00       	\.word 0x95
    9e30:	00 f8       	\.word 0xf800
    9e32:	95 00       	\.word 0x95
    9e34:	00 f9       	\.word 0xf900
    9e36:	95 00       	\.word 0x95
    9e38:	00 fa       	\.word 0xfa00
    9e3a:	95 00       	\.word 0x95
    9e3c:	00 fb       	\.word 0xfb00
    9e3e:	95 00       	\.word 0x95
    9e40:	00 fc       	\.word 0xfc00
    9e42:	95 00       	\.word 0x95
    9e44:	00 fd       	\.word 0xfd00
    9e46:	95 00       	\.word 0x95
    9e48:	00 4e       	\.word 0x4e00
    9e4a:	9a 00       	\.word 0x9a
    9e4c:	00 4f       	\.word 0x4f00
    9e4e:	9a 00       	\.word 0x9a
    9e50:	00 50       	\.word 0x5000
    9e52:	9a 00       	\.word 0x9a
    9e54:	00 16       	\.word 0x1600
    9e56:	05 00       	\.word 0x5
    9e58:	00 16       	\.word 0x1600
    9e5a:	06 00       	\.word 0x6
    9e5c:	00 18       	\.word 0x1800
    9e5e:	06 00       	\.word 0x6
    9e60:	00 1a       	\.word 0x1a00
    9e62:	06 00       	\.word 0x6
    9e64:	00 1c       	\.word 0x1c00
    9e66:	06 00       	\.word 0x6
    9e68:	00 1e       	\.word 0x1e00
    9e6a:	06 00       	\.word 0x6
    9e6c:	00 20       	\.word 0x2000
    9e6e:	06 00       	\.word 0x6
    9e70:	00 22       	\.word 0x2200
    9e72:	06 00       	\.word 0x6
    9e74:	00 60       	\.word 0x6000
    9e76:	0a 00       	\.word 0xa
    9e78:	00 62       	\.word 0x6200
    9e7a:	0a 00       	\.word 0xa
    9e7c:	00 64       	\.word 0x6400
    9e7e:	0a 00       	\.word 0xa
    9e80:	00 66       	\.word 0x6600
    9e82:	0a 00       	\.word 0xa
    9e84:	00 68       	\.word 0x6800
    9e86:	0a 00       	\.word 0xa
    9e88:	00 6a       	\.word 0x6a00
    9e8a:	0a 00       	\.word 0xa
    9e8c:	00 6c       	\.word 0x6c00
    9e8e:	0a 00       	\.word 0xa
    9e90:	00 a8       	\.word 0xa800
    9e92:	1f 00       	\.word 0x1f
    9e94:	00 a9       	\.word 0xa900
    9e96:	1f 00       	\.word 0x1f
    9e98:	00 aa       	\.word 0xaa00
    9e9a:	1f 00       	\.word 0x1f
    9e9c:	00 ab       	\.word 0xab00
    9e9e:	1f 00       	\.word 0x1f
    9ea0:	00 ac       	\.word 0xac00
    9ea2:	1f 00       	\.word 0x1f
    9ea4:	00 a8       	\.word 0xa800
    9ea6:	20 00       	\.word 0x20
    9ea8:	00 a9       	\.word 0xa900
    9eaa:	20 00       	\.word 0x20
    9eac:	00 aa       	\.word 0xaa00
    9eae:	20 00       	\.word 0x20
    9eb0:	00 fb       	\.word 0xfb00
    9eb2:	24 00       	\.word 0x24
    9eb4:	00 fc       	\.word 0xfc00
    9eb6:	24 00       	\.word 0x24
    9eb8:	00 fd       	\.word 0xfd00
    9eba:	24 00       	\.word 0x24
    9ebc:	00 46       	\.word 0x4600
    9ebe:	2a 00       	\.word 0x2a
    9ec0:	00 48       	\.word 0x4800
    9ec2:	2a 00       	\.word 0x2a
    9ec4:	00 4a       	\.word 0x4a00
    9ec6:	2a 00       	\.word 0x2a
    9ec8:	00 4c       	\.word 0x4c00
    9eca:	2a 00       	\.word 0x2a
    9ecc:	00 4e       	\.word 0x4e00
    9ece:	2a 00       	\.word 0x2a
    9ed0:	00 46       	\.word 0x4600
    9ed2:	2b 00       	\.word 0x2b
    9ed4:	00 48       	\.word 0x4800
    9ed6:	2b 00       	\.word 0x2b
    9ed8:	00 86       	\.word 0x8600
    9eda:	2f 00       	\.word 0x2f
    9edc:	00 88       	\.word 0x8800
    9ede:	2f 00       	\.word 0x2f
    9ee0:	00 8a       	\.word 0x8a00
    9ee2:	2f 00       	\.word 0x2f
    9ee4:	00 8c       	\.word 0x8c00
    9ee6:	2f 00       	\.word 0x2f
    9ee8:	00 f6       	\.word 0xf600
    9eea:	15 00       	\.word 0x15
    9eec:	00 f7       	\.word 0xf700
    9eee:	15 00       	\.word 0x15
    9ef0:	00 f8       	\.word 0xf800
    9ef2:	15 00       	\.word 0x15
    9ef4:	00 f9       	\.word 0xf900
    9ef6:	15 00       	\.word 0x15
    9ef8:	00 fa       	\.word 0xfa00
    9efa:	15 00       	\.word 0x15
    9efc:	00 fb       	\.word 0xfb00
    9efe:	15 00       	\.word 0x15
    9f00:	00 fc       	\.word 0xfc00
    9f02:	15 00       	\.word 0x15
    9f04:	00 fd       	\.word 0xfd00
    9f06:	15 00       	\.word 0x15
    9f08:	00 4e       	\.word 0x4e00
    9f0a:	1a 00       	\.word 0x1a
    9f0c:	00 4f       	\.word 0x4f00
    9f0e:	1a 00       	\.word 0x1a
    9f10:	00 50       	\.word 0x5000
    9f12:	1a 00       	\.word 0x1a
    9f14:	00 16       	\.word 0x1600
    9f16:	05 00       	\.word 0x5
    9f18:	00 16       	\.word 0x1600
    9f1a:	06 00       	\.word 0x6
    9f1c:	00 18       	\.word 0x1800
    9f1e:	06 00       	\.word 0x6
    9f20:	00 1a       	\.word 0x1a00
    9f22:	06 00       	\.word 0x6
    9f24:	00 1c       	\.word 0x1c00
    9f26:	06 00       	\.word 0x6
    9f28:	00 1e       	\.word 0x1e00
    9f2a:	06 00       	\.word 0x6
    9f2c:	00 20       	\.word 0x2000
    9f2e:	06 00       	\.word 0x6
    9f30:	00 22       	\.word 0x2200
    9f32:	06 00       	\.word 0x6
    9f34:	00 60       	\.word 0x6000
    9f36:	0a 00       	\.word 0xa
    9f38:	00 62       	\.word 0x6200
    9f3a:	0a 00       	\.word 0xa
    9f3c:	00 64       	\.word 0x6400
    9f3e:	0a 00       	\.word 0xa
    9f40:	00 66       	\.word 0x6600
    9f42:	0a 00       	\.word 0xa
    9f44:	00 68       	\.word 0x6800
    9f46:	0a 00       	\.word 0xa
    9f48:	00 6a       	\.word 0x6a00
    9f4a:	0a 00       	\.word 0xa
    9f4c:	00 6c       	\.word 0x6c00
    9f4e:	0a 00       	\.word 0xa
    9f50:	00 46       	\.word 0x4600
    9f52:	2a 00       	\.word 0x2a
    9f54:	00 48       	\.word 0x4800
    9f56:	2a 00       	\.word 0x2a
    9f58:	00 4a       	\.word 0x4a00
    9f5a:	2a 00       	\.word 0x2a
    9f5c:	00 4c       	\.word 0x4c00
    9f5e:	2a 00       	\.word 0x2a
    9f60:	00 4e       	\.word 0x4e00
    9f62:	2a 00       	\.word 0x2a
    9f64:	00 46       	\.word 0x4600
    9f66:	2b 00       	\.word 0x2b
    9f68:	00 48       	\.word 0x4800
    9f6a:	2b 00       	\.word 0x2b
    9f6c:	00 86       	\.word 0x8600
    9f6e:	2f 00       	\.word 0x2f
    9f70:	00 88       	\.word 0x8800
    9f72:	2f 00       	\.word 0x2f
    9f74:	00 8a       	\.word 0x8a00
    9f76:	2f 00       	\.word 0x2f
    9f78:	00 8c       	\.word 0x8c00
    9f7a:	2f 00       	\.word 0x2f
    9f7c:	00 6e       	\.word 0x6e00
    9f7e:	09 00       	\.word 0x9
    9f80:	00 ac       	\.word 0xac00
    9f82:	0a 00       	\.word 0xa
    9f84:	00 ac       	\.word 0xac00
    9f86:	0a 00       	\.word 0xa
    9f88:	00 90       	\.word 0x9000
    9f8a:	0a 00       	\.word 0xa
    9f8c:	00 b8       	\.word 0xb800
    9f8e:	08 00       	\.word 0x8
    9f90:	00 00       	\.word 0
    9f92:	01 00       	\.word 0x1
    9f94:	00 00       	\.word 0
    9f96:	08 00       	\.word 0x8
    9f98:	00 52       	\.word 0x5200
    9f9a:	1a 00       	\.word 0x1a
    9f9c:	00 fe       	\.word 0xfe00
    9f9e:	24 00       	\.word 0x24
    9fa0:	00 9a       	\.word 0x9a00
    9fa2:	11 00       	\.word 0x11
    9fa4:	00 28       	\.word 0x2800

00009fa5 \<foo_r8_a\>:
	\.\.\.

00009fa6 \<foo_r9_a\>:
    9fa6:	29 2a       	\.word 0x2a29

00009fa7 \<foo_ra_a\>:
	\.\.\.

00009fa8 \<foo_r0_b\>:
    9fa8:	20 21       	\.word 0x2120

00009fa9 \<foo_r1_b\>:
	\.\.\.

00009faa \<foo_r2_b\>:
    9faa:	22 23       	\.word 0x2322

00009fab \<foo_r3_b\>:
	\.\.\.

00009fac \<foo_r4_b\>:
    9fac:	24 00       	\.word 0x24
	\.\.\.

0000a0a8 \<foo_r5_b\>:
    a0a8:	25 26       	\.word 0x2625

0000a0a9 \<foo_r6_b\>:
	\.\.\.

0000a0aa \<foo_r7_b\>:
    a0aa:	27 d0       	\.word 0xd027
    a0ac:	01 00       	\.word 0x1
    a0ae:	00 d0       	\.word 0xd000
    a0b0:	02 00       	\.word 0x2
    a0b2:	00 d2       	\.word 0xd200
    a0b4:	02 00       	\.word 0x2
    a0b6:	00 d4       	\.word 0xd400
    a0b8:	02 00       	\.word 0x2
    a0ba:	00 d6       	\.word 0xd600
    a0bc:	02 00       	\.word 0x2
    a0be:	00 d8       	\.word 0xd800
    a0c0:	02 00       	\.word 0x2
    a0c2:	00 da       	\.word 0xda00
    a0c4:	02 00       	\.word 0x2
    a0c6:	00 dc       	\.word 0xdc00
    a0c8:	02 00       	\.word 0x2
    a0ca:	00 08       	\.word 0x800
    a0cc:	05 00       	\.word 0x5
    a0ce:	00 0a       	\.word 0xa00
    a0d0:	05 00       	\.word 0x5
    a0d2:	00 0c       	\.word 0xc00
    a0d4:	05 00       	\.word 0x5
    a0d6:	00 0e       	\.word 0xe00
    a0d8:	05 00       	\.word 0x5
    a0da:	00 10       	\.word 0x1000
    a0dc:	05 00       	\.word 0x5
    a0de:	00 12       	\.word 0x1200
    a0e0:	05 00       	\.word 0x5
    a0e2:	00 14       	\.word 0x1400
    a0e4:	05 00       	\.word 0x5
    a0e6:	00 52       	\.word 0x5200
    a0e8:	1a 00       	\.word 0x1a
    a0ea:	00 53       	\.word 0x5300
    a0ec:	1a 00       	\.word 0x1a
    a0ee:	00 54       	\.word 0x5400
    a0f0:	1a 00       	\.word 0x1a
    a0f2:	00 55       	\.word 0x5500
    a0f4:	1a 00       	\.word 0x1a
    a0f6:	00 56       	\.word 0x5600
    a0f8:	1a 00       	\.word 0x1a
    a0fa:	00 52       	\.word 0x5200
    a0fc:	1b 00       	\.word 0x1b
    a0fe:	00 53       	\.word 0x5300
    a100:	1b 00       	\.word 0x1b
    a102:	00 54       	\.word 0x5400
    a104:	1b 00       	\.word 0x1b
    a106:	00 a5       	\.word 0xa500
    a108:	1f 00       	\.word 0x1f
    a10a:	00 a6       	\.word 0xa600
    a10c:	1f 00       	\.word 0x1f
    a10e:	00 a7       	\.word 0xa700
    a110:	1f 00       	\.word 0x1f
    a112:	00 fe       	\.word 0xfe00
    a114:	24 00       	\.word 0x24
    a116:	00 00       	\.word 0
    a118:	25 00       	\.word 0x25
    a11a:	00 02       	\.word 0x200
    a11c:	25 00       	\.word 0x25
    a11e:	00 04       	\.word 0x400
    a120:	25 00       	\.word 0x25
    a122:	00 06       	\.word 0x600
    a124:	25 00       	\.word 0x25
    a126:	00 fe       	\.word 0xfe00
    a128:	25 00       	\.word 0x25
    a12a:	00 00       	\.word 0
    a12c:	26 00       	\.word 0x26
    a12e:	00 3e       	\.word 0x3e00
    a130:	2a 00       	\.word 0x2a
    a132:	00 40       	\.word 0x4000
    a134:	2a 00       	\.word 0x2a
    a136:	00 42       	\.word 0x4200
    a138:	2a 00       	\.word 0x2a
    a13a:	00 44       	\.word 0x4400
    a13c:	2a 00       	\.word 0x2a
    a13e:	00 9a       	\.word 0x9a00
    a140:	11 00       	\.word 0x11
    a142:	00 9b       	\.word 0x9b00
    a144:	11 00       	\.word 0x11
    a146:	00 9c       	\.word 0x9c00
    a148:	11 00       	\.word 0x11
    a14a:	00 9d       	\.word 0x9d00
    a14c:	11 00       	\.word 0x11
    a14e:	00 9e       	\.word 0x9e00
    a150:	11 00       	\.word 0x11
    a152:	00 9f       	\.word 0x9f00
    a154:	11 00       	\.word 0x11
    a156:	00 a0       	\.word 0xa000
    a158:	11 00       	\.word 0x11
    a15a:	00 a1       	\.word 0xa100
    a15c:	11 00       	\.word 0x11
    a15e:	00 f2       	\.word 0xf200
    a160:	15 00       	\.word 0x15
    a162:	00 f3       	\.word 0xf300
    a164:	15 00       	\.word 0x15
    a166:	00 f4       	\.word 0xf400
    a168:	15 00       	\.word 0x15
	\.\.\.
    a2ea:	00 d0       	\.word 0xd000
    a2ec:	81 00       	\.word 0x81
    a2ee:	00 d0       	\.word 0xd000
    a2f0:	82 00       	\.word 0x82
    a2f2:	00 d2       	\.word 0xd200
    a2f4:	82 00       	\.word 0x82
    a2f6:	00 d4       	\.word 0xd400
    a2f8:	82 00       	\.word 0x82
    a2fa:	00 d6       	\.word 0xd600
    a2fc:	82 00       	\.word 0x82
    a2fe:	00 d8       	\.word 0xd800
    a300:	82 00       	\.word 0x82
    a302:	00 da       	\.word 0xda00
    a304:	82 00       	\.word 0x82
    a306:	00 dc       	\.word 0xdc00
    a308:	82 00       	\.word 0x82
    a30a:	00 08       	\.word 0x800
    a30c:	85 00       	\.word 0x85
    a30e:	00 0a       	\.word 0xa00
    a310:	85 00       	\.word 0x85
    a312:	00 0c       	\.word 0xc00
    a314:	85 00       	\.word 0x85
    a316:	00 0e       	\.word 0xe00
    a318:	85 00       	\.word 0x85
    a31a:	00 10       	\.word 0x1000
    a31c:	85 00       	\.word 0x85
    a31e:	00 12       	\.word 0x1200
    a320:	85 00       	\.word 0x85
    a322:	00 14       	\.word 0x1400
    a324:	85 00       	\.word 0x85
    a326:	00 52       	\.word 0x5200
    a328:	9a 00       	\.word 0x9a
    a32a:	00 53       	\.word 0x5300
    a32c:	9a 00       	\.word 0x9a
    a32e:	00 54       	\.word 0x5400
    a330:	9a 00       	\.word 0x9a
    a332:	00 55       	\.word 0x5500
    a334:	9a 00       	\.word 0x9a
    a336:	00 56       	\.word 0x5600
    a338:	9a 00       	\.word 0x9a
    a33a:	00 52       	\.word 0x5200
    a33c:	9b 00       	\.word 0x9b
    a33e:	00 53       	\.word 0x5300
    a340:	9b 00       	\.word 0x9b
    a342:	00 54       	\.word 0x5400
    a344:	9b 00       	\.word 0x9b
    a346:	00 a5       	\.word 0xa500
    a348:	9f 00       	\.word 0x9f
    a34a:	00 a6       	\.word 0xa600
    a34c:	9f 00       	\.word 0x9f
    a34e:	00 a7       	\.word 0xa700
    a350:	9f 00       	\.word 0x9f
    a352:	00 fe       	\.word 0xfe00
    a354:	a4 00       	\.word 0xa4
    a356:	00 00       	\.word 0
    a358:	a5 00       	\.word 0xa5
    a35a:	00 02       	\.word 0x200
    a35c:	a5 00       	\.word 0xa5
    a35e:	00 04       	\.word 0x400
    a360:	a5 00       	\.word 0xa5
    a362:	00 06       	\.word 0x600
    a364:	a5 00       	\.word 0xa5
    a366:	00 fe       	\.word 0xfe00
    a368:	a5 00       	\.word 0xa5
    a36a:	00 00       	\.word 0
    a36c:	a6 00       	\.word 0xa6
    a36e:	00 3e       	\.word 0x3e00
    a370:	aa 00       	\.word 0xaa
    a372:	00 40       	\.word 0x4000
    a374:	aa 00       	\.word 0xaa
    a376:	00 42       	\.word 0x4200
    a378:	aa 00       	\.word 0xaa
    a37a:	00 44       	\.word 0x4400
    a37c:	aa 00       	\.word 0xaa
    a37e:	00 9a       	\.word 0x9a00
    a380:	91 00       	\.word 0x91
    a382:	00 9b       	\.word 0x9b00
    a384:	91 00       	\.word 0x91
    a386:	00 9c       	\.word 0x9c00
    a388:	91 00       	\.word 0x91
    a38a:	00 9d       	\.word 0x9d00
    a38c:	91 00       	\.word 0x91
    a38e:	00 9e       	\.word 0x9e00
    a390:	91 00       	\.word 0x91
    a392:	00 9f       	\.word 0x9f00
    a394:	91 00       	\.word 0x91
    a396:	00 a0       	\.word 0xa000
    a398:	91 00       	\.word 0x91
    a39a:	00 a1       	\.word 0xa100
    a39c:	91 00       	\.word 0x91
    a39e:	00 f2       	\.word 0xf200
    a3a0:	95 00       	\.word 0x95
    a3a2:	00 f3       	\.word 0xf300
    a3a4:	95 00       	\.word 0x95
    a3a6:	00 f4       	\.word 0xf400
    a3a8:	95 00       	\.word 0x95
    a3aa:	00 d0       	\.word 0xd000
    a3ac:	01 00       	\.word 0x1
    a3ae:	00 d0       	\.word 0xd000
    a3b0:	02 00       	\.word 0x2
    a3b2:	00 d2       	\.word 0xd200
    a3b4:	02 00       	\.word 0x2
    a3b6:	00 d4       	\.word 0xd400
    a3b8:	02 00       	\.word 0x2
    a3ba:	00 d6       	\.word 0xd600
    a3bc:	02 00       	\.word 0x2
    a3be:	00 d8       	\.word 0xd800
    a3c0:	02 00       	\.word 0x2
    a3c2:	00 da       	\.word 0xda00
    a3c4:	02 00       	\.word 0x2
    a3c6:	00 dc       	\.word 0xdc00
    a3c8:	02 00       	\.word 0x2
    a3ca:	00 08       	\.word 0x800
    a3cc:	05 00       	\.word 0x5
    a3ce:	00 0a       	\.word 0xa00
    a3d0:	05 00       	\.word 0x5
    a3d2:	00 0c       	\.word 0xc00
    a3d4:	05 00       	\.word 0x5
    a3d6:	00 0e       	\.word 0xe00
    a3d8:	05 00       	\.word 0x5
    a3da:	00 10       	\.word 0x1000
    a3dc:	05 00       	\.word 0x5
    a3de:	00 12       	\.word 0x1200
    a3e0:	05 00       	\.word 0x5
    a3e2:	00 14       	\.word 0x1400
    a3e4:	05 00       	\.word 0x5
    a3e6:	00 52       	\.word 0x5200
    a3e8:	1a 00       	\.word 0x1a
    a3ea:	00 53       	\.word 0x5300
    a3ec:	1a 00       	\.word 0x1a
    a3ee:	00 54       	\.word 0x5400
    a3f0:	1a 00       	\.word 0x1a
    a3f2:	00 55       	\.word 0x5500
    a3f4:	1a 00       	\.word 0x1a
    a3f6:	00 56       	\.word 0x5600
    a3f8:	1a 00       	\.word 0x1a
    a3fa:	00 52       	\.word 0x5200
    a3fc:	1b 00       	\.word 0x1b
    a3fe:	00 53       	\.word 0x5300
    a400:	1b 00       	\.word 0x1b
    a402:	00 54       	\.word 0x5400
    a404:	1b 00       	\.word 0x1b
    a406:	00 a5       	\.word 0xa500
    a408:	1f 00       	\.word 0x1f
    a40a:	00 a6       	\.word 0xa600
    a40c:	1f 00       	\.word 0x1f
    a40e:	00 a7       	\.word 0xa700
    a410:	1f 00       	\.word 0x1f
    a412:	00 fe       	\.word 0xfe00
    a414:	24 00       	\.word 0x24
    a416:	00 00       	\.word 0
    a418:	25 00       	\.word 0x25
    a41a:	00 02       	\.word 0x200
    a41c:	25 00       	\.word 0x25
    a41e:	00 04       	\.word 0x400
    a420:	25 00       	\.word 0x25
    a422:	00 06       	\.word 0x600
    a424:	25 00       	\.word 0x25
    a426:	00 fe       	\.word 0xfe00
    a428:	25 00       	\.word 0x25
    a42a:	00 00       	\.word 0
    a42c:	26 00       	\.word 0x26
    a42e:	00 3e       	\.word 0x3e00
    a430:	2a 00       	\.word 0x2a
    a432:	00 40       	\.word 0x4000
    a434:	2a 00       	\.word 0x2a
    a436:	00 42       	\.word 0x4200
    a438:	2a 00       	\.word 0x2a
    a43a:	00 44       	\.word 0x4400
    a43c:	2a 00       	\.word 0x2a
    a43e:	00 9a       	\.word 0x9a00
    a440:	11 00       	\.word 0x11
    a442:	00 9b       	\.word 0x9b00
    a444:	11 00       	\.word 0x11
    a446:	00 9c       	\.word 0x9c00
    a448:	11 00       	\.word 0x11
    a44a:	00 9d       	\.word 0x9d00
    a44c:	11 00       	\.word 0x11
    a44e:	00 9e       	\.word 0x9e00
    a450:	11 00       	\.word 0x11
    a452:	00 9f       	\.word 0x9f00
    a454:	11 00       	\.word 0x11
    a456:	00 a0       	\.word 0xa000
    a458:	11 00       	\.word 0x11
    a45a:	00 a1       	\.word 0xa100
    a45c:	11 00       	\.word 0x11
    a45e:	00 f2       	\.word 0xf200
    a460:	15 00       	\.word 0x15
    a462:	00 f3       	\.word 0xf300
    a464:	15 00       	\.word 0x15
    a466:	00 f4       	\.word 0xf400
    a468:	15 00       	\.word 0x15
    a46a:	00 d0       	\.word 0xd000
    a46c:	01 00       	\.word 0x1
    a46e:	00 d0       	\.word 0xd000
    a470:	02 00       	\.word 0x2
    a472:	00 d2       	\.word 0xd200
    a474:	02 00       	\.word 0x2
    a476:	00 d4       	\.word 0xd400
    a478:	02 00       	\.word 0x2
    a47a:	00 d6       	\.word 0xd600
    a47c:	02 00       	\.word 0x2
    a47e:	00 d8       	\.word 0xd800
    a480:	02 00       	\.word 0x2
    a482:	00 da       	\.word 0xda00
    a484:	02 00       	\.word 0x2
    a486:	00 dc       	\.word 0xdc00
    a488:	02 00       	\.word 0x2
    a48a:	00 08       	\.word 0x800
    a48c:	05 00       	\.word 0x5
    a48e:	00 0a       	\.word 0xa00
    a490:	05 00       	\.word 0x5
    a492:	00 0c       	\.word 0xc00
    a494:	05 00       	\.word 0x5
    a496:	00 0e       	\.word 0xe00
    a498:	05 00       	\.word 0x5
    a49a:	00 10       	\.word 0x1000
    a49c:	05 00       	\.word 0x5
    a49e:	00 12       	\.word 0x1200
    a4a0:	05 00       	\.word 0x5
    a4a2:	00 14       	\.word 0x1400
    a4a4:	05 00       	\.word 0x5
    a4a6:	00 fe       	\.word 0xfe00
    a4a8:	24 00       	\.word 0x24
    a4aa:	00 00       	\.word 0
    a4ac:	25 00       	\.word 0x25
    a4ae:	00 02       	\.word 0x200
    a4b0:	25 00       	\.word 0x25
    a4b2:	00 04       	\.word 0x400
    a4b4:	25 00       	\.word 0x25
    a4b6:	00 06       	\.word 0x600
    a4b8:	25 00       	\.word 0x25
    a4ba:	00 fe       	\.word 0xfe00
    a4bc:	25 00       	\.word 0x25
    a4be:	00 00       	\.word 0
    a4c0:	26 00       	\.word 0x26
    a4c2:	00 3e       	\.word 0x3e00
    a4c4:	2a 00       	\.word 0x2a
    a4c6:	00 40       	\.word 0x4000
    a4c8:	2a 00       	\.word 0x2a
    a4ca:	00 42       	\.word 0x4200
    a4cc:	2a 00       	\.word 0x2a
    a4ce:	00 44       	\.word 0x4400
    a4d0:	2a 00       	\.word 0x2a
    a4d2:	00 6e       	\.word 0x6e00
    a4d4:	09 00       	\.word 0x9
    a4d6:	00 ac       	\.word 0xac00
    a4d8:	0a 00       	\.word 0xa
    a4da:	00 ac       	\.word 0xac00
    a4dc:	0a 00       	\.word 0xa
    a4de:	00 90       	\.word 0x9000
    a4e0:	0a 00       	\.word 0xa
    a4e2:	00 b8       	\.word 0xb800
    a4e4:	08 00       	\.word 0x8
    a4e6:	00 00       	\.word 0
    a4e8:	01 00       	\.word 0x1
    a4ea:	00 00       	\.word 0
    a4ec:	08 00       	\.word 0x8
    a4ee:	00 52       	\.word 0x5200
    a4f0:	1a 00       	\.word 0x1a
    a4f2:	00 fe       	\.word 0xfe00
    a4f4:	24 00       	\.word 0x24
    a4f6:	00 9a       	\.word 0x9a00
    a4f8:	11 00       	\.word 0x11
    a4fa:	00 28       	\.word 0x2800

0000a4fb \<foo_r8_b\>:
	\.\.\.

0000a4fc \<foo_r9_b\>:
    a4fc:	29 2a       	\.word 0x2a29

0000a4fd \<foo_ra_b\>:
	\.\.\.
Disassembly of section foo_x:

000024fe \<foo_x0_a\>:
    24fe:	30 00 00    	nop       

00002500 \<foo_x1_a\>:
    2500:	31 00 00    	nop       

00002502 \<foo_x2_a\>:
    2502:	32 00 00    	nop       

00002504 \<foo_x3_a\>:
    2504:	33 00 00    	nop       

00002506 \<foo_x4_a\>:
    2506:	34 00 00    	nop       
	\.\.\.

000025fe \<foo_x5_a\>:
    25fe:	35 00 00    	nop       

00002600 \<foo_x6_a\>:
    2600:	36 16 00    	nop       
    2602:	05 00 00    	nop       
    2604:	00 16 00    	nop       
    2606:	06 00 00    	nop       
    2608:	00 18 00    	nop       
    260a:	06 00 00    	nop       
    260c:	00 1a 00    	nop       
    260e:	06 00 00    	nop       
    2610:	00 1c 00    	nop       
    2612:	06 00 00    	nop       
    2614:	00 1e 00    	nop       
    2616:	06 00 00    	nop       
    2618:	00 20 00    	nop       
    261a:	06 00 00    	nop       
    261c:	00 22 00    	nop       
    261e:	06 00 00    	nop       
    2620:	00 60 00    	nop       
    2622:	0a 00 00    	nop       
    2624:	00 62 00    	nop       
    2626:	0a 00 00    	nop       
    2628:	00 64 00    	nop       
    262a:	0a 00 00    	nop       
    262c:	00 66 00    	nop       
    262e:	0a 00 00    	nop       
    2630:	00 68 00    	nop       
    2632:	0a 00 00    	nop       
    2634:	00 6a 00    	nop       
    2636:	0a 00 00    	nop       
    2638:	00 6c 00    	nop       
    263a:	0a 00 00    	nop       
    263c:	00 a8 00    	nop       
    263e:	1f 00 00    	nop       
    2640:	00 a9 00    	nop       
    2642:	1f 00 00    	nop       
    2644:	00 aa 00    	nop       
    2646:	1f 00 00    	nop       
    2648:	00 ab 00    	nop       
    264a:	1f 00 00    	nop       
    264c:	00 ac 00    	nop       
    264e:	1f 00 00    	nop       
    2650:	00 a8 00    	nop       
    2652:	20 00 00    	nop       
    2654:	00 a9 00    	nop       
    2656:	20 00 00    	nop       
    2658:	00 aa 00    	nop       
    265a:	20 00 00    	nop       
    265c:	00 fb 00    	nop       
    265e:	24 00 00    	nop       
    2660:	00 fc 00    	nop       
    2662:	24 00 00    	nop       
    2664:	00 fd 00    	nop       
    2666:	24 00 00    	nop       
    2668:	00 46 00    	nop       
    266a:	2a 00 00    	nop       
    266c:	00 48 00    	nop       
    266e:	2a 00 00    	nop       
    2670:	00 4a 00    	nop       
    2672:	2a 00 00    	nop       
    2674:	00 4c 00    	nop       
    2676:	2a 00 00    	nop       
    2678:	00 4e 00    	nop       
    267a:	2a 00 00    	nop       
    267c:	00 46 00    	nop       
    267e:	2b 00 00    	nop       
    2680:	00 48 00    	nop       
    2682:	2b 00 00    	nop       
    2684:	00 86 00    	nop       
    2686:	2f 00 00    	nop       
    2688:	00 88 00    	nop       
    268a:	2f 00 00    	nop       
    268c:	00 8a 00    	nop       
    268e:	2f 00 00    	nop       
    2690:	00 8c 00    	nop       
    2692:	2f 00 00    	nop       
    2694:	00 f6 00    	nop       
    2696:	15 00 00    	nop       
    2698:	00 f7 00    	nop       
    269a:	15 00 00    	nop       
    269c:	00 f8 00    	nop       
    269e:	15 00 00    	nop       
    26a0:	00 f9 00    	nop       
    26a2:	15 00 00    	nop       
    26a4:	00 fa 00    	nop       
    26a6:	15 00 00    	nop       
    26a8:	00 fb 00    	nop       
    26aa:	15 00 00    	nop       
    26ac:	00 fc 00    	nop       
    26ae:	15 00 00    	nop       
    26b0:	00 fd 00    	nop       
    26b2:	15 00 00    	nop       
    26b4:	00 4e 00    	nop       
    26b6:	1a 00 00    	nop       
    26b8:	00 4f 00    	nop       
    26ba:	1a 00 00    	nop       
    26bc:	00 50 00    	nop       
    26be:	1a 00 00    	nop       
	\.\.\.
    2840:	00 16 00    	nop       
    2842:	85 00 00    	nop       
    2844:	00 16 00    	nop       
    2846:	86 00 00    	nop       
    2848:	00 18 00    	nop       
    284a:	86 00 00    	nop       
    284c:	00 1a 00    	nop       
    284e:	86 00 00    	nop       
    2850:	00 1c 00    	nop       
    2852:	86 00 00    	nop       
    2854:	00 1e 00    	nop       
    2856:	86 00 00    	nop       
    2858:	00 20 00    	nop       
    285a:	86 00 00    	nop       
    285c:	00 22 00    	nop       
    285e:	86 00 00    	nop       
    2860:	00 60 00    	nop       
    2862:	8a 00 00    	nop       
    2864:	00 62 00    	nop       
    2866:	8a 00 00    	nop       
    2868:	00 64 00    	nop       
    286a:	8a 00 00    	nop       
    286c:	00 66 00    	nop       
    286e:	8a 00 00    	nop       
    2870:	00 68 00    	nop       
    2872:	8a 00 00    	nop       
    2874:	00 6a 00    	nop       
    2876:	8a 00 00    	nop       
    2878:	00 6c 00    	nop       
    287a:	8a 00 00    	nop       
    287c:	00 a8 00    	nop       
    287e:	9f 00 00    	nop       
    2880:	00 a9 00    	nop       
    2882:	9f 00 00    	nop       
    2884:	00 aa 00    	nop       
    2886:	9f 00 00    	nop       
    2888:	00 ab 00    	nop       
    288a:	9f 00 00    	nop       
    288c:	00 ac 00    	nop       
    288e:	9f 00 00    	nop       
    2890:	00 a8 00    	nop       
    2892:	a0 00 00    	nop       
    2894:	00 a9 00    	nop       
    2896:	a0 00 00    	nop       
    2898:	00 aa 00    	nop       
    289a:	a0 00 00    	nop       
    289c:	00 fb 00    	nop       
    289e:	a4 00 00    	nop       
    28a0:	00 fc 00    	nop       
    28a2:	a4 00 00    	nop       
    28a4:	00 fd 00    	nop       
    28a6:	a4 00 00    	nop       
    28a8:	00 46 00    	nop       
    28aa:	aa 00 00    	nop       
    28ac:	00 48 00    	nop       
    28ae:	aa 00 00    	nop       
    28b0:	00 4a 00    	nop       
    28b2:	aa 00 00    	nop       
    28b4:	00 4c 00    	nop       
    28b6:	aa 00 00    	nop       
    28b8:	00 4e 00    	nop       
    28ba:	aa 00 00    	nop       
    28bc:	00 46 00    	nop       
    28be:	ab 00 00    	nop       
    28c0:	00 48 00    	nop       
    28c2:	ab 00 00    	nop       
    28c4:	00 86 00    	nop       
    28c6:	af 00 00    	nop       
    28c8:	00 88 00    	nop       
    28ca:	af 00 00    	nop       
    28cc:	00 8a 00    	nop       
    28ce:	af 00 00    	nop       
    28d0:	00 8c 00    	nop       
    28d2:	af 00 00    	nop       
    28d4:	00 f6 00    	nop       
    28d6:	95 00 00    	nop       
    28d8:	00 f7 00    	nop       
    28da:	95 00 00    	nop       
    28dc:	00 f8 00    	nop       
    28de:	95 00 00    	nop       
    28e0:	00 f9 00    	nop       
    28e2:	95 00 00    	nop       
    28e4:	00 fa 00    	nop       
    28e6:	95 00 00    	nop       
    28e8:	00 fb 00    	nop       
    28ea:	95 00 00    	nop       
    28ec:	00 fc 00    	nop       
    28ee:	95 00 00    	nop       
    28f0:	00 fd 00    	nop       
    28f2:	95 00 00    	nop       
    28f4:	00 4e 00    	nop       
    28f6:	9a 00 00    	nop       
    28f8:	00 4f 00    	nop       
    28fa:	9a 00 00    	nop       
    28fc:	00 50 00    	nop       
    28fe:	9a 00 00    	nop       
    2900:	00 16 00    	nop       
    2902:	05 00 00    	nop       
    2904:	00 16 00    	nop       
    2906:	06 00 00    	nop       
    2908:	00 18 00    	nop       
    290a:	06 00 00    	nop       
    290c:	00 1a 00    	nop       
    290e:	06 00 00    	nop       
    2910:	00 1c 00    	nop       
    2912:	06 00 00    	nop       
    2914:	00 1e 00    	nop       
    2916:	06 00 00    	nop       
    2918:	00 20 00    	nop       
    291a:	06 00 00    	nop       
    291c:	00 22 00    	nop       
    291e:	06 00 00    	nop       
    2920:	00 60 00    	nop       
    2922:	0a 00 00    	nop       
    2924:	00 62 00    	nop       
    2926:	0a 00 00    	nop       
    2928:	00 64 00    	nop       
    292a:	0a 00 00    	nop       
    292c:	00 66 00    	nop       
    292e:	0a 00 00    	nop       
    2930:	00 68 00    	nop       
    2932:	0a 00 00    	nop       
    2934:	00 6a 00    	nop       
    2936:	0a 00 00    	nop       
    2938:	00 6c 00    	nop       
    293a:	0a 00 00    	nop       
    293c:	00 a8 00    	nop       
    293e:	1f 00 00    	nop       
    2940:	00 a9 00    	nop       
    2942:	1f 00 00    	nop       
    2944:	00 aa 00    	nop       
    2946:	1f 00 00    	nop       
    2948:	00 ab 00    	nop       
    294a:	1f 00 00    	nop       
    294c:	00 ac 00    	nop       
    294e:	1f 00 00    	nop       
    2950:	00 a8 00    	nop       
    2952:	20 00 00    	nop       
    2954:	00 a9 00    	nop       
    2956:	20 00 00    	nop       
    2958:	00 aa 00    	nop       
    295a:	20 00 00    	nop       
    295c:	00 fb 00    	nop       
    295e:	24 00 00    	nop       
    2960:	00 fc 00    	nop       
    2962:	24 00 00    	nop       
    2964:	00 fd 00    	nop       
    2966:	24 00 00    	nop       
    2968:	00 46 00    	nop       
    296a:	2a 00 00    	nop       
    296c:	00 48 00    	nop       
    296e:	2a 00 00    	nop       
    2970:	00 4a 00    	nop       
    2972:	2a 00 00    	nop       
    2974:	00 4c 00    	nop       
    2976:	2a 00 00    	nop       
    2978:	00 4e 00    	nop       
    297a:	2a 00 00    	nop       
    297c:	00 46 00    	nop       
    297e:	2b 00 00    	nop       
    2980:	00 48 00    	nop       
    2982:	2b 00 00    	nop       
    2984:	00 86 00    	nop       
    2986:	2f 00 00    	nop       
    2988:	00 88 00    	nop       
    298a:	2f 00 00    	nop       
    298c:	00 8a 00    	nop       
    298e:	2f 00 00    	nop       
    2990:	00 8c 00    	nop       
    2992:	2f 00 00    	nop       
    2994:	00 f6 00    	nop       
    2996:	15 00 00    	nop       
    2998:	00 f7 00    	nop       
    299a:	15 00 00    	nop       
    299c:	00 f8 00    	nop       
    299e:	15 00 00    	nop       
    29a0:	00 f9 00    	nop       
    29a2:	15 00 00    	nop       
    29a4:	00 fa 00    	nop       
    29a6:	15 00 00    	nop       
    29a8:	00 fb 00    	nop       
    29aa:	15 00 00    	nop       
    29ac:	00 fc 00    	nop       
    29ae:	15 00 00    	nop       
    29b0:	00 fd 00    	nop       
    29b2:	15 00 00    	nop       
    29b4:	00 4e 00    	nop       
    29b6:	1a 00 00    	nop       
    29b8:	00 4f 00    	nop       
    29ba:	1a 00 00    	nop       
    29bc:	00 50 00    	nop       
    29be:	1a 00 00    	nop       
    29c0:	00 16 00    	nop       
    29c2:	05 00 00    	nop       
    29c4:	00 16 00    	nop       
    29c6:	06 00 00    	nop       
    29c8:	00 18 00    	nop       
    29ca:	06 00 00    	nop       
    29cc:	00 1a 00    	nop       
    29ce:	06 00 00    	nop       
    29d0:	00 1c 00    	nop       
    29d2:	06 00 00    	nop       
    29d4:	00 1e 00    	nop       
    29d6:	06 00 00    	nop       
    29d8:	00 20 00    	nop       
    29da:	06 00 00    	nop       
    29dc:	00 22 00    	nop       
    29de:	06 00 00    	nop       
    29e0:	00 60 00    	nop       
    29e2:	0a 00 00    	nop       
    29e4:	00 62 00    	nop       
    29e6:	0a 00 00    	nop       
    29e8:	00 64 00    	nop       
    29ea:	0a 00 00    	nop       
    29ec:	00 66 00    	nop       
    29ee:	0a 00 00    	nop       
    29f0:	00 68 00    	nop       
    29f2:	0a 00 00    	nop       
    29f4:	00 6a 00    	nop       
    29f6:	0a 00 00    	nop       
    29f8:	00 6c 00    	nop       
    29fa:	0a 00 00    	nop       
    29fc:	00 46 00    	nop       
    29fe:	2a 00 00    	nop       
    2a00:	00 48 00    	nop       
    2a02:	2a 00 00    	nop       
    2a04:	00 4a 00    	nop       
    2a06:	2a 00 00    	nop       
    2a08:	00 4c 00    	nop       
    2a0a:	2a 00 00    	nop       
    2a0c:	00 4e 00    	nop       
    2a0e:	2a 00 00    	nop       
    2a10:	00 46 00    	nop       
    2a12:	2b 00 00    	nop       
    2a14:	00 48 00    	nop       
    2a16:	2b 00 00    	nop       
    2a18:	00 86 00    	nop       
    2a1a:	2f 00 00    	nop       
    2a1c:	00 88 00    	nop       
    2a1e:	2f 00 00    	nop       
    2a20:	00 8a 00    	nop       
    2a22:	2f 00 00    	nop       
    2a24:	00 8c 00    	nop       
    2a26:	2f 00 00    	nop       
    2a28:	00 00 00    	nop       
    2a2a:	e0 96 20    	mov\.w     #0x96e \<\.sizeof\.\.text\>, w0
    2a2c:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
    2a2e:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
    2a30:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
    2a32:	80 8b 20    	mov\.w     #0x8b8 \<\.sizeof\.\.const\>, w0
    2a34:	00 10 20    	mov\.w     #0x100 \<\.handle\>, w0
    2a36:	00 80 20    	mov\.w     #0x800 \<data0_a\>, w0
    2a38:	20 a5 21    	mov\.w     #0x1a52 \<\.startof\.foo_r\>, w0
    2a3a:	e0 4f 22    	mov\.w     #0x24fe \<foo_x0_a\>, w0
    2a3c:	a0 19 21    	mov\.w     #0x119a \<\.startof\.\.const\>, w0

00002a3e \<foo_x7_a\>:
    2a3e:	37 00 00    	nop       

00002a40 \<foo_x8_a\>:
    2a40:	38 00 00    	nop       

00002a42 \<foo_x9_a\>:
    2a42:	39 00 00    	nop       

00002a44 \<foo_xa_a\>:
    2a44:	3a 00 00    	nop       

00002a46 \<foo_x0_b\>:
    2a46:	30 00 00    	nop       

00002a48 \<foo_x1_b\>:
    2a48:	31 00 00    	nop       

00002a4a \<foo_x2_b\>:
    2a4a:	32 00 00    	nop       

00002a4c \<foo_x3_b\>:
    2a4c:	33 00 00    	nop       

00002a4e \<foo_x4_b\>:
    2a4e:	34 00 00    	nop       
	\.\.\.

00002b46 \<foo_x5_b\>:
    2b46:	35 00 00    	nop       

00002b48 \<foo_x6_b\>:
    2b48:	36 d0 00    	nop       
    2b4a:	01 00 00    	nop       
    2b4c:	00 d0 00    	nop       
    2b4e:	02 00 00    	nop       
    2b50:	00 d2 00    	nop       
    2b52:	02 00 00    	nop       
    2b54:	00 d4 00    	nop       
    2b56:	02 00 00    	nop       
    2b58:	00 d6 00    	nop       
    2b5a:	02 00 00    	nop       
    2b5c:	00 d8 00    	nop       
    2b5e:	02 00 00    	nop       
    2b60:	00 da 00    	nop       
    2b62:	02 00 00    	nop       
    2b64:	00 dc 00    	nop       
    2b66:	02 00 00    	nop       
    2b68:	00 08 00    	nop       
    2b6a:	05 00 00    	nop       
    2b6c:	00 0a 00    	nop       
    2b6e:	05 00 00    	nop       
    2b70:	00 0c 00    	nop       
    2b72:	05 00 00    	nop       
    2b74:	00 0e 00    	nop       
    2b76:	05 00 00    	nop       
    2b78:	00 10 00    	nop       
    2b7a:	05 00 00    	nop       
    2b7c:	00 12 00    	nop       
    2b7e:	05 00 00    	nop       
    2b80:	00 14 00    	nop       
    2b82:	05 00 00    	nop       
    2b84:	00 52 00    	nop       
    2b86:	1a 00 00    	nop       
    2b88:	00 53 00    	nop       
    2b8a:	1a 00 00    	nop       
    2b8c:	00 54 00    	nop       
    2b8e:	1a 00 00    	nop       
    2b90:	00 55 00    	nop       
    2b92:	1a 00 00    	nop       
    2b94:	00 56 00    	nop       
    2b96:	1a 00 00    	nop       
    2b98:	00 52 00    	nop       
    2b9a:	1b 00 00    	nop       
    2b9c:	00 53 00    	nop       
    2b9e:	1b 00 00    	nop       
    2ba0:	00 54 00    	nop       
    2ba2:	1b 00 00    	nop       
    2ba4:	00 a5 00    	nop       
    2ba6:	1f 00 00    	nop       
    2ba8:	00 a6 00    	nop       
    2baa:	1f 00 00    	nop       
    2bac:	00 a7 00    	nop       
    2bae:	1f 00 00    	nop       
    2bb0:	00 fe 00    	nop       
    2bb2:	24 00 00    	nop       
    2bb4:	00 00 00    	nop       
    2bb6:	25 00 00    	nop       
    2bb8:	00 02 00    	nop       
    2bba:	25 00 00    	nop       
    2bbc:	00 04 00    	nop       
    2bbe:	25 00 00    	nop       
    2bc0:	00 06 00    	nop       
    2bc2:	25 00 00    	nop       
    2bc4:	00 fe 00    	nop       
    2bc6:	25 00 00    	nop       
    2bc8:	00 00 00    	nop       
    2bca:	26 00 00    	nop       
    2bcc:	00 3e 00    	nop       
    2bce:	2a 00 00    	nop       
    2bd0:	00 40 00    	nop       
    2bd2:	2a 00 00    	nop       
    2bd4:	00 42 00    	nop       
    2bd6:	2a 00 00    	nop       
    2bd8:	00 44 00    	nop       
    2bda:	2a 00 00    	nop       
    2bdc:	00 9a 00    	nop       
    2bde:	11 00 00    	nop       
    2be0:	00 9b 00    	nop       
    2be2:	11 00 00    	nop       
    2be4:	00 9c 00    	nop       
    2be6:	11 00 00    	nop       
    2be8:	00 9d 00    	nop       
    2bea:	11 00 00    	nop       
    2bec:	00 9e 00    	nop       
    2bee:	11 00 00    	nop       
    2bf0:	00 9f 00    	nop       
    2bf2:	11 00 00    	nop       
    2bf4:	00 a0 00    	nop       
    2bf6:	11 00 00    	nop       
    2bf8:	00 a1 00    	nop       
    2bfa:	11 00 00    	nop       
    2bfc:	00 f2 00    	nop       
    2bfe:	15 00 00    	nop       
    2c00:	00 f3 00    	nop       
    2c02:	15 00 00    	nop       
    2c04:	00 f4 00    	nop       
    2c06:	15 00 00    	nop       
	\.\.\.
    2d88:	00 d0 00    	nop       
    2d8a:	81 00 00    	nop       
    2d8c:	00 d0 00    	nop       
    2d8e:	82 00 00    	nop       
    2d90:	00 d2 00    	nop       
    2d92:	82 00 00    	nop       
    2d94:	00 d4 00    	nop       
    2d96:	82 00 00    	nop       
    2d98:	00 d6 00    	nop       
    2d9a:	82 00 00    	nop       
    2d9c:	00 d8 00    	nop       
    2d9e:	82 00 00    	nop       
    2da0:	00 da 00    	nop       
    2da2:	82 00 00    	nop       
    2da4:	00 dc 00    	nop       
    2da6:	82 00 00    	nop       
    2da8:	00 08 00    	nop       
    2daa:	85 00 00    	nop       
    2dac:	00 0a 00    	nop       
    2dae:	85 00 00    	nop       
    2db0:	00 0c 00    	nop       
    2db2:	85 00 00    	nop       
    2db4:	00 0e 00    	nop       
    2db6:	85 00 00    	nop       
    2db8:	00 10 00    	nop       
    2dba:	85 00 00    	nop       
    2dbc:	00 12 00    	nop       
    2dbe:	85 00 00    	nop       
    2dc0:	00 14 00    	nop       
    2dc2:	85 00 00    	nop       
    2dc4:	00 52 00    	nop       
    2dc6:	9a 00 00    	nop       
    2dc8:	00 53 00    	nop       
    2dca:	9a 00 00    	nop       
    2dcc:	00 54 00    	nop       
    2dce:	9a 00 00    	nop       
    2dd0:	00 55 00    	nop       
    2dd2:	9a 00 00    	nop       
    2dd4:	00 56 00    	nop       
    2dd6:	9a 00 00    	nop       
    2dd8:	00 52 00    	nop       
    2dda:	9b 00 00    	nop       
    2ddc:	00 53 00    	nop       
    2dde:	9b 00 00    	nop       
    2de0:	00 54 00    	nop       
    2de2:	9b 00 00    	nop       
    2de4:	00 a5 00    	nop       
    2de6:	9f 00 00    	nop       
    2de8:	00 a6 00    	nop       
    2dea:	9f 00 00    	nop       
    2dec:	00 a7 00    	nop       
    2dee:	9f 00 00    	nop       
    2df0:	00 fe 00    	nop       
    2df2:	a4 00 00    	nop       
    2df4:	00 00 00    	nop       
    2df6:	a5 00 00    	nop       
    2df8:	00 02 00    	nop       
    2dfa:	a5 00 00    	nop       
    2dfc:	00 04 00    	nop       
    2dfe:	a5 00 00    	nop       
    2e00:	00 06 00    	nop       
    2e02:	a5 00 00    	nop       
    2e04:	00 fe 00    	nop       
    2e06:	a5 00 00    	nop       
    2e08:	00 00 00    	nop       
    2e0a:	a6 00 00    	nop       
    2e0c:	00 3e 00    	nop       
    2e0e:	aa 00 00    	nop       
    2e10:	00 40 00    	nop       
    2e12:	aa 00 00    	nop       
    2e14:	00 42 00    	nop       
    2e16:	aa 00 00    	nop       
    2e18:	00 44 00    	nop       
    2e1a:	aa 00 00    	nop       
    2e1c:	00 9a 00    	nop       
    2e1e:	91 00 00    	nop       
    2e20:	00 9b 00    	nop       
    2e22:	91 00 00    	nop       
    2e24:	00 9c 00    	nop       
    2e26:	91 00 00    	nop       
    2e28:	00 9d 00    	nop       
    2e2a:	91 00 00    	nop       
    2e2c:	00 9e 00    	nop       
    2e2e:	91 00 00    	nop       
    2e30:	00 9f 00    	nop       
    2e32:	91 00 00    	nop       
    2e34:	00 a0 00    	nop       
    2e36:	91 00 00    	nop       
    2e38:	00 a1 00    	nop       
    2e3a:	91 00 00    	nop       
    2e3c:	00 f2 00    	nop       
    2e3e:	95 00 00    	nop       
    2e40:	00 f3 00    	nop       
    2e42:	95 00 00    	nop       
    2e44:	00 f4 00    	nop       
    2e46:	95 00 00    	nop       
    2e48:	00 d0 00    	nop       
    2e4a:	01 00 00    	nop       
    2e4c:	00 d0 00    	nop       
    2e4e:	02 00 00    	nop       
    2e50:	00 d2 00    	nop       
    2e52:	02 00 00    	nop       
    2e54:	00 d4 00    	nop       
    2e56:	02 00 00    	nop       
    2e58:	00 d6 00    	nop       
    2e5a:	02 00 00    	nop       
    2e5c:	00 d8 00    	nop       
    2e5e:	02 00 00    	nop       
    2e60:	00 da 00    	nop       
    2e62:	02 00 00    	nop       
    2e64:	00 dc 00    	nop       
    2e66:	02 00 00    	nop       
    2e68:	00 08 00    	nop       
    2e6a:	05 00 00    	nop       
    2e6c:	00 0a 00    	nop       
    2e6e:	05 00 00    	nop       
    2e70:	00 0c 00    	nop       
    2e72:	05 00 00    	nop       
    2e74:	00 0e 00    	nop       
    2e76:	05 00 00    	nop       
    2e78:	00 10 00    	nop       
    2e7a:	05 00 00    	nop       
    2e7c:	00 12 00    	nop       
    2e7e:	05 00 00    	nop       
    2e80:	00 14 00    	nop       
    2e82:	05 00 00    	nop       
    2e84:	00 52 00    	nop       
    2e86:	1a 00 00    	nop       
    2e88:	00 53 00    	nop       
    2e8a:	1a 00 00    	nop       
    2e8c:	00 54 00    	nop       
    2e8e:	1a 00 00    	nop       
    2e90:	00 55 00    	nop       
    2e92:	1a 00 00    	nop       
    2e94:	00 56 00    	nop       
    2e96:	1a 00 00    	nop       
    2e98:	00 52 00    	nop       
    2e9a:	1b 00 00    	nop       
    2e9c:	00 53 00    	nop       
    2e9e:	1b 00 00    	nop       
    2ea0:	00 54 00    	nop       
    2ea2:	1b 00 00    	nop       
    2ea4:	00 a5 00    	nop       
    2ea6:	1f 00 00    	nop       
    2ea8:	00 a6 00    	nop       
    2eaa:	1f 00 00    	nop       
    2eac:	00 a7 00    	nop       
    2eae:	1f 00 00    	nop       
    2eb0:	00 fe 00    	nop       
    2eb2:	24 00 00    	nop       
    2eb4:	00 00 00    	nop       
    2eb6:	25 00 00    	nop       
    2eb8:	00 02 00    	nop       
    2eba:	25 00 00    	nop       
    2ebc:	00 04 00    	nop       
    2ebe:	25 00 00    	nop       
    2ec0:	00 06 00    	nop       
    2ec2:	25 00 00    	nop       
    2ec4:	00 fe 00    	nop       
    2ec6:	25 00 00    	nop       
    2ec8:	00 00 00    	nop       
    2eca:	26 00 00    	nop       
    2ecc:	00 3e 00    	nop       
    2ece:	2a 00 00    	nop       
    2ed0:	00 40 00    	nop       
    2ed2:	2a 00 00    	nop       
    2ed4:	00 42 00    	nop       
    2ed6:	2a 00 00    	nop       
    2ed8:	00 44 00    	nop       
    2eda:	2a 00 00    	nop       
    2edc:	00 9a 00    	nop       
    2ede:	11 00 00    	nop       
    2ee0:	00 9b 00    	nop       
    2ee2:	11 00 00    	nop       
    2ee4:	00 9c 00    	nop       
    2ee6:	11 00 00    	nop       
    2ee8:	00 9d 00    	nop       
    2eea:	11 00 00    	nop       
    2eec:	00 9e 00    	nop       
    2eee:	11 00 00    	nop       
    2ef0:	00 9f 00    	nop       
    2ef2:	11 00 00    	nop       
    2ef4:	00 a0 00    	nop       
    2ef6:	11 00 00    	nop       
    2ef8:	00 a1 00    	nop       
    2efa:	11 00 00    	nop       
    2efc:	00 f2 00    	nop       
    2efe:	15 00 00    	nop       
    2f00:	00 f3 00    	nop       
    2f02:	15 00 00    	nop       
    2f04:	00 f4 00    	nop       
    2f06:	15 00 00    	nop       
    2f08:	00 d0 00    	nop       
    2f0a:	01 00 00    	nop       
    2f0c:	00 d0 00    	nop       
    2f0e:	02 00 00    	nop       
    2f10:	00 d2 00    	nop       
    2f12:	02 00 00    	nop       
    2f14:	00 d4 00    	nop       
    2f16:	02 00 00    	nop       
    2f18:	00 d6 00    	nop       
    2f1a:	02 00 00    	nop       
    2f1c:	00 d8 00    	nop       
    2f1e:	02 00 00    	nop       
    2f20:	00 da 00    	nop       
    2f22:	02 00 00    	nop       
    2f24:	00 dc 00    	nop       
    2f26:	02 00 00    	nop       
    2f28:	00 08 00    	nop       
    2f2a:	05 00 00    	nop       
    2f2c:	00 0a 00    	nop       
    2f2e:	05 00 00    	nop       
    2f30:	00 0c 00    	nop       
    2f32:	05 00 00    	nop       
    2f34:	00 0e 00    	nop       
    2f36:	05 00 00    	nop       
    2f38:	00 10 00    	nop       
    2f3a:	05 00 00    	nop       
    2f3c:	00 12 00    	nop       
    2f3e:	05 00 00    	nop       
    2f40:	00 14 00    	nop       
    2f42:	05 00 00    	nop       
    2f44:	00 fe 00    	nop       
    2f46:	24 00 00    	nop       
    2f48:	00 00 00    	nop       
    2f4a:	25 00 00    	nop       
    2f4c:	00 02 00    	nop       
    2f4e:	25 00 00    	nop       
    2f50:	00 04 00    	nop       
    2f52:	25 00 00    	nop       
    2f54:	00 06 00    	nop       
    2f56:	25 00 00    	nop       
    2f58:	00 fe 00    	nop       
    2f5a:	25 00 00    	nop       
    2f5c:	00 00 00    	nop       
    2f5e:	26 00 00    	nop       
    2f60:	00 3e 00    	nop       
    2f62:	2a 00 00    	nop       
    2f64:	00 40 00    	nop       
    2f66:	2a 00 00    	nop       
    2f68:	00 42 00    	nop       
    2f6a:	2a 00 00    	nop       
    2f6c:	00 44 00    	nop       
    2f6e:	2a 00 00    	nop       
    2f70:	00 00 00    	nop       
    2f72:	e0 96 20    	mov\.w     #0x96e \<\.sizeof\.\.text\>, w0
    2f74:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
    2f76:	c0 aa 20    	mov\.w     #0xaac \<\.sizeof\.\.data\>, w0
    2f78:	00 a9 20    	mov\.w     #0xa90 \<\.sizeof\.foo_x\>, w0
    2f7a:	80 8b 20    	mov\.w     #0x8b8 \<\.sizeof\.\.const\>, w0
    2f7c:	00 10 20    	mov\.w     #0x100 \<\.handle\>, w0
    2f7e:	00 80 20    	mov\.w     #0x800 \<data0_a\>, w0
    2f80:	20 a5 21    	mov\.w     #0x1a52 \<\.startof\.foo_r\>, w0
    2f82:	e0 4f 22    	mov\.w     #0x24fe \<foo_x0_a\>, w0
    2f84:	a0 19 21    	mov\.w     #0x119a \<\.startof\.\.const\>, w0

00002f86 \<foo_x7_b\>:
    2f86:	37 00 00    	nop       

00002f88 \<foo_x8_b\>:
    2f88:	38 00 00    	nop       

00002f8a \<foo_x9_b\>:
    2f8a:	39 00 00    	nop       

00002f8c \<foo_xa_b\>:
    2f8c:	3a 00 00    	nop       
