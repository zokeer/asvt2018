    .model  tiny
    .code
    org 100h
start:
	jmp work
	buffer db 6, 0,0,0,0,0,0, 0, 24h
	InputRequest db "Input up to 5 characters: ", 24h
	OutputReadyString db "You've gave me: ", 24h
work:
	mov ah, 09h
	lea dx, InputRequest
	int 21h

	mov ah, 0Ah
	lea dx, buffer
	int 21h

	mov ah, 02h
	mov dl, 10
	int 21h

	mov ah, 09h
	lea dx, OutputReadyString
	int 21h

	mov ah, 09h
	lea dx, buffer + 2
	int 21h
fin:
	ret
	end start
