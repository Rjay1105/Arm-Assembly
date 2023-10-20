.section .data
hello_string:   .asciz "Hello, World!\n"

.section .text
.global _start

_start:
    // Write the hello_string to stdout
    mov x0, 1                      // File descriptor: STDOUT
    ldr x1, =hello_string          // Pointer to the string
    ldr x2, =13                    // Length of the string
    mov x8, 64                     // System call number: write
    svc 0                          // Trigger the system call

    // Exit the program
    mov x8, 93                     // System call number: exit
    mov x0, 0                      // Exit code
    svc 0                          // Trigger the system call


