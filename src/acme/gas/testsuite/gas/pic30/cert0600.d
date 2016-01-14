#as: 
#name: Switching between code and data sections and verify correct location-counter update
#source: cert0600.s

MPLAB ASM30 Listing:  .+cert0600\.s 			page 1


   1              	; This test file switches between \.data and \.text sections several times\.
   2              	; This test is intended to verify that the location counter updates correctly\.
   3              	
   4              	        /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
   5              	                     Start of assembly code               
   6              	        \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
   7              	         ; Define a macro/pseudo-instruction for the undocumented HALT instruction\.
   8              	         \.macro HALT
   9              	            \.pword 0xDA4000
  10              	         \.endm
  11              	
 2609              	\.LIST
 2610              	
 2611              	        \.global _main
 2612              	        \.global __FWDT
 2613              	
 2614              	        \.equiv stacksize, 0
 2615              	
 2616              	       /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
 2617              	          Constant section                                
 2618              	       \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
 2619              	; Use data allocation directives rather than constants\.
 2620              	              \.data
 2621 0000 00 00 00 00 	errnum:       \.int   0
 2622 0004 00 00       	testnum:      \.space 2         ; Holds the test number
 2623 0006 00 00       	ObsrvdVal:    \.space 2         ; ObsrvdVal is used in fail routine 
 2624                 	                               ;   to output the observed value of flag 
 2625 0008 00 00       	ExpctdVal:    \.space 2         ; ExpctdVal is used in fail routine
 2626                 	                               ;   to output the expected value of flag 
 2627 000a 00 00 00 00 	ExpctdAcc:    \.space 6
 2627      00 00 
 2628 0010 00 00       	accErr   :    \.space 2
 2629                 	
 2630                 	        \.section __FWDT,code
 2631              	__FWDT:
 2632 000000  C0 7F 00 	        \.pword    WDT_OFF & WDTPSA_1 & WDTPSB_1
 2633              	           \.text
 2634              	       /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
 2635              	               Assembly code section                            
 2636              	       \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
 2637              	
 2638              	; Use _main instead of __reset so that the C startup libraries run
 2639              	; and initialize the stack, idata, etc\.
 2640              	
 2641              	_main:
 2642              	
 2643              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2644              	         ;\*     Disable arithmetic warning trap\.              \*;
 2645              	         ;\*      \(Clear OVATE, OVBTE,COVTE bits in INTCON1\)\.  \*;
 2646              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2647 000000  00 20 EF 	         clr INTCON1
 2648              	
 2649              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 2650              	         ;\*    Disable Saturation for Accumulators\.           \*;
 2651              	         ;\*             \(Clear SATA and SATB in CORCON\)       \*;
 2652              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2653 000002  00 E0 A9 	          bclr CORCON, \#SATA
MPLAB ASM30 Listing:  .+cert0600\.s 			page 2


 2654 000004  00 C0 A9 	          bclr CORCON, \#SATB
 2655              	          
 2656 000006  00 00 04 	          goto test1
 2656         00 00 00 
 2657              	          
 2658              	          \.data
 2659 0012 43 68 65 63 	failAccA: \.asciz \"Check on Accumulator A failed, test \%d\\n\"
 2659      6B 20 6F 6E 
 2659      20 41 63 63 
 2659      75 6D 75 6C 
 2659      61 74 6F 72 
 2659      20 41 20 66 
 2659      61 69 6C 65 
 2659      64 2C 20 74 
 2659      65 73 74 20 
 2660                 	          \.text
 2661              	          
 2662              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2663              	         ;\*  TEST 1 \(Test for result within allowed range\)    \*;
 2664              	         ;\*  0x00 7fff ffff - 0x00 00ff ff00 = 0x00 7f00 00ff \*;
 2665              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2666              	
 2667 00000a  04 20 EC 	test1:    inc testnum
 2668 00000c  12 01 C3 	          clr A                     ; Set initial conditions, 
 2669 00000e  12 81 C3 	          clr B                     ; This will clear all overflow and
 2670              	                                    ;  saturation flags in SR register\. 
 2671 000010  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 2672              	                                    ;  saturation flags now\.  
 2673              	
 2674 000012  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0x00 7fff ffff\.
 2675 000014  00 00 88 	          mov w0, ACCAL
 2676 000016  F0 FF 27 	          mov \#0x7fff, w0
 2677 000018  00 00 88 	          mov w0, ACCAH
 2678 00001a  00 00 20 	          mov \#0x0000, w0
 2679 00001c  00 00 88 	          mov w0, ACCAU
 2680              	
 2681 00001e  00 F0 2F 	          mov \#0xff00,w0            ; Load B with 0x00 00ff ff00\.
 2682 000020  00 00 88 	          mov w0, ACCBL
 2683 000022  F0 0F 20 	          mov \#0x00ff, w0
 2684 000024  00 00 88 	          mov w0, ACCBH
 2685 000026  00 00 20 	          mov \#0x0000, w0
 2686 000028  00 00 88 	          mov w0, ACCBU
 2687              	
 2688 00002a  00 30 CB 	          sub A                     ; Perform subtraction
 2689              	
 2690 00002c  F0 0F 20 	          mov \#0x00ff, w0           ; Check result in A = 0x00 7f00 00ff\.
 2691 00002e  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 2692              	                                    ;   for display routine
 2693 000030  00 20 A9 	          bclr  SR, \#Z
 2694 000032  00 00 E3 	          cp    ACCAL               ; If not equal branch to fail\.
 2695 000034  00 20 AE 	          btss  SR, \#Z
 2696 000036  00 00 02 	          call  fail_AccAChk
 2696         00 00 00 
 2697 00003a  00 F0 27 	          mov   \#0x7f00, w0
 2698 00003c  10 00 88 	          mov   w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 2699              	                                    ;   for display routine
 2700 00003e  00 20 A9 	          bclr  SR, \#Z
MPLAB ASM30 Listing:  .+cert0600\.s 			page 3


 2701 000040  00 00 E3 	          cp    ACCAH
 2702 000042  00 20 AE 	          btss  SR, \#Z
 2703 000044  00 00 02 	          call  fail_AccAChk
 2703         00 00 00 
 2704 000048  00 00 20 	          mov   \#0x0000, w0
 2705 00004a  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 2706              	                                    ;   for display routine
 2707 00004c  00 20 A9 	          bclr  SR, \#Z
 2708 00004e  00 00 E3 	          cp    ACCAU
 2709 000050  00 20 AE 	          btss  SR, \#Z
 2710 000052  00 00 02 	          call  fail_AccAChk
 2710         00 00 00 
 2711              	
 2712 000056  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 2713 000058  00 20 AE 	          btss  SR, \#Z
 2714 00005a  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 2714         00 00 00 
 2715              	                                    ;   branch and display accumulator\.
 2716              	
 2717 00005e  00 F0 2F 	          mov   \#0xff00, w0           ; Verify that there is no change in B value\.
 2718 000060  00 00 88 	          mov   w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 2719              	                                    ;   for display routine
 2720 000062  00 20 A9 	          bclr  SR, \#Z
 2721 000064  00 00 E3 	          cp    ACCBL
 2722 000066  00 20 AE 	          btss  SR, \#Z
 2723 000068  00 00 02 	          call  fail_AccBChk
 2723         00 00 00 
 2724 00006c  F0 0F 20 	          mov   \#0x00ff, w0
 2725 00006e  10 00 88 	          mov   w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 2726              	                                    ;   for display routine
 2727 000070  00 20 A9 	          bclr  SR, \#Z
 2728 000072  00 00 E3 	          cp    ACCBH
 2729 000074  00 20 AE 	          btss  SR, \#Z
 2730 000076  00 00 02 	          call  fail_AccBChk
 2730         00 00 00 
 2731 00007a  00 00 20 	          mov   \#0x0000, w0
 2732 00007c  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU,
 2733              	                                    ;   for display routine
 2734 00007e  00 20 A9 	          bclr  SR, \#Z
 2735 000080  00 00 E3 	          cp    ACCBU
 2736 000082  00 20 AE 	          btss  SR, \#Z
 2737 000084  00 00 02 	          call  fail_AccBChk
 2737         00 00 00 
 2738              	
 2739 000088  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 2740 00008a  00 20 AE 	          btss  SR, \#Z
 2741 00008c  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 2741         00 00 00 
 2742              	                                    ;   branch and display accumulator\.
 2743              	
 2744 000090  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 2745              	                                    ;   following checks is 1
 2746 000092  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 2747              	                                    ;   following checks is 0 
 2748 000094  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 2749 000096  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 2749         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 4


 2750 00009a  01 80 AF 	          btsc SR, \#SB
 2751 00009c  00 00 02 	          call fail_SB
 2751         00 00 00 
 2752 0000a0  01 60 AF 	          btsc SR, \#OAB
 2753 0000a2  00 00 02 	          call fail_OAB
 2753         00 00 00 
 2754 0000a6  01 40 AF 	          btsc SR, \#SAB
 2755 0000a8  00 00 02 	          call fail_SAB
 2755         00 00 00 
 2756 0000ac  01 E0 AF 	          btsc SR, \#OA
 2757 0000ae  00 00 02 	          call fail_OA
 2757         00 00 00 
 2758 0000b2  01 A0 AF 	          btsc SR, \#SA
 2759 0000b4  00 00 02 	          call fail_SA
 2759         00 00 00 
 2760              	          
 2761 0000b8  00 00 04 	          goto test2   
 2761         00 00 00 
 2762              	          
 2763              	          \.data
 2764 003a 43 68 65 63 	failAccB: \.asciz \"Check on Accumulator B failed, test \%d\\n\"          
 2764      6B 20 6F 6E 
 2764      20 41 63 63 
 2764      75 6D 75 6C 
 2764      61 74 6F 72 
 2764      20 42 20 66 
 2764      61 69 6C 65 
 2764      64 2C 20 74 
 2764      65 73 74 20 
 2765                 	          \.text
 2766              	
 2767              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 2768              	         ;\*  TEST 2 \(Overflow on B\)                           \*;
 2769              	         ;\*  0xff fbff 7fff - 0x00 7bff 8000 = 0xff 7fff ffff \*;
 2770              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 2771              	
 2772 0000bc  04 20 EC 	test2:    inc testnum
 2773 0000be  12 01 C3 	          clr A                     ; Set initial conditions, 
 2774 0000c0  12 81 C3 	          clr B                     ; This will clear all overflow and
 2775              	                                    ;  saturation flags in SR register\. 
 2776 0000c2  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 2777              	                                    ;  saturation flags now\.  
 2778              	
 2779 0000c4  00 00 28 	          mov \#0x8000,w0            ; Load A with 0x00 7bff 8000\.
 2780 0000c6  00 00 88 	          mov w0, ACCAL
 2781 0000c8  F0 BF 27 	          mov \#0x7bff, w0
 2782 0000ca  00 00 88 	          mov w0, ACCAH
 2783 0000cc  00 00 20 	          mov \#0x0000, w0
 2784 0000ce  00 00 88 	          mov w0, ACCAU
 2785              	
 2786 0000d0  F0 FF 27 	          mov \#0x7fff,w0            ; Load B with 0xff fbff 7fff\.
 2787 0000d2  00 00 88 	          mov w0, ACCBL
 2788 0000d4  F0 BF 2F 	          mov \#0xfbff, w0
 2789 0000d6  00 00 88 	          mov w0, ACCBH
 2790 0000d8  F0 FF 2F 	          mov \#0xffff, w0
 2791 0000da  00 00 88 	          mov w0, ACCBU
 2792              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 5


 2793 0000dc  00 B0 CB 	          sub B
 2794              	
 2795 0000de  F0 FF 2F 	          mov   \#0xffff, w0           ; Check result in B = 0xff 7fff ffff\.
 2796 0000e0  00 00 88 	          mov   w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 2797              	                                    ;   for display routine
 2798 0000e2  00 20 A9 	          bclr  SR, \#Z
 2799 0000e4  00 00 E3 	          cp    ACCBL
 2800 0000e6  00 20 AE 	          btss  SR, \#Z
 2801 0000e8  00 00 02 	          call  fail_AccBChk
 2801         00 00 00 
 2802 0000ec  F0 FF 27 	          mov   \#0x7fff, w0
 2803 0000ee  10 00 88 	          mov   w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH,
 2804              	                                    ;   for display routine
 2805 0000f0  00 00 E3 	          cp    ACCBH
 2806 0000f2  00 20 AE 	          btss  SR, \#Z
 2807 0000f4  00 00 02 	          call  fail_AccBChk
 2807         00 00 00 
 2808 0000f8  F0 FF 2F 	          mov   \#0xffff, w0
 2809 0000fa  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 2810              	                                    ;   for display routine
 2811 0000fc  00 00 E3 	          cp    ACCBU               ; If not equal branch to fail\.
 2812 0000fe  00 20 AE 	          btss  SR, \#Z
 2813 000100  00 00 02 	          call  fail_AccBChk 
 2813         00 00 00 
 2814              	
 2815 000104  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 2816 000106  00 20 AE 	          btss  SR, \#Z
 2817 000108  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 2817         00 00 00 
 2818              	                                    ;   branch and display accumulator\.
 2819              	 
 2820 00010c  00 00 28 	          mov   \#0x8000, w0
 2821 00010e  00 00 88 	          mov   w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 2822              	                                    ;   for display routine
 2823 000110  00 20 A9 	          bclr  SR, \#Z
 2824 000112  00 00 E3 	          cp    ACCAL
 2825 000114  00 20 AE 	          btss  SR, \#Z
 2826 000116  00 00 02 	          call  fail_AccAChk
 2826         00 00 00 
 2827 00011a  F0 BF 27 	          mov   \#0x7bff, w0
 2828 00011c  10 00 88 	          mov   w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 2829              	                                    ;   for display routine
 2830 00011e  00 00 E3 	          cp    ACCAH
 2831 000120  00 20 AE 	          btss  SR, \#Z
 2832 000122  00 00 02 	          call  fail_AccAChk
 2832         00 00 00 
 2833 000126  00 00 20 	          mov   \#0x0000, w0           ; Verify that there is no change in A value\.
 2834 000128  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU,
 2835              	                                    ;   for display routine
 2836 00012a  00 00 E3 	          cp    ACCAU
 2837 00012c  00 20 AE 	          btss  SR, \#Z
 2838 00012e  00 00 02 	          call  fail_AccAChk
 2838         00 00 00 
 2839              	
 2840 000132  10 00 E2 	          cp0   accErr             ; accErr is incremented in fail routine,
 2841 000134  00 20 AE 	          btss  SR, \#Z
 2842 000136  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
MPLAB ASM30 Listing:  .+cert0600\.s 			page 6


 2842         00 00 00 
 2843              	                                    ;   branch and display accumulator\.
 2844              	
 2845 00013a  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 2846              	                                    ;   following checks is 0
 2847 00013c  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 2848              	                                    ;   following checks is 1
 2849 00013e  01 C0 AE 	          btss SR, \#OB              ; Verify SB = 0; OB = 1; SAB = 0; OAB = 1;
 2850 000140  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 2850         00 00 00 
 2851 000144  01 60 AE 	          btss SR, \#OAB
 2852 000146  00 00 02 	          call fail_OAB
 2852         00 00 00 
 2853              	
 2854 00014a  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 2855              	                                    ;   following checks is 1
 2856 00014c  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 2857              	                                    ;   following checks is 0
 2858 00014e  01 80 AF 	          btsc SR, \#SB
 2859 000150  00 00 02 	          call fail_SB
 2859         00 00 00 
 2860 000154  01 40 AF 	          btsc SR, \#SAB
 2861 000156  00 00 02 	          call fail_SAB
 2861         00 00 00 
 2862 00015a  01 E0 AF 	          btsc SR, \#OA
 2863 00015c  00 00 02 	          call fail_OA
 2863         00 00 00 
 2864 000160  01 A0 AF 	          btsc SR, \#SA
 2865 000162  00 00 02 	          call fail_SA
 2865         00 00 00 
 2866              	          
 2867 000166  00 00 04 	          goto test3     
 2867         00 00 00 
 2868              	          
 2869              	          \.data
 2870 0062 4F 41 20 62 	failOA:   \.asciz \"OA bit check fail: SUBAB, test \%d\\n\"
 2870      69 74 20 63 
 2870      68 65 63 6B 
 2870      20 66 61 69 
 2870      6C 3A 20 53 
 2870      55 42 41 42 
 2870      2C 20 74 65 
 2870      73 74 20 25 
 2870      64 0A 00 
 2871                 	          \.text          
 2872              	
 2873              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2874              	         ;\*  TEST 3 \(Catastrophic Overflow on A\)              \*;
 2875              	         ;\*  0x80 00ff 8001 - 0x7f 0000 0000 = 0x01 00ff 8001 \*;
 2876              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2877              	
 2878 00016a  04 20 EC 	test3:    inc testnum
 2879 00016c  12 01 C3 	          clr A                     ; Set initial conditions, 
 2880 00016e  12 81 C3 	          clr B                     ; This will clear all overflow and
 2881              	                                    ;  saturation flags in SR register\.
 2882 000170  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear
 2883              	                                    ;  saturation flags now\.
MPLAB ASM30 Listing:  .+cert0600\.s 			page 7


 2884              	
 2885 000172  10 00 28 	          mov \#0x8001,w0            ; Load A with 0x80 00ff 8001\.
 2886 000174  00 00 88 	          mov w0, ACCAL
 2887 000176  F0 0F 20 	          mov \#0x00ff, w0
 2888 000178  00 00 88 	          mov w0, ACCAH
 2889 00017a  00 F8 2F 	          mov \#0xff80, w0
 2890 00017c  00 00 88 	          mov w0, ACCAU
 2891              	
 2892 00017e  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x7f 0000 0000\.
 2893 000180  00 00 88 	          mov w0, ACCBL
 2894 000182  00 00 20 	          mov \#0x0000, w0
 2895 000184  00 00 88 	          mov w0, ACCBH
 2896 000186  F0 07 20 	          mov \#0x007f, w0
 2897 000188  00 00 88 	          mov w0, ACCBU
 2898              	
 2899 00018a  00 30 CB 	          sub A
 2900              	
 2901 00018c  10 00 28 	          mov \#0x8001, w0
 2902 00018e  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 2903              	                                    ;   for display routine
 2904 000190  00 20 A9 	          bclr  SR, \#Z
 2905 000192  00 00 E3 	          cp    ACCAL
 2906 000194  00 20 AE 	          btss  SR, \#Z
 2907 000196  00 00 02 	          call fail_AccAChk
 2907         00 00 00 
 2908 00019a  F0 0F 20 	          mov \#0x00ff, w0
 2909 00019c  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 2910              	                                    ;   for display routine
 2911 00019e  00 00 E3 	          cp ACCAH
 2912 0001a0  00 20 AE 	          btss  SR, \#Z
 2913 0001a2  00 00 02 	          call fail_AccAChk
 2913         00 00 00 
 2914 0001a6  10 00 20 	          mov \#0x0001, w0           ; Check result in A = 0x01 00ff 8001\.
 2915 0001a8  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU,
 2916              	                                    ;   for display routine
 2917 0001aa  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\.
 2918 0001ac  00 20 AE 	          btss  SR, \#Z
 2919 0001ae  00 00 02 	          call fail_AccAChk
 2919         00 00 00 
 2920              	
 2921 0001b2  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 2922 0001b4  00 20 AE 	          btss  SR, \#Z
 2923 0001b6  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 2923         00 00 00 
 2924              	                                    ;   branch and display accumulator\.
 2925              	
 2926 0001ba  00 00 20 	          mov \#0x0000, w0
 2927 0001bc  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 2928              	                                    ;   for display routine
 2929 0001be  00 00 E3 	          cp ACCBL
 2930 0001c0  00 20 AE 	          btss  SR, \#Z
 2931 0001c2  00 00 02 	          call fail_AccBChk
 2931         00 00 00 
 2932 0001c6  00 00 20 	          mov \#0x0000, w0
 2933 0001c8  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH,
 2934              	                                    ;   for display routine
 2935 0001ca  00 00 E3 	          cp ACCBH
MPLAB ASM30 Listing:  .+cert0600\.s 			page 8


 2936 0001cc  00 20 AE 	          btss  SR, \#Z
 2937 0001ce  00 00 02 	          call fail_AccBChk
 2937         00 00 00 
 2938 0001d2  F0 07 20 	          mov \#0x007f, w0           ; Verify that there is no change in B value\.
 2939 0001d4  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 2940              	                                    ;   for display routine
 2941 0001d6  00 00 E3 	          cp ACCBU
 2942 0001d8  00 20 AE 	          btss  SR, \#Z
 2943 0001da  00 00 02 	          call fail_AccBChk
 2943         00 00 00 
 2944              	
 2945 0001de  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 2946 0001e0  00 20 AE 	          btss  SR, \#Z
 2947 0001e2  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 2947         00 00 00 
 2948              	                                    ;   branch and display accumulator\.
 2949              	
 2950 0001e6  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 2951              	                                    ;   following checks is 0
 2952 0001e8  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 2953              	                                    ;   following checks is 1
 2954 0001ea  01 60 AE 	          btss SR, \#OAB
 2955 0001ec  00 00 02 	          call fail_OAB
 2955         00 00 00 
 2956 0001f0  01 40 AE 	          btss SR, \#SAB
 2957 0001f2  00 00 02 	          call fail_SAB
 2957         00 00 00 
 2958 0001f6  01 E0 AE 	          btss SR, \#OA
 2959 0001f8  00 00 02 	          call fail_OA
 2959         00 00 00 
 2960 0001fc  01 A0 AE 	          btss SR, \#SA
 2961 0001fe  00 00 02 	          call fail_SA
 2961         00 00 00 
 2962              	
 2963 000202  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 2964              	                                    ;   following checks is 1
 2965 000204  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 2966              	                                    ;   following checks is 0
 2967              	
 2968 000206  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
 2969 000208  00 00 02 	          call fail_OB              ;    SA = 1, OA = 1\.
 2969         00 00 00 
 2970 00020c  01 80 AF 	          btsc SR, \#SB
 2971 00020e  00 00 02 	          call fail_SB
 2971         00 00 00 
 2972              	
 2973              	          \.data
 2974 0085 4F 42 20 62 	failOB:   \.asciz \"OB bit check fail: SUBAB, test \%d\\n\"
 2974      69 74 20 63 
 2974      68 65 63 6B 
 2974      20 66 61 69 
 2974      6C 3A 20 53 
 2974      55 42 41 42 
 2974      2C 20 74 65 
 2974      73 74 20 25 
 2974      64 0A 00 
 2975                 	          \.text
MPLAB ASM30 Listing:  .+cert0600\.s 			page 9


 2976              	
 2977              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2978              	         ;\*  TEST 4 \(Catastrophic Overflow on B\)              \*;
 2979              	         ;\*  0x7f 8001 ffff - 0xff 8000 0000 = 0x80 0001 ffff \*;
 2980              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 2981              	
 2982 000212  04 20 EC 	test4:    inc testnum
 2983 000214  12 01 C3 	          clr A                     ; Set initial conditions,
 2984 000216  12 81 C3 	          clr B                     ; This will clear all overflow and
 2985              	                                    ;  saturation flags in SR register\.
 2986              	
 2987 000218  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear
 2988              	                                    ;  saturation flags now\.
 2989              	
 2990 00021a  00 00 20 	          mov \#0x0000,w0            ; Load A with 0xff 8000 0000\.
 2991 00021c  00 00 88 	          mov w0, ACCAL
 2992 00021e  00 00 28 	          mov \#0x8000, w0
 2993 000220  00 00 88 	          mov w0, ACCAH
 2994 000222  F0 FF 2F 	          mov \#0xffff, w0
 2995 000224  00 00 88 	          mov w0, ACCAU
 2996              	
 2997 000226  F0 FF 2F 	          mov \#0xffff,w0            ; Load B with 0x7f 8001 ffff\.
 2998 000228  00 00 88 	          mov w0, ACCBL
 2999 00022a  10 00 28 	          mov \#0x8001, w0
 3000 00022c  00 00 88 	          mov w0, ACCBH
 3001 00022e  F0 07 20 	          mov \#0x007f, w0
 3002 000230  00 00 88 	          mov w0, ACCBU
 3003              	
 3004 000232  00 B0 CB 	          sub B
 3005              	
 3006 000234  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in B = 0x80 0001 ffff\.
 3007 000236  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 3008              	                                    ;   for display routine
 3009 000238  00 20 A9 	          bclr SR, \#Z
 3010 00023a  00 00 E3 	          cp ACCBL
 3011 00023c  00 20 AE 	          btss SR, \#Z
 3012 00023e  00 00 02 	          call fail_AccBChk
 3012         00 00 00 
 3013 000242  10 00 20 	          mov \#0x0001, w0
 3014 000244  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH,
 3015              	                                    ;   for display routine
 3016 000246  00 00 E3 	          cp ACCBH
 3017 000248  00 20 AE 	          btss SR, \#Z
 3018 00024a  00 00 02 	          call fail_AccBChk
 3018         00 00 00 
 3019 00024e  00 F8 2F 	          mov \#0xff80, w0
 3020 000250  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU,
 3021              	                                    ;   for display routine
 3022 000252  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\.
 3023 000254  00 20 AE 	          btss SR, \#Z
 3024 000256  00 00 02 	          call fail_AccBChk
 3024         00 00 00 
 3025              	
 3026 00025a  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3027 00025c  00 20 AE 	          btss  SR, \#Z
 3028 00025e  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3028         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 10


 3029              	                                    ;   branch and display accumulator\.
 3030              	
 3031 000262  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in A value\.
 3032 000264  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 3033              	                                    ;   for display routine
 3034 000266  00 20 A9 	          bclr  SR, \#Z
 3035 000268  00 00 E3 	          cp ACCAL
 3036 00026a  00 20 AE 	          btss SR, \#Z
 3037 00026c  00 00 02 	          call fail_AccAChk
 3037         00 00 00 
 3038 000270  00 00 28 	          mov \#0x8000, w0
 3039 000272  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 3040              	                                    ;   for display routine
 3041 000274  00 00 E3 	          cp ACCAH
 3042 000276  00 20 AE 	          btss  SR, \#Z
 3043 000278  00 00 02 	          call fail_AccAChk
 3043         00 00 00 
 3044 00027c  F0 FF 2F 	          mov \#0xffff, w0
 3045 00027e  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU,
 3046              	                                    ;   for display routine
 3047 000280  00 00 E3 	          cp ACCAU
 3048 000282  00 20 AE 	          btss  SR, \#Z
 3049 000284  00 00 02 	          call fail_AccAChk
 3049         00 00 00 
 3050              	
 3051 000288  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3052 00028a  00 20 AE 	          btss  SR, \#Z
 3053 00028c  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3053         00 00 00 
 3054              	                                    ;   branch and display accumulator\.
 3055              	
 3056 000290  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 3057              	                                    ;   following checks is 0
 3058 000292  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 3059              	                                    ;   following checks is 1
 3060 000294  01 C0 AE 	          btss SR, \#OB              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
 3061 000296  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3061         00 00 00 
 3062 00029a  01 80 AE 	          btss SR, \#SB
 3063 00029c  00 00 02 	          call fail_SB
 3063         00 00 00 
 3064 0002a0  01 60 AE 	          btss SR, \#OAB
 3065 0002a2  00 00 02 	          call fail_OAB
 3065         00 00 00 
 3066 0002a6  01 40 AE 	          btss SR, \#SAB
 3067 0002a8  00 00 02 	          call fail_SAB
 3067         00 00 00 
 3068              	
 3069 0002ac  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3070              	                                    ;   following checks is 1
 3071 0002ae  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3072              	                                    ;   following checks is 0
 3073 0002b0  01 E0 AF 	          btsc SR, \#OA
 3074 0002b2  00 00 02 	          call fail_OA
 3074         00 00 00 
 3075 0002b6  01 A0 AF 	          btsc SR, \#SA
 3076 0002b8  00 00 02 	          call fail_SA
MPLAB ASM30 Listing:  .+cert0600\.s 			page 11


 3076         00 00 00 
 3077              	
 3078              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3079              	         ;\*    Enable 1\.31 Saturation for both Accumulators\.  \*;
 3080              	         ;\*     \(Set SATA and SATB; Clear ACCSAT in CORCON\)   \*;
 3081              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3082              	
 3083 0002bc  00 E0 A8 	         bset CORCON, \#SATA
 3084 0002be  00 C0 A8 	         bset CORCON, \#SATB
 3085 0002c0  00 80 A9 	         bclr CORCON, \#ACCSAT
 3086              	         
 3087 0002c2  00 00 04 	          goto test5   
 3087         00 00 00 
 3088              	          \.data
 3089 00a8 53 41 20 62 	failSA:   \.asciz \"SA bit check fail: SUBAB, test \%d\\n\"
 3089      69 74 20 63 
 3089      68 65 63 6B 
 3089      20 66 61 69 
 3089      6C 3A 20 53 
 3089      55 42 41 42 
 3089      2C 20 74 65 
 3089      73 74 20 25 
 3089      64 0A 00 
 3090                 	          \.text          
 3091              	
 3092              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3093              	         ;\*  TEST 5 \(Test for result within allowed range\)    \*;
 3094              	         ;\*  0xff 8000 0004 - 0xff ff00 0006 = 0xff 80ff fffe \*;
 3095              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3096              	
 3097 0002c6  04 20 EC 	test5:    inc testnum
 3098 0002c8  12 01 C3 	          clr A                     ; Set initial conditions,
 3099 0002ca  12 81 C3 	          clr B                     ; This will clear all overflow and
 3100              	                                    ;  saturation flags in SR register\.
 3101 0002cc  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear
 3102              	                                    ;  saturation flags now\.
 3103              	
 3104 0002ce  40 00 20 	          mov \#0x0004,w0            ; Load A with 0xff 8000 0004\.
 3105 0002d0  00 00 88 	          mov w0, ACCAL
 3106 0002d2  00 00 28 	          mov \#0x8000, w0
 3107 0002d4  00 00 88 	          mov w0, ACCAH
 3108 0002d6  F0 FF 2F 	          mov \#0xffff, w0
 3109 0002d8  00 00 88 	          mov w0, ACCAU
 3110              	
 3111 0002da  60 00 20 	          mov \#0x0006,w0            ; Load B with 0xff ff00 0006\.
 3112 0002dc  00 00 88 	          mov w0, ACCBL
 3113 0002de  00 F0 2F 	          mov \#0xff00, w0
 3114 0002e0  00 00 88 	          mov w0, ACCBH
 3115 0002e2  F0 FF 2F 	          mov \#0xffff, w0
 3116 0002e4  00 00 88 	          mov w0, ACCBU
 3117              	
 3118 0002e6  00 30 CB 	          sub A
 3119              	
 3120 0002e8  E0 FF 2F 	          mov \#0xfffe, w0           ; Check result in A = 0xff 80ff fffe\.
 3121 0002ea  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3122              	                                    ;   for display routine
 3123 0002ec  00 20 A9 	          bclr SR, \#Z
MPLAB ASM30 Listing:  .+cert0600\.s 			page 12


 3124 0002ee  00 00 E3 	          cp ACCAL
 3125 0002f0  00 20 AE 	          btss  SR, \#Z
 3126 0002f2  00 00 02 	          call fail_AccAChk
 3126         00 00 00 
 3127 0002f6  F0 0F 28 	          mov \#0x80ff, w0
 3128 0002f8  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 3129              	                                    ;   for display routine
 3130 0002fa  00 00 E3 	          cp ACCAH
 3131 0002fc  00 20 AE 	          btss  SR, \#Z
 3132 0002fe  00 00 02 	          call fail_AccAChk
 3132         00 00 00 
 3133 000302  F0 FF 2F 	          mov \#0xffff, w0
 3134 000304  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU,
 3135              	                                    ;   for display routine
 3136 000306  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\.
 3137 000308  00 20 AE 	          btss  SR, \#Z
 3138 00030a  00 00 02 	          call fail_AccAChk
 3138         00 00 00 
 3139              	
 3140 00030e  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3141 000310  00 20 AE 	          btss  SR, \#Z
 3142 000312  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3142         00 00 00 
 3143              	                                    ;   branch and display accumulator\.
 3144              	
 3145 000316  60 00 20 	          mov \#0x0006, w0           ; Verify that there is no change in B value\.
 3146 000318  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 3147              	                                    ;   for display routine
 3148 00031a  00 00 E3 	          cp ACCBL
 3149 00031c  00 20 AE 	          btss  SR, \#Z
 3150 00031e  00 00 02 	          call fail_AccBChk
 3150         00 00 00 
 3151 000322  00 F0 2F 	          mov \#0xff00, w0
 3152 000324  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH,
 3153              	                                    ;   for display routine
 3154 000326  00 00 E3 	          cp ACCBH
 3155 000328  00 20 AE 	          btss  SR, \#Z
 3156 00032a  00 00 02 	          call fail_AccBChk
 3156         00 00 00 
 3157 00032e  F0 FF 2F 	          mov \#0xffff, w0
 3158 000330  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU,
 3159              	                                    ;   for display routine
 3160 000332  00 00 E3 	          cp ACCBU
 3161 000334  00 20 AE 	          btss  SR, \#Z
 3162 000336  00 00 02 	          call fail_AccBChk
 3162         00 00 00 
 3163              	
 3164 00033a  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3165 00033c  00 20 AE 	          btss  SR, \#Z
 3166 00033e  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3166         00 00 00 
 3167              	                                    ;   branch and display accumulator\.
 3168              	
 3169 000342  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3170              	                                    ;   following checks is 1
 3171 000344  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3172              	                                    ;   following checks is 0 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 13


 3173 000346  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 3174 000348  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3174         00 00 00 
 3175 00034c  01 80 AF 	          btsc SR, \#SB
 3176 00034e  00 00 02 	          call fail_SB
 3176         00 00 00 
 3177 000352  01 60 AF 	          btsc SR, \#OAB
 3178 000354  00 00 02 	          call fail_OAB
 3178         00 00 00 
 3179 000358  01 40 AF 	          btsc SR, \#SAB
 3180 00035a  00 00 02 	          call fail_SAB
 3180         00 00 00 
 3181 00035e  01 E0 AF 	          btsc SR, \#OA
 3182 000360  00 00 02 	          call fail_OA
 3182         00 00 00 
 3183 000364  01 A0 AF 	          btsc SR, \#SA
 3184 000366  00 00 02 	          call fail_SA
 3184         00 00 00 
 3185              	
 3186              	          \.data
 3187 00cb 53 42 20 62 	failSB:   \.asciz \"SB bit check fail: SUBAB, test \%d\\n\"
 3187      69 74 20 63 
 3187      68 65 63 6B 
 3187      20 66 61 69 
 3187      6C 3A 20 53 
 3187      55 42 41 42 
 3187      2C 20 74 65 
 3187      73 74 20 25 
 3187      64 0A 00 
 3188                 	          \.text
 3189              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3190              	         ;\*  TEST 6 \(Test for result within allowed range\)    \*;
 3191              	         ;\*  0x00 3ff8 f004 - 0xff bffa f004 = 0x00 7ffe 0000 \*;
 3192              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3193              	
 3194 00036a  04 20 EC 	test6:    inc testnum
 3195 00036c  12 01 C3 	          clr A                     ; Set initial conditions, 
 3196 00036e  12 81 C3 	          clr B                     ; This will clear all overflow and
 3197              	                                    ;  saturation flags in SR register\. 
 3198 000370  00 20 EF 	          clr SR                         ; As clr A and Clr B does not clear 
 3199              	                                         ;  saturation flags now\.
 3200              	
 3201 000372  40 00 2F 	          mov \#0xf004,w0            ; Load A with 0xff bffa f004\.
 3202 000374  00 00 88 	          mov w0, ACCAL
 3203 000376  A0 FF 2B 	          mov \#0xbffa, w0
 3204 000378  00 00 88 	          mov w0, ACCAH
 3205 00037a  F0 FF 2F 	          mov \#0xffff, w0
 3206 00037c  00 00 88 	          mov w0, ACCAU
 3207              	
 3208 00037e  40 00 2F 	          mov \#0xf004,w0            ; Load B with 0x00 3ff8 f004\.
 3209 000380  00 00 88 	          mov w0, ACCBL
 3210 000382  80 FF 23 	          mov \#0x3ff8, w0
 3211 000384  00 00 88 	          mov w0, ACCBH
 3212 000386  00 00 20 	          mov \#0x0000, w0
 3213 000388  00 00 88 	          mov w0, ACCBU
 3214              	
 3215 00038a  00 B0 CB 	          sub B
MPLAB ASM30 Listing:  .+cert0600\.s 			page 14


 3216              	
 3217 00038c  00 00 20 	          mov \#0x0000, w0           ; Check result in B = 0x00 7ffe 0000\.
 3218 00038e  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
 3219              	                                    ;   for display routine
 3220 000390  00 20 A9 	          bclr SR, \#Z
 3221 000392  00 00 E3 	          cp ACCBL
 3222 000394  00 20 AE 	          btss  SR, \#Z
 3223 000396  00 00 02 	          call fail_AccBChk
 3223         00 00 00 
 3224 00039a  E0 FF 27 	          mov \#0x7ffe, w0
 3225 00039c  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH,
 3226              	                                    ;   for display routine
 3227 00039e  00 00 E3 	          cp ACCBH
 3228 0003a0  00 20 AE 	          btss  SR, \#Z
 3229 0003a2  00 00 02 	          call fail_AccBChk
 3229         00 00 00 
 3230 0003a6  00 00 20 	          mov \#0x0000, w0
 3231 0003a8  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU,
 3232              	                                    ;   for display routine
 3233 0003aa  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\.
 3234 0003ac  00 20 AE 	          btss  SR, \#Z
 3235 0003ae  00 00 02 	          call fail_AccBChk
 3235         00 00 00 
 3236              	
 3237 0003b2  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3238 0003b4  00 20 AE 	          btss  SR, \#Z
 3239 0003b6  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3239         00 00 00 
 3240              	                                    ;   branch and display accumulator\.
 3241              	
 3242 0003ba  40 00 2F 	          mov \#0xf004, w0           ; Verify that there is no change in A value\.
 3243 0003bc  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 3244              	                                    ;   for display routine
 3245 0003be  00 00 E3 	          cp ACCAL
 3246 0003c0  00 20 AE 	          btss  SR, \#Z
 3247 0003c2  00 00 02 	          call fail_AccAChk
 3247         00 00 00 
 3248 0003c6  A0 FF 2B 	          mov \#0xbffa, w0
 3249 0003c8  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3250              	                                    ;   for display routine
 3251 0003ca  00 00 E3 	          cp ACCAH
 3252 0003cc  00 20 AE 	          btss  SR, \#Z
 3253 0003ce  00 00 02 	          call fail_AccAChk
 3253         00 00 00 
 3254 0003d2  F0 FF 2F 	          mov \#0xffff, w0
 3255 0003d4  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3256              	                                    ;   for display routine
 3257 0003d6  00 00 E3 	          cp ACCAU
 3258 0003d8  00 20 AE 	          btss  SR, \#Z
 3259 0003da  00 00 02 	          call fail_AccAChk
 3259         00 00 00 
 3260              	
 3261 0003de  10 00 E2 	          cp0  accErr             ; accErr is incremented in fail routine,
 3262 0003e0  00 20 AE 	          btss  SR, \#Z
 3263 0003e2  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3263         00 00 00 
 3264              	                                    ;   branch and display accumulator\.
MPLAB ASM30 Listing:  .+cert0600\.s 			page 15


 3265              	
 3266 0003e6  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3267              	                                    ;   following checks is 1
 3268 0003e8  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3269              	                                    ;   following checks is 0 
 3270 0003ea  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 3271 0003ec  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3271         00 00 00 
 3272 0003f0  01 80 AF 	          btsc SR, \#SB
 3273 0003f2  00 00 02 	          call fail_SB
 3273         00 00 00 
 3274 0003f6  01 60 AF 	          btsc SR, \#OAB
 3275 0003f8  00 00 02 	          call fail_OAB
 3275         00 00 00 
 3276 0003fc  01 40 AF 	          btsc SR, \#SAB
 3277 0003fe  00 00 02 	          call fail_SAB
 3277         00 00 00 
 3278 000402  01 E0 AF 	          btsc SR, \#OA
 3279 000404  00 00 02 	          call fail_OA
 3279         00 00 00 
 3280 000408  01 A0 AF 	          btsc SR, \#SA
 3281 00040a  00 00 02 	          call fail_SA
 3281         00 00 00 
 3282              	          
 3283              	          \.data
 3284 00ee 4F 41 42 20 	failOAB:  \.asciz \"OAB bit check fail: SUBAB, test \%d\\n\"
 3284      62 69 74 20 
 3284      63 68 65 63 
 3284      6B 20 66 61 
 3284      69 6C 3A 20 
 3284      53 55 42 41 
 3284      42 2C 20 74 
 3284      65 73 74 20 
 3284      25 64 0A 00 
 3285                 	          \.text
 3286              	          \.data
 3287 0112 53 41 42 20 	failSAB:  \.asciz \"SAB bit check fail: SUBAB, test \%d\\n\"
 3287      62 69 74 20 
 3287      63 68 65 63 
 3287      6B 20 66 61 
 3287      69 6C 3A 20 
 3287      53 55 42 41 
 3287      42 2C 20 74 
 3287      65 73 74 20 
 3287      25 64 0A 00 
 3288                 	          \.text          
 3289              	
 3290              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3291              	         ;\*  TEST 7 \(Test for Positive saturation on A\)       \*;
 3292              	         ;\*  0x00 4800 fffe - 0xff c800 fffe = 0x00 7fff ffff \*;
 3293              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3294              	
 3295 00040e  04 20 EC 	test7:    inc testnum
 3296 000410  12 01 C3 	          clr A                     ; Set initial conditions,
 3297 000412  12 81 C3 	          clr B                     ; This will clear all overflow and
 3298              	                                    ;  saturation flags in SR register\.
 3299 000414  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear
MPLAB ASM30 Listing:  .+cert0600\.s 			page 16


 3300              	                                    ;  saturation flags now\.
 3301 000416  E0 FF 2F 	          mov \#0xfffe,w0            ; Load A with 0x00 4800 fffe\.
 3302 000418  00 00 88 	          mov w0, ACCAL
 3303 00041a  00 80 24 	          mov \#0x4800, w0
 3304 00041c  00 00 88 	          mov w0, ACCAH
 3305 00041e  00 00 20 	          mov \#0x00, w0
 3306 000420  00 00 88 	          mov w0, ACCAU
 3307              	
 3308 000422  E0 FF 2F 	          mov \#0xfffe,w0            ; Load B with 0xff c800 fffe\.
 3309 000424  00 00 88 	          mov w0, ACCBL
 3310 000426  00 80 2C 	          mov \#0xc800, w0
 3311 000428  00 00 88 	          mov w0, ACCBH
 3312 00042a  F0 0F 20 	          mov \#0xff, w0
 3313 00042c  00 00 88 	          mov w0, ACCBU
 3314              	
 3315 00042e  00 30 CB 	          sub A
 3316              	
 3317 000430  F0 FF 2F 	          mov \#0xffff, w0
 3318 000432  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 3319              	                                    ;   for display routine
 3320 000434  00 20 A9 	          bclr  SR, \#Z
 3321 000436  00 00 E3 	          cp ACCAL
 3322 000438  00 20 AE 	          btss  SR, \#Z
 3323 00043a  00 00 02 	          call fail_AccAChk
 3323         00 00 00 
 3324 00043e  F0 FF 27 	          mov \#0x7fff, w0
 3325 000440  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 3326              	                                    ;   for display routine
 3327 000442  00 00 E3 	          cp ACCAH
 3328 000444  00 20 AE 	          btss  SR, \#Z
 3329 000446  00 00 02 	          call fail_AccAChk
 3329         00 00 00 
 3330 00044a  00 00 20 	          mov \#0x0000, w0           ; Check result in A = 0x00 7fff ffff\.
 3331 00044c  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU,
 3332              	                                    ;   for display routine
 3333 00044e  00 00 E3 	          cp    ACCAU               ; If not equal branch to fail\. 
 3334 000450  00 20 AE 	          btss  SR, \#Z
 3335 000452  00 00 02 	          call fail_AccAChk
 3335         00 00 00 
 3336              	
 3337 000456  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3338 000458  00 20 AE 	          btss  SR, \#Z
 3339 00045a  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3339         00 00 00 
 3340              	                                    ;   branch and display accumulator\.
 3341              	
 3342 00045e  E0 FF 2F 	          mov \#0xfffe, w0
 3343 000460  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3344              	                                    ;   for display routine
 3345 000462  00 00 E3 	          cp ACCBL
 3346 000464  00 20 AE 	          btss  SR, \#Z
 3347 000466  00 00 02 	          call fail_AccBChk
 3347         00 00 00 
 3348 00046a  00 80 2C 	          mov \#0xc800, w0
 3349 00046c  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3350              	                                    ;   for display routine
 3351 00046e  00 00 E3 	          cp ACCBH
MPLAB ASM30 Listing:  .+cert0600\.s 			page 17


 3352 000470  00 20 AE 	          btss  SR, \#Z
 3353 000472  00 00 02 	          call fail_AccBChk
 3353         00 00 00 
 3354 000476  F0 FF 2F 	          mov \#0xffff, w0           ; Verify that there is no change in B value\.
 3355 000478  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3356              	                                    ;   for display routine
 3357 00047a  00 00 E3 	          cp ACCBU
 3358 00047c  00 20 AE 	          btss  SR, \#Z
 3359 00047e  00 00 02 	          call fail_AccBChk
 3359         00 00 00 
 3360              	
 3361 000482  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3362 000484  00 20 AE 	          btss  SR, \#Z
 3363 000486  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3363         00 00 00 
 3364              	                                    ;   branch and display accumulator\.
 3365              	
 3366              	
 3367 00048a  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3368              	                                    ;   following checks is 1
 3369 00048c  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3370              	                                    ;   following checks is 0 
 3371 00048e  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
 3372 000490  00 00 02 	          call fail_OB              ;    SA = 1, OA = 0\.
 3372         00 00 00 
 3373 000494  01 80 AF 	          btsc SR, \#SB
 3374 000496  00 00 02 	          call fail_SB
 3374         00 00 00 
 3375 00049a  01 60 AF 	          btsc SR, \#OAB
 3376 00049c  00 00 02 	          call fail_OAB
 3376         00 00 00 
 3377 0004a0  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 3378              	                                    ;   following checks is 0  
 3379 0004a2  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 3380              	                                    ;   following checks is 1  
 3381 0004a4  01 40 AE 	          btss SR, \#SAB
 3382 0004a6  00 00 02 	          call fail_SAB
 3382         00 00 00 
 3383 0004aa  01 E0 AF 	          btsc SR, \#OA
 3384 0004ac  00 00 02 	          call fail_OA
 3384         00 00 00 
 3385 0004b0  01 A0 AE 	          btss SR, \#SA
 3386 0004b2  00 00 02 	          call fail_SA
 3386         00 00 00 
 3387              	
 3388              	          \.data
 3389 0136 70 61 73 73 	passstr:  \.asciz \"pass: SUBAB, test \%d\\n\"
 3389      3A 20 53 55 
 3389      42 41 42 2C 
 3389      20 74 65 73 
 3389      74 20 25 64 
 3389      0A 00 
 3390                 	          \.text
 3391              	
 3392              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3393              	         ;\*  TEST 8 \(Test for Negative saturation on B\)       \*;
 3394              	         ;\*  0x80 c088 ffff - 0x00 7fff ffff = 0xff 8000 0000 \*;
MPLAB ASM30 Listing:  .+cert0600\.s 			page 18


 3395              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3396              	
 3397 0004b6  04 20 EC 	test8:    inc testnum
 3398              	
 3399 0004b8  12 01 C3 	          clr A                     ; Set initial conditions, 
 3400 0004ba  12 81 C3 	          clr B                     ; This will clear all overflow and
 3401              	                                    ;  saturation flags in SR register\. 
 3402 0004bc  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 3403              	                                    ;  saturation flags now\.
 3404 0004be  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0x00 7fff ffff\.
 3405 0004c0  00 00 88 	          mov w0, ACCAL
 3406 0004c2  F0 FF 27 	          mov \#0x7fff, w0
 3407 0004c4  00 00 88 	          mov w0, ACCAH
 3408 0004c6  00 00 20 	          mov \#0x0000, w0
 3409 0004c8  00 00 88 	          mov w0, ACCAU
 3410              	
 3411 0004ca  F0 FF 2F 	          mov \#0xffff,w0            ; Load B with 0x80 c088 ffff\.
 3412 0004cc  00 00 88 	          mov w0, ACCBL
 3413 0004ce  80 08 2C 	          mov \#0xc088, w0
 3414 0004d0  00 00 88 	          mov w0, ACCBH
 3415 0004d2  00 F8 2F 	          mov \#0xff80, w0
 3416 0004d4  00 00 88 	          mov w0, ACCBU
 3417              	
 3418 0004d6  00 B0 CB 	          sub B
 3419              	
 3420 0004d8  00 00 20 	          mov \#0x0000, w0
 3421 0004da  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3422              	                                    ;   for display routine
 3423 0004dc  00 20 A9 	          bclr SR, \#Z
 3424 0004de  00 00 E3 	          cp ACCBL
 3425 0004e0  00 20 AE 	          btss SR, \#Z
 3426 0004e2  00 00 02 	          call fail_AccBChk
 3426         00 00 00 
 3427 0004e6  00 00 28 	          mov \#0x8000, w0
 3428 0004e8  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3429              	                                    ;   for display routine
 3430 0004ea  00 00 E3 	          cp ACCBH
 3431 0004ec  00 20 AE 	          btss  SR, \#Z
 3432 0004ee  00 00 02 	          call fail_AccBChk
 3432         00 00 00 
 3433 0004f2  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in B = 0xff 8000 0000\.
 3434 0004f4  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3435              	                                    ;   for display routine
 3436 0004f6  00 00 E3 	          cp ACCBU               ; If not equal branch to fail\. 
 3437 0004f8  00 20 AE 	          btss  SR, \#Z
 3438 0004fa  00 00 02 	          call fail_AccBChk
 3438         00 00 00 
 3439              	
 3440 0004fe  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3441 000500  00 20 AE 	          btss  SR, \#Z
 3442 000502  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3442         00 00 00 
 3443              	                                    ;   branch and display accumulator\.
 3444              	
 3445 000506  F0 FF 2F 	          mov \#0xffff, w0
 3446 000508  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3447              	                                    ;   for display routine
MPLAB ASM30 Listing:  .+cert0600\.s 			page 19


 3448 00050a  00 00 E3 	          cp ACCAL
 3449 00050c  00 20 AE 	          btss  SR, \#Z
 3450 00050e  00 00 02 	          call fail_AccAChk
 3450         00 00 00 
 3451 000512  F0 FF 27 	          mov \#0x7fff, w0
 3452 000514  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3453              	                                    ;   for display routine
 3454 000516  00 00 E3 	          cp ACCAH
 3455 000518  00 20 AE 	          btss  SR, \#Z
 3456 00051a  00 00 02 	          call fail_AccAChk
 3456         00 00 00 
 3457 00051e  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in A value\.
 3458 000520  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3459              	                                    ;   for display routine
 3460 000522  00 00 E3 	          cp ACCAU
 3461 000524  00 20 AE 	          btss  SR, \#Z
 3462 000526  00 00 02 	          call fail_AccAChk
 3462         00 00 00 
 3463              	
 3464 00052a  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3465 00052c  00 20 AE 	          btss  SR, \#Z
 3466 00052e  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3466         00 00 00 
 3467              	                                    ;   branch and display accumulator\.
 3468              	
 3469 000532  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 3470              	                                    ;   following checks is 0  
 3471 000534  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 3472              	                                    ;   following checks is 1  
 3473 000536  01 80 AE 	          btss SR, \#SB
 3474 000538  00 00 02 	          call fail_SB
 3474         00 00 00 
 3475 00053c  01 40 AE 	          btss SR, \#SAB
 3476 00053e  00 00 02 	          call fail_SAB
 3476         00 00 00 
 3477              	
 3478 000542  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3479              	                                    ;   following checks is 1
 3480 000544  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3481              	                                    ;   following checks is 0 
 3482 000546  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
 3483 000548  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3483         00 00 00 
 3484 00054c  01 60 AF 	          btsc SR, \#OAB
 3485 00054e  00 00 02 	          call fail_OAB
 3485         00 00 00 
 3486 000552  01 E0 AF 	          btsc SR, \#OA
 3487 000554  00 00 02 	          call fail_OA
 3487         00 00 00 
 3488 000558  01 A0 AF 	          btsc SR, \#SA
 3489 00055a  00 00 02 	          call fail_SA
 3489         00 00 00 
 3490              	
 3491              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3492              	         ;\*    Enable 9\.31 Saturation for both Accumulators\.  \*;
 3493              	         ;\*     \(Set SATA, SATB and ACCSAT in CORCON\)         \*;
 3494              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
MPLAB ASM30 Listing:  .+cert0600\.s 			page 20


 3495              	
 3496 00055e  00 E0 A8 	         bset CORCON, \#SATA
 3497 000560  00 C0 A8 	         bset CORCON, \#SATB
 3498 000562  00 80 A8 	         bset CORCON, \#ACCSAT
 3499              	         
 3500              	          \.data
 3501 014c 50 41 53 53 	passall:  \.asciz \"PASS: SUBAB, TEST END\\n\"
 3501      3A 20 53 55 
 3501      42 41 42 2C 
 3501      20 54 45 53 
 3501      54 20 45 4E 
 3501      44 0A 00 
 3502                 	          \.text   
 3503              	          \.data
 3504 0163 46 41 49 4C 	failall:  \.asciz \"FAIL: SUBAB, TEST END\\n\"
 3504      3A 20 53 55 
 3504      42 41 42 2C 
 3504      20 54 45 53 
 3504      54 20 45 4E 
 3504      44 0A 00 
 3505                 	          \.text          
 3506              	
 3507              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3508              	         ;\*  TEST 9 \(Test for result within allowed range\)    \*;
 3509              	         ;\*  0xff 8001 70ff - 0x00 0001 70ff = 0xff 8000 0000 \*;
 3510              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3511              	
 3512 000564  04 20 EC 	test9:    inc testnum
 3513 000566  12 01 C3 	          clr A                     ; Set initial conditions, 
 3514 000568  12 81 C3 	          clr B                     ; This will clear all overflow and
 3515              	                                    ;  saturation flags in SR register\. 
 3516 00056a  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 3517              	                                    ;  saturation flags now\.
 3518 00056c  F0 0F 27 	          mov \#0x70ff,w0            ; Load A with 0xff 8001 70ff\.
 3519 00056e  00 00 88 	          mov w0, ACCAL
 3520 000570  10 00 28 	          mov \#0x8001, w0
 3521 000572  00 00 88 	          mov w0, ACCAH
 3522 000574  F0 FF 2F 	          mov \#0xffff, w0
 3523 000576  00 00 88 	          mov w0, ACCAU
 3524              	
 3525 000578  F0 0F 27 	          mov \#0x70ff,w0            ; Load B with 0x00 0001 70ff\.
 3526 00057a  00 00 88 	          mov w0, ACCBL
 3527 00057c  10 00 20 	          mov \#0x0001, w0
 3528 00057e  00 00 88 	          mov w0, ACCBH
 3529 000580  00 00 20 	          mov \#0x0000, w0
 3530 000582  00 00 88 	          mov w0, ACCBU
 3531              	
 3532 000584  00 30 CB 	          sub A
 3533              	
 3534 000586  00 00 20 	          mov \#0x0000, w0
 3535 000588  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3536              	                                    ;   for display routine
 3537 00058a  00 20 A9 	          bclr SR, \#Z
 3538 00058c  00 00 E3 	          cp ACCAL
 3539 00058e  00 20 AE 	          btss  SR, \#Z
 3540 000590  00 00 02 	          call fail_AccAChk
 3540         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 21


 3541 000594  00 00 28 	          mov \#0x8000, w0
 3542 000596  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3543              	                                    ;   for display routine
 3544 000598  00 00 E3 	          cp ACCAH
 3545 00059a  00 20 AE 	          btss  SR, \#Z
 3546 00059c  00 00 02 	          call fail_AccAChk
 3546         00 00 00 
 3547 0005a0  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in A = 0xff 8000 0000\.
 3548 0005a2  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3549              	                                    ;   for display routine
 3550 0005a4  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\. 
 3551 0005a6  00 20 AE 	          btss  SR, \#Z
 3552 0005a8  00 00 02 	          call fail_AccAChk
 3552         00 00 00 
 3553              	
 3554 0005ac  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3555 0005ae  00 20 AE 	          btss  SR, \#Z
 3556 0005b0  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3556         00 00 00 
 3557              	                                    ;   branch and display accumulator\.
 3558              	
 3559 0005b4  F0 0F 27 	          mov \#0x70ff, w0
 3560 0005b6  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3561              	                                    ;   for display routine
 3562 0005b8  00 00 E3 	          cp ACCBL
 3563 0005ba  00 20 AE 	          btss  SR, \#Z
 3564 0005bc  00 00 02 	          call fail_AccBChk
 3564         00 00 00 
 3565 0005c0  10 00 20 	          mov \#0x0001, w0
 3566 0005c2  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3567              	                                    ;   for display routine
 3568 0005c4  00 00 E3 	          cp ACCBH
 3569 0005c6  00 20 AE 	          btss  SR, \#Z
 3570 0005c8  00 00 02 	          call fail_AccBChk
 3570         00 00 00 
 3571 0005cc  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in B value\.
 3572 0005ce  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3573              	                                    ;   for display routine
 3574 0005d0  00 00 E3 	          cp ACCBU
 3575 0005d2  00 20 AE 	          btss  SR, \#Z
 3576 0005d4  00 00 02 	          call fail_AccBChk
 3576         00 00 00 
 3577              	
 3578 0005d8  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3579 0005da  00 20 AE 	          btss SR, \#Z
 3580 0005dc  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3580         00 00 00 
 3581              	                                    ;   branch and display accumulator\.
 3582              	
 3583 0005e0  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3584              	                                    ;   following checks is 1
 3585 0005e2  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3586              	                                    ;   following checks is 0 
 3587 0005e4  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 3588 0005e6  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3588         00 00 00 
 3589 0005ea  01 80 AF 	          btsc SR, \#SB
MPLAB ASM30 Listing:  .+cert0600\.s 			page 22


 3590 0005ec  00 00 02 	          call fail_SB 
 3590         00 00 00 
 3591 0005f0  01 60 AF 	          btsc SR, \#OAB
 3592 0005f2  00 00 02 	          call fail_OAB
 3592         00 00 00 
 3593 0005f6  01 40 AF 	          btsc SR, \#SAB
 3594 0005f8  00 00 02 	          call fail_SAB
 3594         00 00 00 
 3595 0005fc  01 E0 AF 	          btsc SR, \#OA
 3596 0005fe  00 00 02 	          call fail_OA
 3596         00 00 00 
 3597 000602  01 A0 AF 	          btsc SR, \#SA
 3598 000604  00 00 02 	          call fail_SA
 3598         00 00 00 
 3599              	          
 3600 000608  00 00 04 	          goto test10
 3600         00 00 00 
 3601              	          \.data
 3602 017a 45 78 70 65 	displayOA: \.asciz \"Expected value of OA is \%d, Observed value of OA is \%d\\n\"
 3602      63 74 65 64 
 3602      20 76 61 6C 
 3602      75 65 20 6F 
 3602      66 20 4F 41 
 3602      20 69 73 20 
 3602      25 64 2C 20 
 3602      4F 62 73 65 
 3602      72 76 65 64 
 3603                 	          \.text
 3604              	          
 3605              	          ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3606              	          ;\*  TEST 10 \(Test for overflow on B\)                 \*;
 3607              	          ;\*  0x00 70ff 8002 - 0xff f0ff 8002 = 0x00 8000 0000 \*;
 3608              	          ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3609              	
 3610 00060c  04 20 EC 	test10:   inc testnum
 3611 00060e  12 01 C3 	          clr A                     ; Set initial conditions, 
 3612 000610  12 81 C3 	          clr B                     ; This will clear all overflow and
 3613              	                                    ;  saturation flags in SR register\. 
 3614 000612  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 3615              	                                    ;  saturation flags now\.
 3616 000614  20 00 28 	          mov \#0x8002,w0            ; Load A with 0xff f0ff 8002\.
 3617 000616  00 00 88 	          mov w0, ACCAL
 3618 000618  F0 0F 2F 	          mov \#0xf0ff, w0
 3619 00061a  00 00 88 	          mov w0, ACCAH
 3620 00061c  F0 0F 20 	          mov \#0xff, w0
 3621 00061e  00 00 88 	          mov w0, ACCAU
 3622              	
 3623 000620  20 00 28 	          mov \#0x8002,w0            ; Load B with 0x00 70ff 8002\.
 3624 000622  00 00 88 	          mov w0, ACCBL
 3625 000624  F0 0F 27 	          mov \#0x70ff, w0
 3626 000626  00 00 88 	          mov w0, ACCBH
 3627 000628  00 00 20 	          mov \#0x00, w0
 3628 00062a  00 00 88 	          mov w0, ACCBU
 3629              	
 3630 00062c  00 B0 CB 	          sub B
 3631              	
 3632 00062e  00 00 20 	          mov \#0x0000, w0
MPLAB ASM30 Listing:  .+cert0600\.s 			page 23


 3633 000630  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3634              	                                    ;   for display routine
 3635 000632  00 20 A9 	          bclr SR, \#Z
 3636 000634  00 00 E3 	          cp ACCBL
 3637 000636  00 20 AE 	          btss  SR, \#Z
 3638 000638  00 00 02 	          call fail_AccBChk
 3638         00 00 00 
 3639 00063c  00 00 28 	          mov \#0x8000, w0
 3640 00063e  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3641              	                                    ;   for display routine
 3642 000640  00 00 E3 	          cp ACCBH
 3643 000642  00 20 AE 	          btss  SR, \#Z
 3644 000644  00 00 02 	          call fail_AccBChk
 3644         00 00 00 
 3645 000648  00 00 20 	          mov \#0x0000, w0           ; Check result in B = 0x00 8000 0000\.
 3646 00064a  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3647              	                                    ;   for display routine
 3648 00064c  00 00 E3 	          cp ACCBU               ; If not equal branch to fail\. 
 3649 00064e  00 20 AE 	          btss  SR, \#Z
 3650 000650  00 00 02 	          call fail_AccBChk
 3650         00 00 00 
 3651              	
 3652 000654  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3653 000656  00 20 AE 	          btss  SR, \#Z
 3654 000658  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3654         00 00 00 
 3655              	                                    ;   branch and display accumulator\.
 3656              	
 3657 00065c  20 00 28 	          mov \#0x8002, w0
 3658 00065e  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3659              	                                    ;   for display routine
 3660 000660  00 00 E3 	          cp ACCAL
 3661 000662  00 20 AE 	          btss  SR, \#Z
 3662 000664  00 00 02 	          call fail_AccAChk
 3662         00 00 00 
 3663 000668  F0 0F 2F 	          mov \#0xf0ff, w0
 3664 00066a  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3665              	                                    ;   for display routine
 3666 00066c  00 00 E3 	          cp ACCAH
 3667 00066e  00 20 AE 	          btss  SR, \#Z
 3668 000670  00 00 02 	          call fail_AccAChk
 3668         00 00 00 
 3669 000674  F0 FF 2F 	          mov \#0xffff, w0           ; Verify that there is no change in A value\.
 3670 000676  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3671              	                                    ;   for display routine
 3672 000678  00 00 E3 	          cp ACCAU
 3673 00067a  00 20 AE 	          btss  SR, \#Z
 3674 00067c  00 00 02 	          call fail_AccAChk
 3674         00 00 00 
 3675              	
 3676 000680  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3677 000682  00 20 AE 	          btss  SR, \#Z
 3678 000684  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3678         00 00 00 
 3679              	                                    ;   branch and display accumulator\.
 3680              	
 3681 000688  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
MPLAB ASM30 Listing:  .+cert0600\.s 			page 24


 3682              	                                    ;   following checks is 0  
 3683 00068a  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 3684              	                                    ;   following checks is 1            
 3685 00068c  01 C0 AE 	          btss SR, \#OB              ; Verify SB = 0; OB = 1; SAB = 0; OAB = 1;
 3686 00068e  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 3686         00 00 00 
 3687 000692  01 60 AE 	          btss SR, \#OAB
 3688 000694  00 00 02 	          call fail_OAB
 3688         00 00 00 
 3689              	
 3690 000698  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3691              	                                    ;   following checks is 1
 3692 00069a  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3693              	                                    ;   following checks is 0 
 3694 00069c  01 80 AF 	          btsc SR, \#SB
 3695 00069e  00 00 02 	          call fail_SB
 3695         00 00 00 
 3696 0006a2  01 40 AF 	          btsc SR, \#SAB
 3697 0006a4  00 00 02 	          call fail_SAB
 3697         00 00 00 
 3698 0006a8  01 E0 AF 	          btsc SR, \#OA
 3699 0006aa  00 00 02 	          call fail_OA
 3699         00 00 00 
 3700 0006ae  01 A0 AF 	          btsc SR, \#SA
 3701 0006b0  00 00 02 	          call fail_SA
 3701         00 00 00 
 3702              	
 3703 0006b4  00 00 04 	          goto test11
 3703         00 00 00 
 3704              	          \.data
 3705 01b2 45 78 70 65 	displayOB: \.asciz \"Expected value of OB is \%d, Observed value of OB is \%d\\n\"
 3705      63 74 65 64 
 3705      20 76 61 6C 
 3705      75 65 20 6F 
 3705      66 20 4F 42 
 3705      20 69 73 20 
 3705      25 64 2C 20 
 3705      4F 62 73 65 
 3705      72 76 65 64 
 3706                 	          \.text          
 3707              	
 3708              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3709              	         ;\*  TEST 11 \(Test for Negative Saturation on A\)      \*;
 3710              	         ;\*  0xff 8002 ffff - 0x7f ff03 0000 = 0x80 0000 0000 \*;
 3711              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3712              	
 3713 0006b8  04 20 EC 	test11:   inc testnum
 3714 0006ba  12 01 C3 	          clr A                     ; Set initial conditions, 
 3715 0006bc  12 81 C3 	          clr B                     ; This will clear all overflow and
 3716              	                                    ;  saturation flags in SR register\. 
 3717              	
 3718 0006be  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 3719              	                                    ;  saturation flags now\.  
 3720              	
 3721 0006c0  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0xff 8002 ffff\.
 3722 0006c2  00 00 88 	          mov w0, ACCAL
 3723 0006c4  20 00 28 	          mov \#0x8002, w0
MPLAB ASM30 Listing:  .+cert0600\.s 			page 25


 3724 0006c6  00 00 88 	          mov w0, ACCAH
 3725 0006c8  F0 0F 20 	          mov \#0xff, w0
 3726 0006ca  00 00 88 	          mov w0, ACCAU
 3727              	
 3728 0006cc  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x7f ff03 0000\.
 3729 0006ce  00 00 88 	          mov w0, ACCBL
 3730 0006d0  30 F0 2F 	          mov \#0xff03, w0
 3731 0006d2  00 00 88 	          mov w0, ACCBH
 3732 0006d4  F0 07 20 	          mov \#0x7f, w0
 3733 0006d6  00 00 88 	          mov w0, ACCBU 
 3734              	
 3735 0006d8  00 30 CB 	          sub A
 3736              	
 3737 0006da  00 00 20 	          mov \#0x0000, w0           ; Check result in A = 0x80 0000 0000\.
 3738 0006dc  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3739              	                                    ;   for display routine
 3740 0006de  00 20 A9 	          bclr SR, \#Z
 3741 0006e0  00 00 E3 	          cp ACCAL
 3742 0006e2  00 20 AE 	          btss  SR, \#Z
 3743 0006e4  00 00 02 	          call fail_AccAChk
 3743         00 00 00 
 3744 0006e8  00 00 20 	          mov \#0x0000, w0
 3745 0006ea  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3746              	                                    ;   for display routine
 3747 0006ec  00 00 E3 	          cp ACCAH
 3748 0006ee  00 20 AE 	          btss  SR, \#Z
 3749 0006f0  00 00 02 	          call fail_AccAChk
 3749         00 00 00 
 3750 0006f4  00 F8 2F 	          mov \#0xff80, w0
 3751 0006f6  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3752              	                                    ;   for display routine
 3753 0006f8  00 00 E3 	          cp ACCAU               ; If not equal branch to fail\. 
 3754 0006fa  00 20 AE 	          btss  SR, \#Z
 3755 0006fc  00 00 02 	          call fail_AccAChk
 3755         00 00 00 
 3756              	
 3757 000700  10 00 E2 	          cp0  accErr             ; accErr is incremented in fail routine,
 3758 000702  00 20 AE 	          btss  SR, \#Z
 3759 000704  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3759         00 00 00 
 3760              	                                    ;   branch and display accumulator\.
 3761              	
 3762 000708  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in B value\.
 3763 00070a  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3764              	                                    ;   for display routine
 3765 00070c  00 00 E3 	          cp ACCBL
 3766 00070e  00 20 AE 	          btss  SR, \#Z
 3767 000710  00 00 02 	          call fail_AccBChk
 3767         00 00 00 
 3768 000714  30 F0 2F 	          mov \#0xff03, w0
 3769 000716  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3770              	                                    ;   for display routine
 3771 000718  00 00 E3 	          cp ACCBH
 3772 00071a  00 20 AE 	          btss  SR, \#Z
 3773 00071c  00 00 02 	          call fail_AccBChk
 3773         00 00 00 
 3774 000720  F0 07 20 	          mov \#0x007F, w0
MPLAB ASM30 Listing:  .+cert0600\.s 			page 26


 3775 000722  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3776              	                                    ;   for display routine
 3777 000724  00 00 E3 	          cp ACCBU
 3778 000726  00 20 AE 	          btss  SR, \#Z
 3779 000728  00 00 02 	          call fail_AccBChk
 3779         00 00 00 
 3780              	
 3781 00072c  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3782 00072e  00 20 AE 	          btss  SR, \#Z
 3783 000730  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3783         00 00 00 
 3784              	                                    ;   branch and display accumulator\.
 3785              	
 3786 000734  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3787              	                                    ;   following checks is 1
 3788 000736  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3789              	                                    ;   following checks is 0 
 3790 000738  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
 3791 00073a  00 00 02 	          call fail_OB              ;    SA = 1, OA = 1\.
 3791         00 00 00 
 3792 00073e  01 80 AF 	          btsc SR, \#SB
 3793 000740  00 00 02 	          call fail_SB
 3793         00 00 00 
 3794 000744  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 3795              	                                    ;   following checks is 0  
 3796 000746  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 3797              	                                    ;   following checks is 1  
 3798 000748  01 60 AE 	          btss SR, \#OAB
 3799 00074a  00 00 02 	          call fail_OAB
 3799         00 00 00 
 3800 00074e  01 40 AE 	          btss SR, \#SAB
 3801 000750  00 00 02 	          call fail_SAB
 3801         00 00 00 
 3802 000754  01 E0 AE 	          btss SR, \#OA
 3803 000756  00 00 02 	          call fail_OA
 3803         00 00 00 
 3804 00075a  01 A0 AE 	          btss SR, \#SA
 3805 00075c  00 00 02 	          call fail_SA
 3805         00 00 00 
 3806              	          
 3807 000760  00 00 04 	          goto test12
 3807         00 00 00 
 3808              	
 3809              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3810              	         ;\*  TEST 12 \(Test for Positive saturation on B\)      \*;
 3811              	         ;\*  0x7f fffe 8000 - 0xff 8000 0000 = 0x7f ffff ffff \*;
 3812              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3813              	          \.data
 3814 01ea 45 78 70 65 	displaySA: \.asciz \"Expected value of SA is \%d, Observed value of SA is \%d\\n\"
 3814      63 74 65 64 
 3814      20 76 61 6C 
 3814      75 65 20 6F 
 3814      66 20 53 41 
 3814      20 69 73 20 
 3814      25 64 2C 20 
 3814      4F 62 73 65 
 3814      72 76 65 64 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 27


 3815                 	          \.text
 3816              	          
 3817 000764  04 20 EC 	test12:   inc testnum
 3818 000766  12 01 C3 	          clr A                     ; Set initial conditions, 
 3819 000768  12 81 C3 	          clr B                     ; This will clear all overflow and
 3820              	                                    ;  saturation flags in SR register\. 
 3821              	
 3822 00076a  00 20 EF 	          clr SR                    ; As clr A and clr B does not clear 
 3823              	                                    ;  saturation flags now\.  
 3824              	
 3825 00076c  00 00 20 	          mov \#0x0000,w0            ; Load A with 0xff 8000 0000\.
 3826 00076e  00 00 88 	          mov w0, ACCAL
 3827 000770  00 00 28 	          mov \#0x8000, w0
 3828 000772  00 00 88 	          mov w0, ACCAH
 3829 000774  F0 FF 2F 	          mov \#0xffff, w0
 3830 000776  00 00 88 	          mov w0, ACCAU
 3831              	
 3832 000778  00 00 28 	          mov \#0x8000,w0            ; Load B with 0x7f fffe 8000\.
 3833 00077a  00 00 88 	          mov w0, ACCBL
 3834 00077c  E0 FF 2F 	          mov \#0xfffe, w0
 3835 00077e  00 00 88 	          mov w0, ACCBH
 3836 000780  F0 07 20 	          mov \#0x007f, w0
 3837 000782  00 00 88 	          mov w0, ACCBU 
 3838              	
 3839 000784  00 B0 CB 	          sub B
 3840              	
 3841 000786  F0 FF 2F 	          mov \#0xffff, w0
 3842 000788  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3843              	                                    ;   for display routine
 3844 00078a  00 20 A9 	          bclr SR, \#Z
 3845 00078c  00 00 E3 	          cp ACCBL
 3846 00078e  00 20 AE 	          btss  SR, \#Z
 3847 000790  00 00 02 	          call fail_AccBChk
 3847         00 00 00 
 3848 000794  F0 FF 2F 	          mov \#0xffff, w0
 3849 000796  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3850              	                                    ;   for display routine
 3851 000798  00 00 E3 	          cp ACCBH
 3852 00079a  00 20 AE 	          btss  SR, \#Z
 3853 00079c  00 00 02 	          call fail_AccBChk
 3853         00 00 00 
 3854 0007a0  F0 07 20 	          mov \#0x007f, w0           ; Check result in B = 0x7f ffff ffff\.
 3855 0007a2  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3856              	                                    ;   for display routine
 3857 0007a4  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\. 
 3858 0007a6  00 20 AE 	          btss  SR, \#Z
 3859 0007a8  00 00 02 	          call fail_AccBChk
 3859         00 00 00 
 3860              	
 3861 0007ac  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3862 0007ae  00 20 AE 	          btss  SR, \#Z
 3863 0007b0  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3863         00 00 00 
 3864              	                                    ;   branch and display accumulator\.
 3865              	
 3866 0007b4  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in A value\.
 3867 0007b6  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 28


 3868              	                                    ;   for display routine
 3869 0007b8  00 00 E3 	          cp ACCAL
 3870 0007ba  00 20 AE 	          btss  SR, \#Z
 3871 0007bc  00 00 02 	          call fail_AccAChk
 3871         00 00 00 
 3872 0007c0  00 00 28 	          mov \#0x8000, w0
 3873 0007c2  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3874              	                                    ;   for display routine
 3875 0007c4  00 00 E3 	          cp ACCAH
 3876 0007c6  00 20 AE 	          btss  SR, \#Z
 3877 0007c8  00 00 02 	          call fail_AccAChk
 3877         00 00 00 
 3878 0007cc  F0 FF 2F 	          mov \#0xffff, w0
 3879 0007ce  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3880              	                                    ;   for display routine
 3881 0007d0  00 00 E3 	          cp ACCAU
 3882 0007d2  00 20 AE 	          btss  SR, \#Z
 3883 0007d4  00 00 02 	          call fail_AccAChk
 3883         00 00 00 
 3884              	
 3885 0007d8  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3886 0007da  00 20 AE 	          btss SR, \#Z
 3887 0007dc  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3887         00 00 00 
 3888              	                                    ;   branch and display accumulator\.
 3889              	
 3890 0007e0  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 3891              	                                    ;   following checks is 1
 3892 0007e2  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 3893              	                                    ;   following checks is 0 
 3894 0007e4  01 E0 AF 	          btsc SR, \#OA              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
 3895 0007e6  00 00 02 	          call fail_OA              ;    SA = 0, OA = 0\.
 3895         00 00 00 
 3896 0007ea  01 A0 AF 	          btsc SR, \#SA
 3897 0007ec  00 00 02 	          call fail_SA
 3897         00 00 00 
 3898 0007f0  06 20 EF 	          clr  ObsrvdVal            ; ObsrvdVal = 0, Observed value of flags for
 3899              	                                    ;   following checks is 0  
 3900 0007f2  08 00 A8 	          bset ExpctdVal, \#0        ; ExpctdVal = 1, Expected value of flags for
 3901              	                                    ;   following checks is 1  
 3902 0007f4  01 60 AE 	          btss SR, \#OAB
 3903 0007f6  00 00 02 	          call fail_OAB
 3903         00 00 00 
 3904 0007fa  01 40 AE 	          btss SR, \#SAB
 3905 0007fc  00 00 02 	          call fail_SAB
 3905         00 00 00 
 3906 000800  01 C0 AE 	          btss SR, \#OB
 3907 000802  00 00 02 	          call fail_OB
 3907         00 00 00 
 3908 000806  01 80 AE 	          btss SR, \#SB
 3909 000808  00 00 02 	          call fail_SB
 3909         00 00 00 
 3910              	
 3911              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 3912              	         ;\*    Enable 1\.31 Saturation for both Accumulators\.  \*;
 3913              	         ;\*     \(Set SATA and SATB; Clear ACCSAT in CORCON\)   \*;
 3914              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
MPLAB ASM30 Listing:  .+cert0600\.s 			page 29


 3915              	
 3916 00080c  00 80 A9 	          bclr CORCON, \#ACCSAT
 3917              	          
 3918 00080e  00 00 04 	          goto test13
 3918         00 00 00 
 3919              	          \.data
 3920 0222 45 78 70 65 	displaySB: \.asciz \"Expected value of SB is \%d, Observed value of SB is \%d\\n\"
 3920      63 74 65 64 
 3920      20 76 61 6C 
 3920      75 65 20 6F 
 3920      66 20 53 42 
 3920      20 69 73 20 
 3920      25 64 2C 20 
 3920      4F 62 73 65 
 3920      72 76 65 64 
 3921                 	          \.text          
 3922              	
 3923              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3924              	         ;\*  TEST 13 \(Test for Positive saturation on A\)      \*;
 3925              	         ;\*  0x00 7fff ffff - 0xff 8000 0000 = 0x00 7fff ffff \*;
 3926              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 3927              	
 3928 000812  04 20 EC 	test13:   inc testnum
 3929 000814  12 01 C3 	          clr A                     ; Set initial conditions, 
 3930 000816  12 81 C3 	          clr B                     ; This will clear all overflow and
 3931              	                                    ;  saturation flags in SR register\. 
 3932              	
 3933 000818  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 3934              	                                    ;  saturation flags now\.  
 3935              	
 3936 00081a  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0x00 7fff ffff\.
 3937 00081c  00 00 88 	          mov w0, ACCAL
 3938 00081e  F0 FF 27 	          mov \#0x7fff, w0
 3939 000820  00 00 88 	          mov w0, ACCAH
 3940 000822  00 00 20 	          mov \#0x00, w0
 3941 000824  00 00 88 	          mov w0, ACCAU
 3942              	
 3943 000826  00 00 20 	          mov \#0x0000,w0            ; Load B with 0xff 8000 0000\.
 3944 000828  00 00 88 	          mov w0, ACCBL
 3945 00082a  00 00 28 	          mov \#0x8000, w0
 3946 00082c  00 00 88 	          mov w0, ACCBH
 3947 00082e  F0 FF 2F 	          mov \#0xffff, w0
 3948 000830  00 00 88 	          mov w0, ACCBU
 3949              	
 3950 000832  00 30 CB 	          sub A
 3951              	
 3952 000834  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in A = 0x00 7fff ffff\.
 3953 000836  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 3954              	                                    ;   for display routine
 3955 000838  00 20 A9 	          bclr SR, \#Z
 3956 00083a  00 00 E3 	          cp ACCAL
 3957 00083c  00 20 AE 	          btss  SR, \#Z
 3958 00083e  00 00 02 	          call fail_AccAChk
 3958         00 00 00 
 3959 000842  F0 FF 27 	          mov \#0x7fff, w0
 3960 000844  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 3961              	                                    ;   for display routine
MPLAB ASM30 Listing:  .+cert0600\.s 			page 30


 3962 000846  00 00 E3 	          cp ACCAH
 3963 000848  00 20 AE 	          btss  SR, \#Z
 3964 00084a  00 00 02 	          call fail_AccAChk
 3964         00 00 00 
 3965 00084e  00 00 20 	          mov \#0x0000, w0
 3966 000850  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 3967              	                                    ;   for display routine
 3968 000852  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\. 
 3969 000854  00 20 AE 	          btss  SR, \#Z
 3970 000856  00 00 02 	          call fail_AccAChk
 3970         00 00 00 
 3971              	
 3972 00085a  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 3973 00085c  00 20 AE 	          btss SR, \#Z
 3974 00085e  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 3974         00 00 00 
 3975              	                                    ;   branch and display accumulator\.
 3976 000862  00 00 20 	          mov \#0x0000, w0
 3977 000864  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 3978              	                                    ;   for display routine
 3979 000866  00 00 E3 	          cp ACCBL
 3980 000868  00 20 AE 	          btss  SR, \#Z
 3981 00086a  00 00 02 	          call fail_AccBChk
 3981         00 00 00 
 3982 00086e  00 00 28 	          mov \#0x8000, w0
 3983 000870  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 3984              	                                    ;   for display routine
 3985 000872  00 00 E3 	          cp ACCBH
 3986 000874  00 20 AE 	          btss  SR, \#Z
 3987 000876  00 00 02 	          call fail_AccBChk
 3987         00 00 00 
 3988 00087a  F0 FF 2F 	          mov \#0xffff, w0           ; Verify that there is no change in B value\.
 3989 00087c  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 3990              	                                    ;   for display routine
 3991 00087e  00 00 E3 	          cp ACCBU
 3992 000880  00 20 AE 	          btss  SR, \#Z
 3993 000882  00 00 02 	          call fail_AccBChk
 3993         00 00 00 
 3994              	
 3995 000886  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 3996 000888  00 20 AE 	          btss  SR, \#Z
 3997 00088a  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 3997         00 00 00 
 3998              	                                    ;   branch and display accumulator\.
 3999              	
 4000 00088e  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4001              	                                    ;   following checks is 1
 4002 000890  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4003              	                                    ;   following checks is 0 
 4004 000892  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
 4005 000894  00 00 02 	          call fail_OB              ;    SA = 1, OA = 0\.
 4005         00 00 00 
 4006 000898  01 80 AF 	          btsc SR, \#SB
 4007 00089a  00 00 02 	          call fail_SB
 4007         00 00 00 
 4008 00089e  01 60 AF 	          btsc SR, \#OAB
 4009 0008a0  00 00 02 	          call fail_OAB
MPLAB ASM30 Listing:  .+cert0600\.s 			page 31


 4009         00 00 00 
 4010 0008a4  01 E0 AF 	          btsc SR, \#OA
 4011 0008a6  00 00 02 	          call fail_OA
 4011         00 00 00 
 4012              	
 4013 0008aa  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4014              	                                    ;   following checks is 0  
 4015 0008ac  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4016              	                                    ;   following checks is 1  
 4017 0008ae  01 40 AE 	          btss SR, \#SAB
 4018 0008b0  00 00 02 	          call fail_SAB
 4018         00 00 00 
 4019 0008b4  01 A0 AE 	          btss SR, \#SA
 4020 0008b6  00 00 02 	          call fail_SA
 4020         00 00 00 
 4021              	          
 4022 0008ba  00 00 04 	          goto test14
 4022         00 00 00 
 4023              	          \.data
 4024 025a 45 78 70 65 	displayOAB:\.asciz \"Expected value of OAB is \%d, Observed value of OAB is \%d\\n\"
 4024      63 74 65 64 
 4024      20 76 61 6C 
 4024      75 65 20 6F 
 4024      66 20 4F 41 
 4024      42 20 69 73 
 4024      20 25 64 2C 
 4024      20 4F 62 73 
 4024      65 72 76 65 
 4025                 	          \.text
 4026              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4027              	         ;\*  TEST 14 \(Test for Negative saturation on B\)      \*;
 4028              	         ;\*  0xff 8000 0000 - 0x00 0000 0001 = 0xff 8000 0000 \*;
 4029              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4030              	
 4031 0008be  04 20 EC 	test14:   inc testnum
 4032 0008c0  12 01 C3 	          clr A                     ; Set initial conditions, 
 4033 0008c2  12 81 C3 	          clr B                     ; This will clear all overflow and
 4034              	                                    ;  saturation flags in SR register\. 
 4035 0008c4  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4036              	                                    ;  saturation flags now\.  
 4037              	
 4038 0008c6  10 00 20 	          mov \#0x0001,w0            ; Load A with 0x00 0000 0001\.
 4039 0008c8  00 00 88 	          mov w0, ACCAL
 4040 0008ca  00 00 20 	          mov \#0x0000, w0
 4041 0008cc  00 00 88 	          mov w0, ACCAH
 4042 0008ce  00 00 20 	          mov \#0x0000, w0
 4043 0008d0  00 00 88 	          mov w0, ACCAU
 4044              	
 4045 0008d2  00 00 20 	          mov \#0x0000,w0            ; Load B with 0xff 8000 0000\.
 4046 0008d4  00 00 88 	          mov w0, ACCBL
 4047 0008d6  00 00 28 	          mov \#0x8000, w0
 4048 0008d8  00 00 88 	          mov w0, ACCBH
 4049 0008da  F0 FF 2F 	          mov \#0xffff, w0
 4050 0008dc  00 00 88 	          mov w0, ACCBU
 4051              	
 4052 0008de  00 B0 CB 	          sub B
 4053              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 32


 4054 0008e0  00 00 20 	          mov \#0x0000, w0           ; Check result in B = 0xff 8000 0000\.
 4055 0008e2  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4056              	                                    ;   for display routine
 4057 0008e4  00 20 A9 	          bclr SR, \#Z
 4058 0008e6  00 00 E3 	          cp ACCBL
 4059 0008e8  00 20 AE 	          btss  SR, \#Z
 4060 0008ea  00 00 02 	          call fail_AccBChk
 4060         00 00 00 
 4061 0008ee  00 00 28 	          mov \#0x8000, w0
 4062 0008f0  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4063              	                                    ;   for display routine
 4064 0008f2  00 00 E3 	          cp ACCBH
 4065 0008f4  00 20 AE 	          btss  SR, \#Z
 4066 0008f6  00 00 02 	          call fail_AccBChk
 4066         00 00 00 
 4067 0008fa  F0 FF 2F 	          mov \#0xffff, w0
 4068 0008fc  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4069              	                                    ;   for display routine
 4070 0008fe  00 00 E3 	          cp ACCBU               ; If not equal branch to fail\. 
 4071 000900  00 20 AE 	          btss  SR, \#Z
 4072 000902  00 00 02 	          call fail_AccBChk
 4072         00 00 00 
 4073              	
 4074 000906  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4075 000908  00 20 AE 	          btss SR, \#Z
 4076 00090a  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4076         00 00 00 
 4077              	                                    ;   branch and display accumulator\.
 4078 00090e  10 00 20 	          mov \#0x0001, w0
 4079 000910  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4080              	                                    ;   for display routine
 4081 000912  00 00 E3 	          cp ACCAL
 4082 000914  00 20 AE 	          btss  SR, \#Z
 4083 000916  00 00 02 	          call fail_AccAChk
 4083         00 00 00 
 4084 00091a  00 00 20 	          mov \#0x0000, w0
 4085 00091c  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAH, 
 4086              	                                    ;   for display routine
 4087 00091e  00 00 E3 	          cp ACCAH
 4088 000920  00 20 AE 	          btss  SR, \#Z
 4089 000922  00 00 02 	          call fail_AccAChk
 4089         00 00 00 
 4090 000926  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in A value\.
 4091 000928  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAU, 
 4092              	                                    ;   for display routine
 4093 00092a  00 00 E3 	          cp ACCAU
 4094 00092c  00 20 AE 	          btss  SR, \#Z
 4095 00092e  00 00 02 	          call fail_AccAChk
 4095         00 00 00 
 4096              	
 4097 000932  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4098              	                                    ;   following checks is 1
 4099 000934  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4100              	                                    ;   following checks is 0 
 4101 000936  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
 4102 000938  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 4102         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 33


 4103 00093c  01 60 AF 	          btsc SR, \#OAB
 4104 00093e  00 00 02 	          call fail_OAB
 4104         00 00 00 
 4105 000942  01 E0 AF 	          btsc SR, \#OA
 4106 000944  00 00 02 	          call fail_OA
 4106         00 00 00 
 4107 000948  01 A0 AF 	          btsc SR, \#SA
 4108 00094a  00 00 02 	          call fail_SA
 4108         00 00 00 
 4109 00094e  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4110              	                                    ;   following checks is 0  
 4111 000950  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4112              	                                    ;   following checks is 1  
 4113 000952  01 80 AE 	          btss SR, \#SB
 4114 000954  00 00 02 	          call fail_SB
 4114         00 00 00 
 4115 000958  01 40 AE 	          btss SR, \#SAB
 4116 00095a  00 00 02 	          call fail_SAB
 4116         00 00 00 
 4117              	          
 4118 00095e  00 00 04 	          goto test15          
 4118         00 00 00 
 4119              	          \.data
 4120 0294 45 78 70 65 	displaySAB:\.asciz \"Expected value of SAB is \%d, Observed value of SAB is \%d\\n\"
 4120      63 74 65 64 
 4120      20 76 61 6C 
 4120      75 65 20 6F 
 4120      66 20 53 41 
 4120      42 20 69 73 
 4120      20 25 64 2C 
 4120      20 4F 62 73 
 4120      65 72 76 65 
 4121                 	          \.text
 4122              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4123              	         ;\*  TEST 15 \(Test for zero result on B\)              \*;
 4124              	         ;\*  0xff 8000 0000 - 0xff 8000 0000 = 0x00 0000 0000 \*;
 4125              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4126              	
 4127 000962  04 20 EC 	test15:   inc testnum
 4128 000964  12 01 C3 	          clr A                     ; Set initial conditions, 
 4129 000966  12 81 C3 	          clr B                     ; This will clear all overflow and
 4130              	                                    ;  saturation flags in SR register\. 
 4131 000968  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4132              	                                    ;  saturation flags now\.
 4133 00096a  00 00 20 	          mov \#0x0000,w0            ; Load A with 0xff 8000 0000\.
 4134 00096c  00 00 88 	          mov w0, ACCAL
 4135 00096e  00 00 28 	          mov \#0x8000, w0
 4136 000970  00 00 88 	          mov w0, ACCAH
 4137 000972  F0 FF 2F 	          mov \#0xffff, w0
 4138 000974  00 00 88 	          mov w0, ACCAU
 4139              	
 4140 000976  00 00 20 	          mov \#0x0000,w0            ; Load B with 0xff 8000 0000\.
 4141 000978  00 00 88 	          mov w0, ACCBL
 4142 00097a  00 00 28 	          mov \#0x8000, w0
 4143 00097c  00 00 88 	          mov w0, ACCBH
 4144 00097e  F0 FF 2F 	          mov \#0xffff, w0
 4145 000980  00 00 88 	          mov w0, ACCBU
MPLAB ASM30 Listing:  .+cert0600\.s 			page 34


 4146              	
 4147 000982  00 B0 CB 	          sub B
 4148              	
 4149 000984  00 00 20 	          mov \#0x0000, w0
 4150 000986  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4151              	                                    ;   for display routine
 4152 000988  00 20 A9 	          bclr SR, \#Z
 4153 00098a  00 00 E3 	          cp ACCBL
 4154 00098c  00 20 AE 	          btss  SR, \#Z
 4155 00098e  00 00 02 	          call fail_AccBChk
 4155         00 00 00 
 4156 000992  00 00 20 	          mov \#0x0000, w0
 4157 000994  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4158              	                                    ;   for display routine
 4159 000996  00 00 E3 	          cp ACCBH
 4160 000998  00 20 AE 	          btss  SR, \#Z
 4161 00099a  00 00 02 	          call fail_AccBChk
 4161         00 00 00 
 4162 00099e  00 00 20 	          mov \#0x0000, w0           ; Check result in B = 0x00 0000 0000\.
 4163 0009a0  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4164              	                                    ;   for display routine
 4165 0009a2  00 00 E3 	          cp ACCBU               ; If not equal branch to fail\. 
 4166 0009a4  00 20 AE 	          btss  SR, \#Z
 4167 0009a6  00 00 02 	          call fail_AccBChk
 4167         00 00 00 
 4168              	
 4169 0009aa  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4170 0009ac  00 20 AE 	          btss  SR, \#Z
 4171 0009ae  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4171         00 00 00 
 4172              	                                    ;   branch and display accumulator\.
 4173 0009b2  00 00 20 	          mov \#0x0000, w0
 4174 0009b4  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4175              	                                    ;   for display routine
 4176 0009b6  00 00 E3 	          cp ACCAL
 4177 0009b8  00 20 AE 	          btss  SR, \#Z
 4178 0009ba  00 00 02 	          call fail_AccAChk
 4178         00 00 00 
 4179 0009be  00 00 28 	          mov \#0x8000, w0
 4180 0009c0  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 4181              	                                    ;   for display routine
 4182 0009c2  00 00 E3 	          cp ACCAH
 4183 0009c4  00 20 AE 	          btss  SR, \#Z
 4184 0009c6  00 00 02 	          call fail_AccAChk
 4184         00 00 00 
 4185 0009ca  F0 FF 2F 	          mov \#0xffff, w0           ; Verify that there is no change in A value\.
 4186 0009cc  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4187              	                                    ;   for display routine
 4188 0009ce  00 00 E3 	          cp ACCAU
 4189 0009d0  00 20 AE 	          btss  SR, \#Z
 4190 0009d2  00 00 02 	          call fail_AccAChk
 4190         00 00 00 
 4191              	
 4192 0009d6  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4193 0009d8  00 20 AE 	          btss SR, \#Z
 4194 0009da  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4194         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 35


 4195              	                                    ;   branch and display accumulator\.
 4196              	
 4197 0009de  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4198              	                                    ;   following checks is 1
 4199 0009e0  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4200              	                                    ;   following checks is 0 
 4201 0009e2  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 4202 0009e4  00 00 02 	          call fail_OB              ;    SA = 0, OA = 0\.
 4202         00 00 00 
 4203 0009e8  01 80 AF 	          btsc SR, \#SB
 4204 0009ea  00 00 02 	          call fail_SB
 4204         00 00 00 
 4205 0009ee  01 60 AF 	          btsc SR, \#OAB
 4206 0009f0  00 00 02 	          call fail_OAB
 4206         00 00 00 
 4207 0009f4  01 40 AF 	          btsc SR, \#SAB
 4208 0009f6  00 00 02 	          call fail_SAB
 4208         00 00 00 
 4209 0009fa  01 E0 AF 	          btsc SR, \#OA
 4210 0009fc  00 00 02 	          call fail_OA
 4210         00 00 00 
 4211 000a00  01 A0 AF 	          btsc SR, \#SA
 4212 000a02  00 00 02 	          call fail_SA
 4212         00 00 00 
 4213              	          
 4214 000a06  00 00 04 	          goto test16          
 4214         00 00 00 
 4215              	
 4216              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4217              	         ;\*  TEST 16 \(Test for Negative saturation on A       \*;
 4218              	         ;\*            with Adder bit 39 overflow\)            \*;
 4219              	         ;\*  0xff 8002 ffff - 0x7f ff03 0000 = 0xff 8000 0000 \*;
 4220              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4221              	
 4222 000a0a  04 20 EC 	test16:   inc testnum
 4223 000a0c  12 01 C3 	          clr A                     ; Set initial conditions, 
 4224 000a0e  12 81 C3 	          clr B                     ; This will clear all overflow and
 4225              	                                    ;  saturation flags in SR register\. 
 4226 000a10  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4227              	                                    ;  saturation flags now\.  
 4228              	
 4229 000a12  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0xff 8002 ffff\.
 4230 000a14  00 00 88 	          mov w0, ACCAL
 4231 000a16  20 00 28 	          mov \#0x8002, w0
 4232 000a18  00 00 88 	          mov w0, ACCAH
 4233 000a1a  F0 0F 20 	          mov \#0xff, w0
 4234 000a1c  00 00 88 	          mov w0, ACCAU
 4235              	
 4236 000a1e  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x7f ff03 0000\.
 4237 000a20  00 00 88 	          mov w0, ACCBL
 4238 000a22  30 F0 2F 	          mov \#0xff03, w0
 4239 000a24  00 00 88 	          mov w0, ACCBH
 4240 000a26  F0 07 20 	          mov \#0x7f, w0
 4241 000a28  00 00 88 	          mov w0, ACCBU
 4242              	
 4243 000a2a  00 30 CB 	          sub A
 4244              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 36


 4245 000a2c  00 00 20 	          mov \#0x0000, w0
 4246 000a2e  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4247              	                                    ;   for display routine
 4248 000a30  00 20 A9 	          bclr SR, \#Z
 4249 000a32  00 00 E3 	          cp ACCAL
 4250 000a34  00 20 AE 	          btss  SR, \#Z
 4251 000a36  00 00 02 	          call fail_AccAChk
 4251         00 00 00 
 4252 000a3a  00 00 28 	          mov \#0x8000, w0
 4253 000a3c  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 4254              	                                    ;   for display routine
 4255 000a3e  00 00 E3 	          cp ACCAH
 4256 000a40  00 20 AE 	          btss  SR, \#Z
 4257 000a42  00 00 02 	          call fail_AccAChk
 4257         00 00 00 
 4258 000a46  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in A = 0xff 8000 0000\.
 4259 000a48  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4260              	                                    ;   for display routine
 4261 000a4a  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\. 
 4262 000a4c  00 20 AE 	          btss  SR, \#Z
 4263 000a4e  00 00 02 	          call fail_AccAChk
 4263         00 00 00 
 4264              	
 4265 000a52  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4266 000a54  00 20 AE 	          btss SR, \#Z
 4267 000a56  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4267         00 00 00 
 4268              	                                    ;   branch and display accumulator\.
 4269 000a5a  00 00 20 	          mov \#0x0000, w0
 4270 000a5c  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4271              	                                    ;   for display routine
 4272 000a5e  00 00 E3 	          cp ACCBL
 4273 000a60  00 20 AE 	          btss  SR, \#Z
 4274 000a62  00 00 02 	          call fail_AccBChk
 4274         00 00 00 
 4275 000a66  30 F0 2F 	          mov \#0xff03, w0
 4276 000a68  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4277              	                                    ;   for display routine
 4278 000a6a  00 00 E3 	          cp ACCBH
 4279 000a6c  00 20 AE 	          btss  SR, \#Z
 4280 000a6e  00 00 02 	          call fail_AccBChk
 4280         00 00 00 
 4281 000a72  F0 07 20 	          mov \#0x007f, w0           ; Verify that there is no change in B value\.
 4282 000a74  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4283              	                                    ;   for display routine
 4284 000a76  00 00 E3 	          cp ACCBU
 4285 000a78  00 20 AE 	          btss  SR, \#Z
 4286 000a7a  00 00 02 	          call fail_AccBChk
 4286         00 00 00 
 4287              	
 4288 000a7e  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 4289 000a80  00 20 AE 	          btss  SR, \#Z
 4290 000a82  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4290         00 00 00 
 4291              	                                    ;   branch and display accumulator\.
 4292 000a86  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4293              	                                    ;   following checks is 1
MPLAB ASM30 Listing:  .+cert0600\.s 			page 37


 4294 000a88  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4295              	                                    ;   following checks is 0 
 4296 000a8a  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
 4297 000a8c  00 00 02 	          call fail_OB              ;    SA = 1, OA = 0\.
 4297         00 00 00 
 4298 000a90  01 80 AF 	          btsc SR, \#SB
 4299 000a92  00 00 02 	          call fail_SB
 4299         00 00 00 
 4300 000a96  01 60 AF 	          btsc SR, \#OAB
 4301 000a98  00 00 02 	          call fail_OAB
 4301         00 00 00 
 4302 000a9c  01 E0 AF 	          btsc SR, \#OA
 4303 000a9e  00 00 02 	          call fail_OA
 4303         00 00 00 
 4304 000aa2  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4305              	                                    ;   following checks is 0  
 4306 000aa4  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4307              	                                    ;   following checks is 1  
 4308 000aa6  01 A0 AE 	          btss SR, \#SA
 4309 000aa8  00 00 02 	          call fail_SA
 4309         00 00 00 
 4310 000aac  01 40 AE 	          btss SR, \#SAB
 4311 000aae  00 00 02 	          call fail_SAB
 4311         00 00 00 
 4312              	          
 4313 000ab2  00 00 04 	          goto test17          
 4313         00 00 00 
 4314              	
 4315              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4316              	         ;\*  TEST 17 \(Test for Positive saturation on B       \*;
 4317              	         ;\*            with Adder bit 39 overflow\)            \*;
 4318              	         ;\*  0x7f fffe 8000 - 0xff 8000 0000 = 0x00 7fff ffff \*;
 4319              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4320              	
 4321 000ab6  04 20 EC 	test17:   inc testnum
 4322 000ab8  12 01 C3 	          clr A                     ; Set initial conditions, 
 4323 000aba  12 81 C3 	          clr B                     ; This will clear all overflow and
 4324              	                                    ;  saturation flags in SR register\. 
 4325 000abc  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4326              	                                    ;  saturation flags now\.  
 4327              	
 4328 000abe  00 00 20 	          mov \#0x0000,w0            ; Load A with 0xff 8000 0000\.
 4329 000ac0  00 00 88 	          mov w0, ACCAL
 4330 000ac2  00 00 28 	          mov \#0x8000, w0
 4331 000ac4  00 00 88 	          mov w0, ACCAH
 4332 000ac6  F0 FF 2F 	          mov \#0xffff, w0
 4333 000ac8  00 00 88 	          mov w0, ACCAU
 4334              	
 4335 000aca  00 00 28 	          mov \#0x8000,w0            ; Load B with 0x7f fffe 8000\.
 4336 000acc  00 00 88 	          mov w0, ACCBL
 4337 000ace  E0 FF 2F 	          mov \#0xfffe, w0
 4338 000ad0  00 00 88 	          mov w0, ACCBH
 4339 000ad2  F0 07 20 	          mov \#0x007f, w0
 4340 000ad4  00 00 88 	          mov w0, ACCBU
 4341              	
 4342 000ad6  00 B0 CB 	          sub B
 4343              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 38


 4344 000ad8  F0 FF 2F 	          mov \#0xffff, w0           ; Check result in B = 0x00 7fff ffff\.
 4345 000ada  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4346              	                                    ;   for display routine
 4347 000adc  00 20 A9 	          bclr SR, \#Z
 4348 000ade  00 00 E3 	          cp ACCBL
 4349 000ae0  00 20 AE 	          btss  SR, \#Z
 4350 000ae2  00 00 02 	          call fail_AccBChk
 4350         00 00 00 
 4351 000ae6  F0 FF 27 	          mov \#0x7fff, w0
 4352 000ae8  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4353              	                                    ;   for display routine
 4354 000aea  00 00 E3 	          cp ACCBH
 4355 000aec  00 20 AE 	          btss  SR, \#Z
 4356 000aee  00 00 02 	          call fail_AccBChk
 4356         00 00 00 
 4357 000af2  00 00 20 	          mov \#0x0000, w0
 4358 000af4  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4359              	                                    ;   for display routine
 4360 000af6  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\. 
 4361 000af8  00 20 AE 	          btss  SR, \#Z
 4362 000afa  00 00 02 	          call fail_AccBChk
 4362         00 00 00 
 4363              	
 4364 000afe  10 00 E2 	          cp0   accErr              ; accErr is incremented in fail routine,
 4365 000b00  00 20 AE 	          btss  SR, \#Z
 4366 000b02  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4366         00 00 00 
 4367              	                                    ;   branch and display accumulator\.
 4368 000b06  00 00 20 	          mov \#0x0000, w0
 4369 000b08  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4370              	                                    ;   for display routine
 4371 000b0a  00 00 E3 	          cp ACCAL
 4372 000b0c  00 20 AE 	          btss  SR, \#Z
 4373 000b0e  00 00 02 	          call fail_AccAChk
 4373         00 00 00 
 4374 000b12  00 00 28 	          mov \#0x8000, w0
 4375 000b14  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 4376              	                                    ;   for display routine
 4377 000b16  00 00 E3 	          cp ACCAH
 4378 000b18  00 20 AE 	          btss  SR, \#Z
 4379 000b1a  00 00 02 	          call fail_AccAChk
 4379         00 00 00 
 4380 000b1e  F0 FF 2F 	          mov \#0xffff, w0           ; Verify that there is no change in A value\.
 4381 000b20  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4382              	                                    ;   for display routine
 4383 000b22  00 00 E3 	          cp ACCAU
 4384 000b24  00 20 AE 	          btss  SR, \#Z
 4385 000b26  00 00 02 	          call fail_AccAChk
 4385         00 00 00 
 4386              	
 4387 000b2a  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4388 000b2c  00 20 AE 	          btss  SR, \#Z
 4389 000b2e  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4389         00 00 00 
 4390              	                                    ;   branch and display accumulator\.
 4391              	
 4392 000b32  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
MPLAB ASM30 Listing:  .+cert0600\.s 			page 39


 4393              	                                    ;   following checks is 1
 4394 000b34  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4395              	                                    ;   following checks is 0          
 4396 000b36  01 E0 AF 	          btsc SR, \#OA              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
 4397 000b38  00 00 02 	          call fail_OA              ;    SA = 0, OA = 0\.
 4397         00 00 00 
 4398 000b3c  01 A0 AF 	          btsc SR, \#SA
 4399 000b3e  00 00 02 	          call fail_SA
 4399         00 00 00 
 4400 000b42  01 60 AF 	          btsc SR, \#OAB
 4401 000b44  00 00 02 	          call fail_OAB
 4401         00 00 00 
 4402 000b48  01 C0 AF 	          btsc SR, \#OB
 4403 000b4a  00 00 02 	          call fail_OB
 4403         00 00 00 
 4404              	
 4405 000b4e  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4406              	                                    ;   following checks is 0  
 4407 000b50  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4408              	                                    ;   following checks is 1
 4409 000b52  01 40 AE 	          btss SR, \#SAB
 4410 000b54  00 00 02 	          call fail_SAB
 4410         00 00 00 
 4411 000b58  01 80 AE 	          btss SR, \#SB
 4412 000b5a  00 00 02 	          call fail_SB
 4412         00 00 00 
 4413              	
 4414              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4415              	         ;\*    Enable 9\.31 Saturation for both Accumulators\.  \*;
 4416              	         ;\*     \(Set SATA, SATB and ACCSAT in CORCON\)         \*;
 4417              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4418              	
 4419 000b5e  00 E0 A8 	         bset CORCON, \#SATA
 4420 000b60  00 C0 A8 	         bset CORCON, \#SATB
 4421 000b62  00 80 A8 	         bset CORCON, \#ACCSAT
 4422              	         
 4423 000b64  00 00 04 	          goto test18         
 4423         00 00 00 
 4424              	
 4425              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4426              	         ;\*  TEST 18 \(Test for Positive Saturation on A\)      \*;
 4427              	         ;\*  0x7f ffff ffff - 0x80 0000 0000 = 0x7f ffff ffff \*;
 4428              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4429              	
 4430 000b68  04 20 EC 	test18:   inc testnum
 4431 000b6a  12 01 C3 	          clr A                     ; Set initial conditions, 
 4432 000b6c  12 81 C3 	          clr B                     ; This will clear all overflow and
 4433              	                                    ;  saturation flags in SR register\. 
 4434              	
 4435 000b6e  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4436              	                                    ;  saturation flags now\.  
 4437              	
 4438 000b70  F0 FF 2F 	          mov \#0xffff,w0            ; Load A with 0x7f ffff ffff\.
 4439 000b72  00 00 88 	          mov w0, ACCAL
 4440 000b74  F0 FF 2F 	          mov \#0xffff, w0
 4441 000b76  00 00 88 	          mov w0, ACCAH
 4442 000b78  F0 07 20 	          mov \#0x7f, w0
MPLAB ASM30 Listing:  .+cert0600\.s 			page 40


 4443 000b7a  00 00 88 	          mov w0, ACCAU
 4444              	
 4445 000b7c  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x80 0000 0000\.
 4446 000b7e  00 00 88 	          mov w0, ACCBL
 4447 000b80  00 00 20 	          mov \#0x0000, w0
 4448 000b82  00 00 88 	          mov w0, ACCBH
 4449 000b84  00 08 20 	          mov \#0x80, w0
 4450 000b86  00 00 88 	          mov w0, ACCBU 
 4451              	
 4452 000b88  00 30 CB 	          sub A
 4453              	
 4454 000b8a  F0 FF 2F 	          mov \#0xffff, w0
 4455 000b8c  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
 4456              	                                    ;   for display routine
 4457 000b8e  00 20 A9 	          bclr SR, \#Z
 4458 000b90  00 00 E3 	          cp ACCAL
 4459 000b92  00 20 AE 	          btss  SR, \#Z
 4460 000b94  00 00 02 	          call fail_AccAChk
 4460         00 00 00 
 4461 000b98  F0 FF 2F 	          mov \#0xffff, w0
 4462 000b9a  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH,
 4463              	                                    ;   for display routine
 4464 000b9c  00 00 E3 	          cp ACCAH
 4465 000b9e  00 20 AE 	          btss  SR, \#Z
 4466 000ba0  00 00 02 	          call fail_AccAChk
 4466         00 00 00 
 4467 000ba4  F0 07 20 	          mov \#0x007f, w0           ; Check result in A = 0x7f ffff ffff\.
 4468 000ba6  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4469              	                                    ;   for display routine
 4470 000ba8  00 00 E3 	          cp ACCAU                  ; If not equal branch to fail\. 
 4471 000baa  00 20 AE 	          btss  SR, \#Z
 4472 000bac  00 00 02 	          call fail_AccAChk
 4472         00 00 00 
 4473              	
 4474 000bb0  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4475 000bb2  00 20 AE 	          btss  SR, \#Z
 4476 000bb4  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4476         00 00 00 
 4477              	                                    ;   branch and display accumulator\.
 4478              	
 4479 000bb8  00 00 20 	          mov \#0x0000, w0
 4480 000bba  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4481              	                                    ;   for display routine
 4482 000bbc  00 00 E3 	          cp ACCBL
 4483 000bbe  00 20 AE 	          btss  SR, \#Z
 4484 000bc0  00 00 02 	          call fail_AccBChk
 4484         00 00 00 
 4485 000bc4  00 00 20 	          mov \#0x0000, w0
 4486 000bc6  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4487              	                                    ;   for display routine
 4488 000bc8  00 00 E3 	          cp ACCBH
 4489 000bca  00 20 AE 	          btss  SR, \#Z
 4490 000bcc  00 00 02 	          call fail_AccBChk
 4490         00 00 00 
 4491 000bd0  00 F8 2F 	          mov \#0xff80, w0           ; Verify that there is no change in B value\.
 4492 000bd2  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4493              	                                    ;   for display routine
MPLAB ASM30 Listing:  .+cert0600\.s 			page 41


 4494 000bd4  00 00 E3 	          cp ACCBU
 4495 000bd6  00 20 AE 	          btss  SR, \#Z
 4496 000bd8  00 00 02 	          call fail_AccBChk
 4496         00 00 00 
 4497              	
 4498 000bdc  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4499 000bde  00 20 AE 	          btss  SR, \#Z
 4500 000be0  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4500         00 00 00 
 4501              	                                    ;   branch and display accumulator\.
 4502              	
 4503 000be4  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4504              	                                    ;   following checks is 1
 4505 000be6  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4506              	                                    ;   following checks is 0 
 4507 000be8  01 C0 AF 	          btsc SR, \#OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
 4508 000bea  00 00 02 	          call fail_OB              ;    SA = 1, OA = 1\.
 4508         00 00 00 
 4509 000bee  01 80 AF 	          btsc SR, \#SB
 4510 000bf0  00 00 02 	          call fail_SB
 4510         00 00 00 
 4511 000bf4  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4512              	                                    ;   following checks is 0  
 4513 000bf6  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4514              	                                    ;   following checks is 1  
 4515 000bf8  01 60 AE 	          btss SR, \#OAB
 4516 000bfa  00 00 02 	          call fail_OAB
 4516         00 00 00 
 4517 000bfe  01 40 AE 	          btss SR, \#SAB
 4518 000c00  00 00 02 	          call fail_SAB
 4518         00 00 00 
 4519 000c04  01 E0 AE 	          btss SR, \#OA
 4520 000c06  00 00 02 	          call fail_OA
 4520         00 00 00 
 4521 000c0a  01 A0 AE 	          btss SR, \#SA
 4522 000c0c  00 00 02 	          call fail_SA
 4522         00 00 00 
 4523              	          
 4524 000c10  00 00 04 	          goto test19          
 4524         00 00 00 
 4525              	
 4526              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4527              	         ;\*  TEST 19 \(Test for Negative saturation on B\)      \*;
 4528              	         ;\*  0x80 0000 0000 - 0x00 0000 0001 = 0x80 0000 0000 \*;
 4529              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4530              	        
 4531 000c14  04 20 EC 	test19:   inc testnum
 4532 000c16  12 01 C3 	          clr A                     ; Set initial conditions, 
 4533 000c18  12 81 C3 	          clr B                     ; This will clear all overflow and
 4534              	                                    ;  saturation flags in SR register\. 
 4535              	
 4536 000c1a  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4537              	                                    ;  saturation flags now\.  
 4538              	
 4539 000c1c  10 00 20 	          mov \#0x0001,w0            ; Load A with 0x00 0000 0001\.
 4540 000c1e  00 00 88 	          mov w0, ACCAL
 4541 000c20  00 00 20 	          mov \#0x0000, w0
MPLAB ASM30 Listing:  .+cert0600\.s 			page 42


 4542 000c22  00 00 88 	          mov w0, ACCAH
 4543 000c24  00 00 20 	          mov \#0x0000, w0
 4544 000c26  00 00 88 	          mov w0, ACCAU
 4545              	
 4546 000c28  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x80 0000 0000\.
 4547 000c2a  00 00 88 	          mov w0, ACCBL
 4548 000c2c  00 00 20 	          mov \#0x0000, w0
 4549 000c2e  00 00 88 	          mov w0, ACCBH
 4550 000c30  00 F8 2F 	          mov \#0xff80, w0
 4551 000c32  00 00 88 	          mov w0, ACCBU
 4552              	
 4553 000c34  00 B0 CB 	          sub B
 4554              	
 4555 000c36  00 00 20 	          mov \#0x0000, w0
 4556 000c38  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4557              	                                    ;   for display routine
 4558 000c3a  00 20 A9 	          bclr SR, \#Z
 4559 000c3c  00 00 E3 	          cp ACCBL
 4560 000c3e  00 20 AE 	          btss  SR, \#Z
 4561 000c40  00 00 02 	          call fail_AccBChk
 4561         00 00 00 
 4562 000c44  00 00 20 	          mov \#0x0000, w0
 4563 000c46  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4564              	                                    ;   for display routine
 4565 000c48  00 00 E3 	          cp ACCBH
 4566 000c4a  00 20 AE 	          btss  SR, \#Z
 4567 000c4c  00 00 02 	          call fail_AccBChk
 4567         00 00 00 
 4568 000c50  00 F8 2F 	          mov \#0xff80, w0           ; Check result in B = 0x80 0000 0000\.
 4569 000c52  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4570              	                                    ;   for display routine
 4571 000c54  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\. 
 4572 000c56  00 20 AE 	          btss  SR, \#Z
 4573 000c58  00 00 02 	          call fail_AccBChk
 4573         00 00 00 
 4574              	
 4575 000c5c  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4576 000c5e  00 20 AE 	          btss  SR, \#Z
 4577 000c60  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4577         00 00 00 
 4578              	                                    ;   branch and display accumulator\.
 4579              	
 4580 000c64  10 00 20 	          mov \#0x0001, w0
 4581 000c66  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4582              	                                    ;   for display routine
 4583 000c68  00 00 E3 	          cp ACCAL
 4584 000c6a  00 20 AE 	          btss  SR, \#Z
 4585 000c6c  00 00 02 	          call fail_AccAChk
 4585         00 00 00 
 4586 000c70  00 00 20 	          mov \#0x0000, w0
 4587 000c72  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 4588              	                                    ;   for display routine
 4589 000c74  00 00 E3 	          cp ACCAH
 4590 000c76  00 20 AE 	          btss  SR, \#Z
 4591 000c78  00 00 02 	          call fail_AccAChk
 4591         00 00 00 
 4592 000c7c  00 00 20 	          mov \#0x0000, w0           ; Verify that there is no change in A value\.
MPLAB ASM30 Listing:  .+cert0600\.s 			page 43


 4593 000c7e  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4594              	                                    ;   for display routine
 4595 000c80  00 00 E3 	          cp ACCAU
 4596 000c82  00 20 AE 	          btss  SR, \#Z
 4597 000c84  00 00 02 	          call fail_AccAChk
 4597         00 00 00 
 4598              	
 4599 000c88  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4600 000c8a  00 20 AE 	          btss  SR, \#Z
 4601 000c8c  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4601         00 00 00 
 4602              	                                    ;   branch and display accumulator\.
 4603              	
 4604 000c90  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4605              	                                    ;   following checks is 1
 4606 000c92  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4607              	                                    ;   following checks is 0 
 4608 000c94  01 E0 AF 	          btsc SR, \#OA              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
 4609 000c96  00 00 02 	          call fail_OA              ;    SA = 0, OA = 0\.
 4609         00 00 00 
 4610 000c9a  01 A0 AF 	          btsc SR, \#SA
 4611 000c9c  00 00 02 	          call fail_SA
 4611         00 00 00 
 4612 000ca0  06 20 EF 	          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
 4613              	                                    ;   following checks is 0  
 4614 000ca2  08 00 A8 	          bset  ExpctdVal, \#0       ; ExpctdVal = 1, Expected value of flags for
 4615              	                                    ;   following checks is 1  
 4616 000ca4  01 60 AE 	          btss SR, \#OAB
 4617 000ca6  00 00 02 	          call fail_OAB
 4617         00 00 00 
 4618 000caa  01 40 AE 	          btss SR, \#SAB
 4619 000cac  00 00 02 	          call fail_SAB
 4619         00 00 00 
 4620 000cb0  01 C0 AE 	          btss SR, \#OB
 4621 000cb2  00 00 02 	          call fail_OB
 4621         00 00 00 
 4622 000cb6  01 80 AE 	          btss SR, \#SB
 4623 000cb8  00 00 02 	          call fail_SB
 4623         00 00 00 
 4624              	          
 4625 000cbc  00 00 04 	          goto test20          
 4625         00 00 00 
 4626              	
 4627              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4628              	         ;\*  TEST 20 \(Test for zero result on B\)              \*;
 4629              	         ;\*  0x80 0000 0000 - 0x80 0000 0000 = 0x00 0000 0000 \*;
 4630              	         ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*; 
 4631              	
 4632 000cc0  04 20 EC 	test20:   inc testnum
 4633 000cc2  12 01 C3 	          clr A                     ; Set initial conditions, 
 4634 000cc4  12 81 C3 	          clr B                     ; This will clear all overflow and
 4635              	                                    ;  saturation flags in SR register\. 
 4636              	
 4637 000cc6  00 20 EF 	          clr SR                    ; As clr A and Clr B does not clear 
 4638              	                                    ;  saturation flags now\.  
 4639              	
 4640 000cc8  00 00 20 	          mov \#0x0000,w0            ; Load A with 0x80 0000 0000\.
MPLAB ASM30 Listing:  .+cert0600\.s 			page 44


 4641 000cca  00 00 88 	          mov w0, ACCAL
 4642 000ccc  00 00 20 	          mov \#0x0000, w0
 4643 000cce  00 00 88 	          mov w0, ACCAH
 4644 000cd0  00 F8 2F 	          mov \#0xff80, w0
 4645 000cd2  00 00 88 	          mov w0, ACCAU
 4646              	
 4647 000cd4  00 00 20 	          mov \#0x0000,w0            ; Load B with 0x80 0000 0000\.
 4648 000cd6  00 00 88 	          mov w0, ACCBL
 4649 000cd8  00 00 20 	          mov \#0x0000, w0
 4650 000cda  00 00 88 	          mov w0, ACCBH
 4651 000cdc  00 F8 2F 	          mov \#0xff80, w0
 4652 000cde  00 00 88 	          mov w0, ACCBU
 4653              	
 4654 000ce0  00 B0 CB 	          sub B
 4655              	
 4656 000ce2  00 00 20 	          mov \#0x0000, w0
 4657 000ce4  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
 4658              	                                    ;   for display routine
 4659 000ce6  00 20 A9 	          bclr SR, \#Z
 4660 000ce8  00 00 E3 	          cp ACCBL
 4661 000cea  00 20 AE 	          btss  SR, \#Z
 4662 000cec  00 00 02 	          call fail_AccBChk
 4662         00 00 00 
 4663 000cf0  00 00 20 	          mov \#0x0000, w0
 4664 000cf2  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCBH, 
 4665              	                                    ;   for display routine
 4666 000cf4  00 00 E3 	          cp ACCBH
 4667 000cf6  00 20 AE 	          btss  SR, \#Z
 4668 000cf8  00 00 02 	          call fail_AccBChk
 4668         00 00 00 
 4669 000cfc  00 00 20 	          mov \#0x0000, w0           ; Check result in B = 0x00 0000 0000\.
 4670 000cfe  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCBU, 
 4671              	                                    ;   for display routine
 4672 000d00  00 00 E3 	          cp ACCBU                  ; If not equal branch to fail\. 
 4673 000d02  00 20 AE 	          btss  SR, \#Z
 4674 000d04  00 00 02 	          call fail_AccBChk
 4674         00 00 00 
 4675              	
 4676 000d08  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4677 000d0a  00 20 AE 	          btss  SR, \#Z
 4678 000d0c  00 00 02 	          call  accBDisplay         ; If accumulator check has failed,
 4678         00 00 00 
 4679              	                                    ;   branch and display accumulator\.
 4680              	
 4681 000d10  00 00 20 	          mov \#0x0000, w0
 4682 000d12  00 00 88 	          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
 4683              	                                    ;   for display routine
 4684 000d14  00 00 E3 	          cp ACCAL
 4685 000d16  00 20 AE 	          btss  SR, \#Z
 4686 000d18  00 00 02 	          call fail_AccAChk
 4686         00 00 00 
 4687 000d1c  00 00 20 	          mov \#0x0000, w0
 4688 000d1e  10 00 88 	          mov w0, ExpctdAcc\+2       ; Store Expected Value of ACCAH, 
 4689              	                                    ;   for display routine
 4690 000d20  00 00 E3 	          cp ACCAH
 4691 000d22  00 20 AE 	          btss  SR, \#Z
 4692 000d24  00 00 02 	          call fail_AccAChk
MPLAB ASM30 Listing:  .+cert0600\.s 			page 45


 4692         00 00 00 
 4693 000d28  00 F8 2F 	          mov \#0xff80, w0           ; Verify that there is no change in A value\.
 4694 000d2a  0E E0 B7 	          mov\.b WREG, ExpctdAcc\+4   ; Store Expected Value of ACCAU, 
 4695              	                                    ;   for display routine
 4696 000d2c  00 00 E3 	          cp ACCAU
 4697 000d2e  00 20 AE 	          btss  SR, \#Z
 4698 000d30  00 00 02 	          call fail_AccAChk
 4698         00 00 00 
 4699              	
 4700 000d34  10 00 E2 	          cp0  accErr               ; accErr is incremented in fail routine,
 4701 000d36  00 20 AE 	          btss  SR, \#Z
 4702 000d38  00 00 02 	          call  accADisplay         ; If accumulator check has failed,
 4702         00 00 00 
 4703              	                                    ;   branch and display accumulator\.
 4704              	
 4705 000d3c  06 00 A8 	          bset   ObsrvdVal, \#0      ; ObsrvdVal = 1, Observed value of flags for
 4706              	                                    ;   following checks is 1
 4707 000d3e  08 20 EF 	          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
 4708              	                                    ;   following checks is 0 
 4709 000d40  01 E0 AF 	          btsc SR, \#OA              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
 4710 000d42  00 00 02 	          call fail_OA              ;    SA = 0, OA = 0\.
 4710         00 00 00 
 4711 000d46  01 A0 AF 	          btsc SR, \#SA
 4712 000d48  00 00 02 	          call fail_SA
 4712         00 00 00 
 4713 000d4c  01 60 AF 	          btsc SR, \#OAB
 4714 000d4e  00 00 02 	          call fail_OAB
 4714         00 00 00 
 4715 000d52  01 40 AF 	          btsc SR, \#SAB
 4716 000d54  00 00 02 	          call fail_SAB
 4716         00 00 00 
 4717 000d58  01 C0 AF 	          btsc SR, \#OB
 4718 000d5a  00 00 02 	          call fail_OB
 4718         00 00 00 
 4719 000d5e  01 80 AF 	          btsc SR, \#SB
 4720 000d60  00 00 02 	          call fail_SB 
 4720         00 00 00 
 4721              	
 4722 000d64  00 A0 BF 	          mov\.w   errnum
 4723 000d66  00 00 32 	          bra z,  Pass
 4724              	          
 4725 000d68  00 00 04 	          goto Fail          
 4725         00 00 00 
 4726              	
 4727              	        /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
 4728              	           Fail Indicator: Indicates that one or more tests   
 4729              	                           Have failed\.                     
 4730              	        \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
 4731              	
 4732 000d6c  00 00 04 	Fail:   goto    Fail_end
 4732         00 00 00 
 4733 000d70  00 40 DA 	        HALT                   ;Halt the simulator if we get here\.
 4734 000d72  00 00 04 	        goto Fail
 4734         00 00 00 
 4735              	
 4736              	        /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
 4737              	          Pass Indicator: Indicates that all tests have      
MPLAB ASM30 Listing:  .+cert0600\.s 			page 46


 4738              	                          passed\.                         
 4739              	        \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
 4740              	
 4741 000d76  00 00 04 	Pass:   goto    Pass_end
 4741         00 00 00 
 4742              	
 4743              	         /\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
 4744              	                                Error Messages 
 4745              	          \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*/
 4746              	          \.data
 4747 02ce 45 78 70 65 	displayAccA:\.asciz \"Expected value of AccA is 0x\%0\.2x \%4\.4x \%4\.4x\\nObserved value of AccA is 0x\%0\.2
 4747      63 74 65 64 
 4747      20 76 61 6C 
 4747      75 65 20 6F 
 4747      66 20 41 63 
 4747      63 41 20 69 
 4747      73 20 30 78 
 4747      25 30 2E 32 
 4747      78 20 25 34 
 4748                 	          \.text
 4749              	          \.data
 4750 032b 45 78 70 65 	displayAccB:\.asciz \"Expected value of AccB is 0x\%0\.2x \%4\.4x \%4\.4x\\nObserved value of AccB is 0x\%0\.2
 4750      63 74 65 64 
 4750      20 76 61 6C 
 4750      75 65 20 6F 
 4750      66 20 41 63 
 4750      63 42 20 69 
 4750      73 20 30 78 
 4750      25 30 2E 32 
 4750      78 20 25 34 
 4751                 	
 4752                 	          \.text
 4753              	
 4754              	        ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4755              	        ;\* Fail routine:                                        \*;
 4756              	        ;\*   Output a fail message to stdout with the           \*;
 4757              	        ;\*     the number of the failed test in the test files\. \*;
 4758              	        ;\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*;
 4759              	
 4760              	accADisplay:
 4761 000d7a  10 20 EF 	          clr accErr
 4762              	
 4763 000d7c  00 00 F8 	          push ACCAL                        ; Push observed value of ACCAL
 4764              	          \.set stacksize, 2
 4765              	
 4766 000d7e  00 00 F8 	          push ACCAH                        ; Push observed value of ACCAH
 4767              	         \.set stacksize, stacksize\+2
 4768              	
 4769 000d80  00 00 80 	          mov ACCAU, w0                     ; Clear the upper byte 
 4770 000d82  01 60 EF 	          clr\.b 0x01                        ;  so that only 40 bits of accumulator is 
 4771              	                                            ;  displayed\.
 4772 000d84  80 1F 78 	          push w0                           ; Push observed value of ACCAU
 4773              	          \.set stacksize, stacksize\+2
 4774              	
 4775 000d86  00 00 F8 	          push ExpctdAcc                    ; Push expected value of ACCAL
 4776              	         \.set stacksize, stacksize\+2
 4777              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 47


 4778 000d88  02 00 F8 	          push ExpctdAcc\+2                  ; Push expected value of ACCAH
 4779              	         \.set stacksize, stacksize\+2
 4780              	
 4781 000d8a  04 00 F8 	          push ExpctdAcc\+4                  ; Push expected value of ACCAU
 4782              	         \.set stacksize, stacksize\+2
 4783              	
 4784 000d8c  00 00 20 	          mov\.w \#displayAccA, w0            ; Push the address of the string onto the stack\.
 4785 000d8e  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4786              	         \.set stacksize, stacksize\+2
 4787              	
 4788 000d90  00 00 02 	          call _printf                      ; Call the stdio routine printf\.
 4788         00 00 00 
 4789 000d94  EE 87 57 	          sub\.w w15,\#stacksize,w15          ; Pop parameters off the stack\.
 4790              	         \.set stacksize, 0
 4791 000d96  00 00 06 	          return
 4792              	
 4793              	accBDisplay:
 4794              	
 4795 000d98  10 20 EF 	          clr accErr
 4796              	
 4797 000d9a  00 00 F8 	          push ACCBL                        ; Push observed value of ACCBL
 4798              	          \.set stacksize, 2
 4799              	
 4800 000d9c  00 00 F8 	          push ACCBH                         ; Push observed value of ACCBH
 4801              	         \.set stacksize, stacksize\+2
 4802              	
 4803 000d9e  00 00 80 	          mov ACCBU, w0                      ; Clear the upper byte 
 4804 000da0  01 60 EF 	          clr\.b 0x01                         ;  so that only 40 bits of accumulator is 
 4805              	                                             ;  displayed\.      
 4806 000da2  80 1F 78 	          push w0                            ; Push observed value of ACCBU
 4807              	         \.set stacksize, stacksize\+2
 4808              	
 4809 000da4  00 00 F8 	          push ExpctdAcc                     ; Push expected value of ACCBL
 4810              	         \.set stacksize, stacksize\+2
 4811              	
 4812 000da6  02 00 F8 	          push ExpctdAcc\+2                   ; Push expected value of ACCBH
 4813              	         \.set stacksize, stacksize\+2
 4814              	
 4815 000da8  04 00 F8 	          push ExpctdAcc\+4                   ; Push expected value of ACCBU
 4816              	         \.set stacksize, stacksize\+2
 4817              	
 4818 000daa  00 00 20 	          mov\.w \#displayAccB, w0             ; Push the address of the string onto the stack\.
 4819 000dac  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4820              	         \.set stacksize, stacksize\+2
 4821              	
 4822 000dae  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4822         00 00 00 
 4823 000db2  EE 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4824              	         \.set stacksize, 0
 4825              	
 4826 000db4  00 00 06 	          return
 4827              	
 4828              	
 4829              	fail_AccAChk:
 4830 000db6  00 20 EC 	          inc     errnum
 4831 000db8  10 20 EC 	          inc     accErr 
 4832              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 48


 4833 000dba  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4834 000dbc  00 00 20 	          mov\.w \#failAccA, w0                ; Push the address of the string onto the stack\.
 4835 000dbe  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4836 000dc0  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4836         00 00 00 
 4837 000dc4  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4838 000dc6  00 00 06 	          return
 4839 000dc8  00 00 04 	          goto Fail_end
 4839         00 00 00 
 4840 000dcc  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4841              	
 4842              	fail_AccBChk:
 4843 000dce  00 20 EC 	          inc     errnum
 4844 000dd0  10 20 EC 	          inc     accErr 
 4845              	
 4846 000dd2  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4847 000dd4  00 00 20 	          mov\.w \#failAccB, w0                ; Push the address of the string onto the stack\.
 4848 000dd6  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4849 000dd8  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4849         00 00 00 
 4850 000ddc  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4851 000dde  00 00 06 	          return
 4852 000de0  00 00 04 	          goto Fail_end
 4852         00 00 00 
 4853 000de4  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4854              	
 4855              	fail_OA:
 4856 000de6  00 20 EC 	          inc     errnum
 4857              	
 4858 000de8  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4859 000dea  00 00 20 	          mov\.w \#failOA, w0                  ; Push the address of the string onto the stack\.
 4860 000dec  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4861 000dee  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4861         00 00 00 
 4862 000df2  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4863 000df4  00 00 F8 	          push  ObsrvdVal 
 4864              	          \.set stacksize, 2
 4865              	
 4866 000df6  00 00 F8 	          push   ExpctdVal
 4867              	          \.set stacksize, stacksize\+2
 4868              	
 4869 000df8  00 00 20 	          mov\.w \#displayOA, w0               ; Push the address of the string onto the stack\.
 4870 000dfa  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4871              	          \.set stacksize, stacksize\+2
 4872              	
 4873 000dfc  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4873         00 00 00 
 4874 000e00  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4875              	          \.set stacksize, 0
 4876              	
 4877 000e02  00 00 06 	          return                             ; Continue tests
 4878              	
 4879 000e04  00 00 04 	          goto Fail_end
 4879         00 00 00 
 4880 000e08  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4881              	
 4882              	fail_OB:
MPLAB ASM30 Listing:  .+cert0600\.s 			page 49


 4883 000e0a  00 20 EC 	          inc     errnum
 4884              	 
 4885 000e0c  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4886 000e0e  00 00 20 	          mov\.w \#failOB, w0                  ; Push the address of the string onto the stack\.
 4887 000e10  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4888 000e12  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4888         00 00 00 
 4889 000e16  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4890              	          
 4891 000e18  00 00 F8 	          push   ObsrvdVal
 4892              	          \.set stacksize, 2
 4893              	
 4894 000e1a  00 00 F8 	          push   ExpctdVal
 4895              	          \.set stacksize, stacksize\+2
 4896              	
 4897 000e1c  00 00 20 	          mov\.w \#displayOB, w0               ; Push the address of the string onto the stack\.
 4898 000e1e  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4899              	          \.set stacksize, stacksize\+2
 4900              	
 4901 000e20  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4901         00 00 00 
 4902 000e24  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4903              	          \.set stacksize,0 
 4904              	
 4905 000e26  00 00 06 	          return                             ; Continue tests
 4906 000e28  00 00 04 	          goto Fail_end
 4906         00 00 00 
 4907 000e2c  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4908              	
 4909              	fail_SA:
 4910 000e2e  00 20 EC 	          inc     errnum
 4911              	
 4912 000e30  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4913 000e32  00 00 20 	          mov\.w \#failSA, w0                  ; Push the address of the string onto the stack\.
 4914 000e34  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4915 000e36  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4915         00 00 00 
 4916 000e3a  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4917              	
 4918 000e3c  00 00 F8 	          push  ObsrvdVal
 4919              	          \.set stacksize, 2
 4920              	
 4921 000e3e  00 00 F8 	          push   ExpctdVal
 4922              	          \.set stacksize, stacksize\+2
 4923              	
 4924 000e40  00 00 20 	          mov\.w \#displaySA, w0               ; Push the address of the string onto the stack\.
 4925 000e42  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4926              	          \.set stacksize, stacksize\+2
 4927              	
 4928 000e44  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4928         00 00 00 
 4929 000e48  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4930              	          \.set stacksize, 0
 4931              	
 4932 000e4a  00 00 06 	          return                             ; Continue tests
 4933 000e4c  00 00 04 	          goto Fail_end
 4933         00 00 00 
MPLAB ASM30 Listing:  .+cert0600\.s 			page 50


 4934 000e50  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4935              	
 4936              	fail_SB:
 4937 000e52  00 20 EC 	          inc     errnum
 4938              	
 4939 000e54  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4940 000e56  00 00 20 	          mov\.w \#failSB, w0                  ; Push the address of the string onto the stack\.
 4941 000e58  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4942 000e5a  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4942         00 00 00 
 4943 000e5e  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4944              	
 4945 000e60  00 00 F8 	          push   ObsrvdVal
 4946              	          \.set stacksize, 2
 4947              	
 4948 000e62  00 00 F8 	          push   ExpctdVal
 4949              	          \.set stacksize, stacksize\+2
 4950              	
 4951 000e64  00 00 20 	          mov\.w \#displaySB, w0               ; Push the address of the string onto the stack\.
 4952 000e66  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4953              	          \.set stacksize, stacksize\+2
 4954              	
 4955 000e68  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4955         00 00 00 
 4956 000e6c  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4957              	          \.set stacksize, 0
 4958              	
 4959 000e6e  00 00 06 	          return                             ; Continue tests
 4960 000e70  00 00 04 	          goto Fail_end
 4960         00 00 00 
 4961 000e74  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4962              	
 4963              	fail_OAB:
 4964 000e76  00 20 EC 	          inc     errnum
 4965              	
 4966 000e78  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4967 000e7a  00 00 20 	          mov\.w \#failOAB, w0                 ; Push the address of the string onto the stack\.
 4968 000e7c  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4969 000e7e  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4969         00 00 00 
 4970 000e82  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4971              	
 4972 000e84  00 00 F8 	          push  ObsrvdVal
 4973              	          \.set stacksize,2
 4974              	
 4975 000e86  00 00 F8 	          push   ExpctdVal
 4976              	          \.set stacksize, stacksize\+2
 4977              	
 4978 000e88  00 00 20 	          mov\.w \#displayOAB, w0              ; Push the address of the string onto the stack\.
 4979 000e8a  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4980              	          \.set stacksize, stacksize\+2
 4981              	
 4982 000e8c  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4982         00 00 00 
 4983 000e90  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 4984              	          \.set stacksize,0
 4985              	
MPLAB ASM30 Listing:  .+cert0600\.s 			page 51


 4986 000e92  00 00 06 	          return                             ; Continue tests
 4987 000e94  00 00 04 	          goto Fail_end
 4987         00 00 00 
 4988 000e98  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 4989              	
 4990              	fail_SAB:
 4991 000e9a  00 20 EC 	          inc     errnum
 4992              	
 4993 000e9c  00 00 F8 	          push testnum                       ; Push the variable Test_cnt onto the stack\.
 4994 000e9e  00 00 20 	          mov\.w \#failSAB, w0                 ; Push the address of the string onto the stack\.
 4995 000ea0  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 4996 000ea2  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 4996         00 00 00 
 4997 000ea6  E4 87 57 	          sub\.w w15,\#4,w15                   ; Pop parameters off the stack\.
 4998              	
 4999 000ea8  00 00 F8 	          push  ObsrvdVal
 5000              	          \.set stacksize, 2
 5001              	
 5002 000eaa  00 00 F8 	          push   ExpctdVal
 5003              	          \.set stacksize, stacksize\+2
 5004              	
 5005 000eac  00 00 20 	          mov\.w \#displaySAB, w0              ; Push the address of the string onto the stack\.
 5006 000eae  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 5007              	          \.set stacksize, stacksize\+2
 5008              	
 5009 000eb0  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 5009         00 00 00 
 5010 000eb4  E6 87 57 	          sub\.w w15,\#stacksize,w15           ; Pop parameters off the stack\.
 5011              	          \.set stacksize,0   
 5012              	
 5013 000eb6  00 00 06 	          return                             ; Continue tests
 5014 000eb8  00 00 04 	          goto Fail_end
 5014         00 00 00 
 5015 000ebc  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 5016              	
 5017              	
 5018              	Fail_end:
 5019 000ebe  00 00 20 	          mov\.w \#failall, w0                 ; Push the address of the string onto the stack\.
 5020 000ec0  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 5021 000ec2  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 5021         00 00 00 
 5022 000ec6  8F 07 E9 	          dec\.w w15,w15                      ; Pop parameters off the stack\.
 5023 000ec8  00 40 DA 	          HALT                               ; Halt the simulator if we get here\.
 5024              	
 5025              	Pass_end:
 5026 000eca  00 00 20 	          mov\.w \#passall, w0                 ; Push the address of the string onto the stack\.
 5027 000ecc  80 1F 78 	          mov\.w w0,\[w15\+\+\]
 5028 000ece  00 00 02 	          call _printf                       ; Call the stdio routine printf\.
 5028         00 00 00 
 5029 000ed2  8F 07 E9 	          dec\.w w15,w15                      ; Pop parameters off the stack\.
 5030 000ed4  00 40 DA 	          HALT                               ; End of test set, Halt the simulator\.
 5031              	          \.end
