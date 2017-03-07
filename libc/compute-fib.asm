BITS 64    

extern printf
extern atoi

section .rodata
    out :    db "%lld", 10, 0

section .bss 
	var1 : resq 1

section .text
    global main

    main:
        push rbp
        mov rbp, rsp

        mov QWORD[var1], rdi
        mov rbx,rsi

        loop:

        	dec QWORD[var1]
        	mov rdi,QWORD[rbx + 8]
        	call atoi
        	mov r12, rax
        	add rbx,8
        	cmp r12, 0
        	jle error

			cmp	r12, 1			
			je	fibo_one

			cmp	r12, 2			
			je	fibo_two

			sub r12,2
			mov r10, 0
			mov r11, 1

			fib:
				mov	rax, r10	
				mov	r10, r11	
				add	r11, rax

        		dec r12
        		cmp r12, 0
        		jne fib
        
        	mov rsi, r11
			mov rdi, out
			call printf
			cmp QWORD[var1],1

			jne loop
			je end
        	
        	
		fibo_one:
			mov	rax, 0
			mov rsi,rax
			mov rdi,out
			call printf
			cmp QWORD[var1],1
			je end
			jmp	loop

		fibo_two:
			mov	rax, 1
			mov rsi,rax
			mov rdi,out
			call printf
			cmp QWORD[var1],1
			je end
			jmp	loop

		error:
			mov rsi,-1
			mov rdi,out
			call printf
			cmp QWORD[var1],1
			je end
			jmp	loop

		end:
        	xor rax, rax
        	leave
        	ret