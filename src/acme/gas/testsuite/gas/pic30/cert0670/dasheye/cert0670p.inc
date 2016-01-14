; Test file dependency information with up to 15 levels of nesting.
                  .ifndef cert670p_inc
                  .equiv cert670p_inc, 1
                  .endif
                  
                  .if (cert670p_inc < 500-8)
                  .set cert670p_inc, cert670p_inc + 1
                  
                  .include "cert0670p.inc"

                  .endif                  
