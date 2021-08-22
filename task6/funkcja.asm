.686
.model flat
public _replace_below_zero

.code
	_replace_below_zero PROC
	push ebp 
	push ebx
	push esi
	mov ebp, esp 

	; stos:
	; esi [ebp+0]
	; ebx [ebp+4]
	; ebp [ebp+8]
	; slad [ebp+12]
	; adres pierwszego elementu tablicy [ebp+16]
	; n [ebp+20]
	; value [ebp+24]

	mov ecx, [ebp+20] ; ecx = n
	mov ebx, [ebp+16] ; adres pierwszego elementu tablicy
	mov eax, [ebp+24] ; value
	mov esi, 0 ; indeks
	ptl: 
	mov edx, [ebx + esi]
	cmp edx, 0
	jge gotowe
	mov [ebx + esi], eax

	gotowe:
	add esi, 4
	dec ecx
	jnz ptl

	mov eax, [ebp+16]

	pop esi
	pop ebx
	pop ebp
	ret
	_replace_below_zero ENDP
END