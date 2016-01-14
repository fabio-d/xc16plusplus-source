          .text
          btsc.b [w0], #0
          btss.b [w0], #0
          btst.b [w0], #0
          btsts.b [w0], #0
          
          btsc.b [w15], #0
          btss.b [w15], #0
          btst.b [w15], #0
          btsts.b [w15], #0
          
          btsc.b [w15], #7
          btss.b [w15], #7
          btst.b [w15], #7
          btsts.b [w15], #7

         .end
 
