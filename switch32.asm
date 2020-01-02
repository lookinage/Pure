GlobalDescriptorTableStart:
NullSegmentDescriptor:

dq 0x0

GlobalDescriptorTableCode:

dw 0xffff; Limit ( bits 0 -15)
dw 0x0; Base ( bits 0 -15)
db 0x0; Base ( bits 16 -23)
db 10011010b; 1st flags , type flags
db 11001111b; 2nd flags , Limit ( bits 16 -19)
db 0x0; Base ( bits 24 -31)

GlobalDescriptorTableData:

dw 0xffff; Limit ( bits 0 -15)
dw 0x0; Base ( bits 0 -15)
db 0x0; Base ( bits 16 -23)
db 10010010b; 1st flags , type flags
db 11001111b; 2nd flags , Limit ( bits 16 -19)
db 0x0; Base ( bits 24 -31)

GlobalDescriptorTableEnd:
GlobalDescriptorTableDescriptor:

dw GlobalDescriptorTableEnd - GlobalDescriptorTableStart - 1
dd GlobalDescriptorTableStart

CodeSegment equ GlobalDescriptorTableCode - GlobalDescriptorTableStart
DataSegment equ GlobalDescriptorTableData - GlobalDescriptorTableStart

use16

Switch32:

cli

lgdt [GlobalDescriptorTableDescriptor]

mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CodeSegment:ResetPipeline


ResetPipeline:

use32


mov ax, DataSegment
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ss, ax

mov ebp, 0x90000
mov esp, ebp

call Start