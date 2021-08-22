.686
.model flat
public _dot_product

.data
	wynik dd 0

.code
	_dot_product PROC
	push ebp 
	push edi
	push ebx
	push esi
	mov ebp, esp 

	; stos:
	; esi [ebp+0]
	; ebx [ebp+4]
	; edi [ebp+8]
	; ebp [ebp+12]
	; slad [ebp+16]
	; adres pierwszego elementu tablicy tab1 [ebp+20]
	; adres pierwszego elementu tablicy tab2 [ebp+24]
	; n [ebp+28]

	mov eax, 0
	mov edx, 0

	mov ecx, [ebp+28] ; ecx = n
	mov ebx, [ebp+20] ; adres pierwszego elementu tablicy tab1
	mov edi, [ebp+24] ; adres pierwszego elementu tablicy tab2
	mov esi, 0 ; indeks
	ptl: mov eax, [ebx + esi]
	imul dword ptr[edi+esi]
	add [wynik], eax
	add esi, 4
	dec ecx
	jnz ptl

	mov eax, [wynik]

	pop esi
	pop ebx
	pop edi
	pop ebp
	ret
	_dot_product ENDP
END