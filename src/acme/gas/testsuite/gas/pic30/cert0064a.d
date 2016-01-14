#as:
#name: .end End Program directive
#source: cert0064a.s



.*  .*cert0064a\.s 			page 1
cert0064a \.end End program directive
subtitle1 test
   1              	
   2              		\.title cert0064a \.end End program directive
   3              		\.sbttl subtitle1 test
   4              	
   5              		
   6              		\.data
   7                 	
   8                 		\.text
   9              		\.global main
  10 000000  00 00 04 		goto externdefine
  10         00 00 00 
  11 000004  00 00 04 		goto main2
  11         00 00 00 
  12 000008  00 00 FF 		nopr
  13              		\.global foo
  14 00000a  00 00 FF 	foo:	nopr
  15              	
  16              		
  17 00000c  55 00 20 	main:	MOV #5, w5
  18 00000e  16 00 20 		MOV #1, w6
  19              		
  20              		\.end
