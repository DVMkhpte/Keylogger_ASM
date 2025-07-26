section .text

; write_string(rsi=adresse, rdx=taille)
write:
        mov     rax, 1        ; syscall write
        mov     rdi, 1        ; stdout
        syscall
        ret

; read_input(rsi=buffer, rdx=max_len)
read:
        mov     rax, 0        ; syscall read
        mov     rdi, 0        ; stdin
        syscall
        ret
