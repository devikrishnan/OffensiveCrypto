BITS 64

extern printf
extern getenv


section .rodata
    var1 : db "Not Found", 10, 0
    out: db "%s", 10, 0

section .text 
    global main

        main:
            push rbp
            mov rbp, rsp

            xor rax, rax
            dec rax

            mov r12,rdx
            mov r10, rdi
            cmp r10, 1      
            je .label3

            mov rbx, rsi
            mov rdi, QWORD[rbx + 8]
            call getenv
            test rax, rax
            jz .label1

            mov rsi, rax
            mov rdi, out
            call printf
            jmp .label2

            .label3:
                cmp qword[r12], 0
                je .label2
                mov rsi, qword[r12]     
                mov rdi, out  
                call printf
                add r12, 8
                jmp .label3
            .label1:
                mov rdi, var1            
                call printf
                jmp .label2

            .label2:
                xor rax, rax
                leave
                ret