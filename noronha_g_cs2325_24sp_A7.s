.global main

.text
main:
   // a
   ldr   r0, =outstr1
   bl    printf
   ldr   r0, =instr
   ldr   r1, =a
   bl    scanf
   ldr   r4, =a
   ldr   r4, [r4]

   // b
   ldr   r0, =outstr2
   bl    printf
   ldr   r0, =instr
   ldr   r1, =bb
   bl    scanf
   ldr   r5, =bb
   ldr   r5, [r5]

   // c
   mov   r6, #0

   //move a to r1 and b to r2
   mov   r1, r4
   mov   r2, r5

loop:
   // if b == 0, print
   cmp   r5, #0
   beq   print
   
   //if b & 1 == 1
   and   r7, r5, #1
   cmp   r7, #1
   beq   calc

   //shifting of a and b
   mov   r4, r4, lsl #1
   mov   r5, r5, lsr #1

   b     loop

calc: 
   add  r6, r6, r4
   mov   r4, r4, lsl #1
   mov   r5, r5, lsr #1
   b     loop

print:
   ldr   r0, = outstr3
   // move final value of c to r3
   mov   r3, r6
   bl    printf
   b     exit

.data
   outstr1: .asciz   "Enter first integer: "
   outstr2: .asciz   "Enter second integer: "
   outstr3: .asciz   "%d multiplied by %d is %d\n"
   instr:   .asciz   "%d"
   a:   .word    0   
   bb:  .word    0
