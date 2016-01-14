  .section f,eedata,address(0x2000)
  .word 0x1234
  
  .section d,data,address(0x900)
  .space 1
  
  .section f
  .word 0x5678
  .end
