.global main

.text
main:
   mov   r4, #0          //index tracker
   ldr   r5, =array1     //memory tracker
   mov   r6, r5
   add   r6, r6, #8      //+8 to get to third element +0=first, +4=second...
   mov   r0, #9
   str   r0, [r6]        //changing third number in array to 9
loop:
   ldr   r0, =n
   cmp   r4, r0
   beq   done
   ldr   r0, =outstr2
   ldr   r1, [r5]
   bl    printf
   add   r5, r5, #4      //increment array address
   add   r4, r4, #1      //increment index
   b     loop
done:
   b     exit         //HALT
.data
   outstr2:   .asciz   "%d\n"
   array1:    .word    7,8,1,4,3
   .equ       n, 5 
