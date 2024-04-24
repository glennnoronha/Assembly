.global main

.text
main: 
   mov   r0, #17
   mov   r1, #4
   bl    __aeabi_idivmod
   mov   r2, r1
   mov   r1, r0
   ldr   r0, =outstr
   bl    printf
   b     exit

.data
   outstr:   .asciz   "%d %d\n"
