.686
.model flat
public _szukaj_elem_max

.data
	max dd 0

.code
	_szukaj_elem_max PROC
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

	mov ecx, [ebp+20] ; ecx = n
	mov ebx, [ebp+16] ; adres pierwszego elementu tablicy

	mov eax, [ebx]
	mov max, eax ; zakladamy ze pierwszy element to max
	
	mov esi, 0 ; indeks
	ptl: 
	mov edx, [ebx + esi]
	cmp edx, max
	jle gotowe
	mov max, edx

	gotowe:
	add esi, 4
	dec ecx
	jnz ptl

	lea eax, max

	pop esi
	pop ebx
	pop ebp
	ret
	_szukaj_elem_max ENDP
END