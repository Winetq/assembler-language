.686
.model flat

public _get_actual_distribution

extern _malloc : PROC

.code
	_get_actual_distribution PROC
	push ebp ; standardowy prolog
	mov ebp,esp 

	push ebx
	push esi
	push edi

	mov eax, 9
	shl eax, 2 ; 9 * 4 = 9 * 2^2
	push eax
	call _malloc ; _build_table ; w eax adres zwroconego obszaru
	pop ecx

	mov ecx, 49 ; biezaca cyfra (49 to 1 w kodzie ASCII)
	mov esi, [ebp+8] ; adres pierwszego elementu tablicy data
	mov edi, eax ; adres pierwszego elementu nowej tablicy
	mov eax, 0 ; iterator po esi
	mov ebx, 0 ; iterator po edi
	mov edx, 0 ; liczba wystapien danej cyfry

	finit ; przywrocenie domyslnych ustawien koprocesora

	ptl1:
		ptl2:
		cmp word ptr [esi+eax], 0
		je oblicz
		cmp word ptr [esi+eax], cx
		jne ustaw
		inc edx

		ustaw:
		add eax, 2 ; przeskoczenie do nastepnej cyfry
		jmp ptl2

		oblicz: ; edx / len
		cmp edx, 0
		je zero
		sub esp, 4
		mov [esp], edx
		fild dword ptr [esp]
		add esp, 4
		fild dword ptr [ebp+12] ; len
		fdiv ; st(0) = edx / len
		fst dword ptr [edi+ebx] ; odeslanie wyniku
		fstp st(0) ; !!!
		add ebx, 4 ; przeskoczenie na nastepnego floata
		jmp next

		zero:
		mov [edi+ebx], dword ptr 0 ; jak edx = 0 to rozklad po prostu zero
		add ebx, 4

	next:
	mov edx, 0 ; wyzerowanie liczby wystapien biezacej cyfry
	mov eax, 0 ; wyzerowanie iteratora po esi
	inc ecx
	cmp ecx, 58
	je koniec
	jmp ptl1

	koniec:

	mov eax, edi ; zwracamy adres tego rozkladu

	pop edi
	pop esi
	pop ebx
	
	pop ebp ; standardowy epilog
	ret 
	_get_actual_distribution ENDP
 END
