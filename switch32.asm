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