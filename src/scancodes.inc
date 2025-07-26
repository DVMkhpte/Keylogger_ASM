section .rodata

scancode_table:
    db 0    ; 0x00
    db 0    ; 0x01 ESC
    db '1'  ; 0x02
    db '2'  ; 0x03
    db '3'  ; 0x04
    db '4'  ; 0x05
    db '5'  ; 0x06
    db '6'  ; 0x07
    db '7'  ; 0x08
    db '8'  ; 0x09
    db '9'  ; 0x0A
    db '0'  ; 0x0B
    db 0    ; 0x0C
    db 0    ; 0x0D
    db 0    ; 0x0E BACKSPACE
    db 9    ; 0x0F TAB
    db 'a'  ; 0x10
    db 'z'  ; 0x11
    db 'e'  ; 0x12
    db 'r'  ; 0x13
    db 't'  ; 0x14
    db 'y'  ; 0x15
    db 'u'  ; 0x16
    db 'i'  ; 0x17
    db 'o'  ; 0x18
    db 'p'  ; 0x19
    db '^'  ; 0x1A
    db '$'  ; 0x1B
    db 10   ; 0x1C ENTER  <--- ici !
    db 0    ; 0x1D
    db 'q'  ; 0x1E
    db 's'  ; 0x1F
    db 'd'  ; 0x20
    db 'f'  ; 0x21
    db 'g'  ; 0x22
    db 'h'  ; 0x23
    db 'j'  ; 0x24
    db 'k'  ; 0x25 
    db 'l'  ; 0x26 
    db 'm'  ; 0x27
    db 0    ; 0x28
    db 0    ; 0x29
    db 0    ; 0x2A
    db '*'  ; 0x2B *
    db 'w'  ; 0x2C
    db 'x'  ; 0x2D
    db 'c'  ; 0x2E
    db 'v'  ; 0x2F
    db 'b'  ; 0x30
    db 'n'  ; 0x31
    db ','  ; 0x32
    db ';'  ; 0x33
    db ':'  ; 0x34
    db '!'  ; 0x35
    db 0    ; 0x36
    db 0    ; 0x37
    db 0    ; 0x38
    db ' '  ; 0x39 SPACE  <--- ici !
