.global __reset
__reset=0
.pword 0x332211

.section low_code,code,address(0x80)
.pword 0x665544

.section high_code,code,address(0x5000)
.pword 0x998877

.section low_data,bss,address(0x80)
.space 8

.section high_data,bss,address(0x5000)
.space 8

.section low_eedata,eedata,address(0xE00)
.space 8

.section high_eedata,eedata,address(0x7FFE00)
.space 8

