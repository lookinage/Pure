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