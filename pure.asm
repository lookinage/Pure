org 0x7c00
use16

mov bp, 0x9000
mov sp, bp

call Switch32

jmp $

use32

Start:

L:

in al, 0x60

mov [SuccessMessage + 0xF], al
mov ebx, SuccessMessage
call Write

jmp L

;mov ecx, 0x20000
;Fill:

;mov [0x9FFFF+ecx], byte 0x41

;loop Fill


jmp $

include "switch32.asm"
include "write.asm"

SuccessMessage db "Pure was loaded! ", 0x0

times 510-($-$$) db 0
dw 0xAA55