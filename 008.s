//i = 0
//printf("Enter an integer")
//scanf("%d, &i")
//if (i & 1 == 1)
//  printf(%d is an odd int\n", i)
//else
//  printf("%d is an even int\n", i)

.global main

.text
main:
   ldr   r0, =outstr1
   bl    printf
   ldr   r0, =instr
   ldr   r1, =a
   bl    scanf
   ldr   r4, =a
   ldr   r4, [r4]
   and   r1, r4, #1
   cmp   r1, #1
   mov   r1, r4
   beq   odd
   ldr   r0, =outstr2
   bl    printf
   b     exit

odd:
   ldr   r0, = outstr3
   bl    printf
   b     exit

.data
   outstr1: .asciz   "Enter an integer: : "
   outstr2: .asciz   "%d is an even integer\n"
   outstr3: .asciz   "%d is an odd integer\n"
   instr:   .asciz   "%d"
   a:   .word    0
