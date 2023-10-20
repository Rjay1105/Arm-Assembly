.section .data
message:
    .asciz "Hello, World!\n"

.section .text
.global _start

_start:
    /* Write "Hello, World!" to stdout (file descriptor 1) */
    mov r0, #1       /* syscall number for sys_write */
    ldr r1, =message /* pointer to the message string */
    ldr r2, =13      /* message length */
    mov r7, #4       /* syscall number for sys_write */
    svc 0            /* invoke syscall */

    /* Exit the program */
    mov r0, #0       /* syscall number for sys_exit */
    mov r7, #1       /* syscall number for sys_exit */
    svc 0            /* invoke syscall */
