org 0x7c00
use16

mov bp, 0x9000
mov sp, bp

call Switch32

jmp $

use32

Start:

mov ebx, SuccessMessage
call Write

jmp $

SuccessMessage db "Pure is loaded.", 0x0

include "gdt32.asm"
include "switch32.asm"
include "write.asm"

times 510-($-$$) db 0
dw 0xAA55