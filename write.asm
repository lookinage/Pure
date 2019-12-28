use32

videoMemory equ 0xB8000
whiteOnBlack equ 0x0F

Write:

        pusha

        mov edx, videoMemory
        mov ah, whiteOnBlack

        WriteLoop:

                mov al, [ebx]

                cmp al, 0
                je WriteFinish

                mov [edx], ax

                inc ebx
                add edx, 0x2

        jmp WriteLoop

WriteFinish:

popa

ret
