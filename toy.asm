;Rogelio Martinez
;toy.asm
;Turned in on 5/08/18

	.MODEL small

	.STACK 100h

	.DATA
msg1 DB 10, 13, 'Welcome to the toy press A, B, or C'
msg2 DB 10, 13, '         To quit press Q           '
desc DB 10, 13, '     A           B            C    '
line DB 10, 13, '___________________________________'
top  DB 10, 13, '     0           0            0    ' ;+7 +19 +32
mid  DB 10, 13, '           0            0          ' ;+13 +26
bot  DB 10, 13, '     0           0            0    ' ;+7 +19 +32
line2 DB 10, 13, '___________________________________', 10, 13, '$'


;format if you want a space below
;msg1 DB 10, 13, 'string', 10, 13, ' $'

	.CODE
main	PROC

	;startup for any asm program
	mov ax, @data
	mov ds, ax
	
BEGIN:
	mov ah, 0fh
	int 10h
	mov ah, 00h
	int 10h
	
	;Display the title
	mov ah, 09h
	mov dx, OFFSET msg1
	int 21h

	mov ah, 01h
	int 21h
	
	cmp al, 41h ;A
	JE pressa
	
	cmp al, 61h ;a
	JE pressa
	
	cmp al, 42h ;B
	JE pressb
	
	cmp al, 62h ;b
	JE pressb

	cmp al, 43h ;C
	JE pressc

	cmp al, 63h ;c
	JE pressc
	
	cmp al, 51h ;Q
	JE fin
	
	cmp al, 71h ;q
	JE fin

	JMP BEGIN
	
pressa:
	call holeA
	jmp begin

pressb:
	call holeB
	jmp begin

pressc:
	call holeC
	jmp begin	
	
FIN:
	;exit ot dos
	mov al, 0
	mov ah, 4ch
	int 21h
		
main	ENDP

holeA PROC
	
	;cmp al, 30h
	cmp top+7, '0'
	JE zeroA
	
	cmp top+7, '1'
	JE oneA
	
zeroA:
	mov top+7, '1'
	call holeF
	jmp finA
oneA:
	mov top+7, '0'
	call holeD

finA:
	ret
holeA ENDP

holeB PROC
	
	cmp top+19,'0'
	je zeroB
	
	cmp top+19, '1'
	je oneB
	
zeroB:
	mov top+19, '1'
	call holeE
	jmp finB

oneB:
	mov top+19, '0'
	call holeD

finB:
	ret
holeB ENDP

holeC PROC
	
	cmp top+32, '0'
	je zeroC
	
	cmp top+32, '1'
	je oneC
	
zeroC:
	mov top+32, '1'
	call holeE
	jmp finC

oneC:
	mov top+32, '0'
	call holeH
finC:	
	ret
holeC ENDP

holeD PROC
	
	cmp mid+13, '0'
	je zeroD
	
	cmp mid+13, '1'
	je oneD

zeroD:
	mov mid+13, '1'
	call holeG
	jmp finD
	
oneD:
	mov mid+13, '0'
	call holeF

finD:	
	ret
holeD ENDP

holeE PROC
	
	cmp mid+26, '0'
	je zeroE
	
	cmp mid+26, '1'
	je oneE

zeroE:
	mov mid+26, '1'
	call holeH
	jmp finE

oneE:
	mov mid+26, '0'
	call holeG

finE:	
	ret
holeE ENDP

holeF PROC
		
	cmp bot+7, '0'
	JE zeroF

	cmp bot+7, '1'
	JE oneF

zeroF:
	mov bot+7, '1'
	jmp finF

oneF:
	mov bot+7, '0'
	jmp finF
	
finF:
	ret
holeF ENDP

holeG PROC
		
	cmp bot+19, '0'
	JE zeroG
	
	cmp bot+19, '1'
	JE oneG
	
zeroG:
	mov bot+19, '1'
	jmp finG
	
oneG:
	mov bot+19, '0'
	
finG:	
	ret
holeG ENDP

holeH PROC
	
	cmp bot+32,'0'
	je zeroH
	
	cmp bot+32, '1'
	je oneH

zeroH:
	mov bot+32, '1'
	jmp finH
oneH:
	mov bot+32, '0'

finH:
	ret
holeH ENDP

	END main