.686
.model flat
public _reduction

.code
	_reduction PROC
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
	; reductionType [ebp+24]

	mov ebx, [ebp+24]
	cmp ebx, 0
	je suma
	cmp ebx, 1
	je max

	min:
	mov ecx, [ebp+20] ; ecx = n
	mov ebx, [ebp+16] ; adres pierwszego elementu tablicy
	mov eax, [ebx] ; zakladamy ze pierwszy element to min
	mov esi, 0 ; indeks
	ptl1: 
	mov edx, [ebx + esi]
	cmp edx, eax
	jge gotowe1
	mov eax, edx

	gotowe1:
	add esi, 4
	dec ecx
	jnz ptl1

	jmp zakoncz

	max:
	mov ecx, [ebp+20] ; ecx = n
	mov ebx, [ebp+16] ; adres pierwszego elementu tablicy
	mov eax, [ebx] ; zakladamy ze pierwszy element to max
	mov esi, 0 ; indeks
	ptl2: 
	mov edx, [ebx + esi]
	cmp edx, eax
	jle gotowe2
	mov eax, edx

	gotowe2:
	add esi, 4
	dec ecx
	jnz ptl2

	jmp zakoncz

	suma:
	mov eax, 0 ; wynik
	mov ecx, [ebp+20] ; ecx = n
	mov ebx, [ebp+16] ; adres pierwszego elementu tablicy
	mov esi, 0 ; indeks
	ptl3: 
	add eax, [ebx + esi] ; dodanie kolejnego elementu tablicy do eax
	add esi, 4
	dec ecx
	jnz ptl3

	zakoncz:
	pop esi
	pop ebx
	pop ebp
	ret
	_reduction ENDP
END