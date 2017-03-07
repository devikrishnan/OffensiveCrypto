BITS 64

%define STDOUT 1
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
    nextline : db 0xa
    nextline_len : equ 1


section .text
    global _start

    _start:

       
        mov r9 , rsp
        add r9, 24

        label1:

        mov rdi, QWORD[r9]
        call strlen                    
        mov rdi, rax
        mov r12, rdi             
        
        mov rax, SYS_WRITE
            mov rdi, STDOUT
            mov rsi, QWORD[r9]
            mov rdx,r12 
            syscall
        
        mov rax, SYS_WRITE
            mov rdi, STDOUT
            mov rsi, nextline
            mov rdx, nextline_len
            syscall
         

        add r9, 8 

        cmp QWORD[r9], 0
        je .exit 
     
        jmp label1


        .exit:                        
            xor rdi, rdi
            mov rax, SYS_EXIT
            syscall

        strlen:
             push rbp
             mov rbp, rsp

             xor rax, rax                    
             xor rcx, rcx                    
             dec rcx                         
             cld                             
            repne scasb                     
                                       
            mov rax, rcx                    
            not rax
            dec rax

            leave
            ret

  
            

            