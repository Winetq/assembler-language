.686
.model flat

public _nowy_strcat

.code
	_nowy_strcat PROC
	push ebp
	mov ebp,esp

	push esi
	push edi
	push ebx
	
	; stos:
	; ebx
	; esi
	; edi
	; ebp [ebp+0]
	; adres powrotu [ebp+4]
	; adres pierwszego elementu tablicy wynik [ebp+8]
	; adres pierwszego elementu tablicy zrodlo [ebp+12]

	mov esi, [ebp+8] ; adres tablicy wynik
	mov edi, [ebp+12] ; adres tablicy zrodlo

	mov eax, 0
	ptl:
	cmp byte ptr [esi+eax], 0 ; sprawdzenie kolejnych znakow
	je koniec_ptl

	inc eax
	jmp ptl

	koniec_ptl: ; w eax indeks znaku 0 w tablicy wynik

	mov ebx, 0
	kopiowanie:
	mov cl, [edi+ebx] ; zapisanie kolejnych znakow tablicy zrodlo do cl na jednym bajcie
	mov [esi+eax], cl ; przekopiowanie pobranego znaku do tablicy wynik

	cmp cl, 0
	je gotowe

	inc eax
	inc ebx
	jmp kopiowanie

	gotowe:
	pop ebx
	pop edi
	pop esi

	pop ebp
	ret
	_nowy_strcat ENDP
 END
