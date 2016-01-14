#as: 
#objdump: -d
#name: SSR 18776: Range checking for LDWLO

dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<\.text\>:
   0:	70 f8 93    	mov\.b     \[w0\+511\], w0
   2:	60 f8 93    	mov\.b     \[w0\+510\], w0
   4:	00 40 94    	mov\.b     \[w0-512\], w0
   6:	10 40 94    	mov\.b     \[w0-511\], w0
   8:	70 b8 93    	mov\.w     \[w0\+1022\], w0
   a:	60 b8 93    	mov\.w     \[w0\+1020\], w0
   c:	00 00 94    	mov\.w     \[w0-1024\], w0
   e:	10 00 94    	mov\.w     \[w0-1022\], w0
