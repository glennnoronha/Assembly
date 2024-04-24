// CS 2325/L 24SP
// A6
// Name: Glenn
// Buff-ID: 1057121


.global main

.text
main:
   ldr   r4, =array1   //load array1 into r4
   ldr   r5, =array2   //load array2 intp r5
   mov   r6, #0        //counter

modulo:
   ldr   r0, =n          //load n
   cmp   r6, r0          //if counter == n, exit loop
   beq   reset           //go to reset
   ldr   r0, [r4]        //load value at array1 to r0
   ldr   r1, [r5]        //load value at array2 to r1
   bl    __aeabi_idivmod //modulo calculation
   str   r1, [r4]        //store modulo in r1
   add   r4, r4, #4      //increment array1
   add   r5, r5, #4      //increment array2
   add   r6, r6, #1      //increment counter
   b     modulo          
reset: 
   mov   r6, #0          //reset counter
   ldr   r4, =array1     //reset to front of array1

loop:
   ldr   r0, =n          //load n
   cmp   r6, r0          //if counter == n, exit loop
   beq   done            //go to done
   ldr   r0, =outstr     
   ldr   r1, [r4]        //load value at array1[counter]
   bl    printf          //print value
   add   r4, r4, #4      //increment array1
   add   r6, r6, #1      //increment counter
   b     loop  

done:
   ldr   r0, =newline
   bl    printf          //print newline
   b     exit
.data
   outstr:  .asciz   "%d "
   newline: .asciz   "\n"

   // test case 1
   array1:  .word    9,11,3,2,4,13,7,6,4,5
   array2:  .word    2,3,3,2,3,3,3,2,2,3,2
   .equ n, 10

   // test case 2
   //array1:  .word    2,3,3,3,2,2,3,2,3,2,3,3,2,2,3,2,3
   //array2:  .word    3,2,2,2,3,3,2,3,2,3,2,2,3,3,2,3,2
   //.equ n, 17
 
   // test case 3
   //array1:  .word    123
   //array2:  .word    4
   //.equ n, 1
