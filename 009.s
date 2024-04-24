.global main

.text
main:
   // lsl: logical bitwise shift left
   // lsr: logical bitwise shift right
   mov   r4, #0  //index (shift amount)

loop:
   ldr   r0, =n
   cmp   r4, r0
   bgt   done
   mov   r1, #1
   mov   r1, r1, lsr #4
   ldr   r0, =outstr
   bl    printf
   add   r4, r4, #1
done:
   b     exit

.data
   outstr: .asciz "%d\n"
   .equ n, 8
   