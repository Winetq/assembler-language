.686
.model flat
public _odejmowanie

.code
	_odejmowanie PROC
	push ebp
	mov ebp,esp

	push ebx

	; stos:
	; ebx
	; ebp [ebp+0]
	; adres powrotu [ebp+4]
	; wsk [ebp+8]
	; b [ebp+12]

	mov ebx, [ebp+8]

	mov eax, [ebx]
	mov ecx, [eax] ; odjemna
	
	mov ebx, [ebp+12]
	mov eax, [ebx] ; odjemnik

	sub ecx, eax ; odjemna - odjemnik

	xchg ecx, eax

	pop ebx

	pop ebp
	ret
	_odejmowanie ENDP
 END