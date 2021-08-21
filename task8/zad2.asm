.686
.XMM 
.model flat

public _szybki_max

.code
	_szybki_max PROC
	 push ebp
	 mov ebp, esp

	 push ebx

	 mov ecx, [ebp+20] ; n
	 
	 mov ebx, 0

	 ptl:
	 mov eax, [ebp+8] ; adres pierwszej tablicy
	 movups xmm1, [eax + ebx] ; odczytanie osmiu liczb z pierwszej tablicy
	 mov eax, [ebp+12] ; adres drugiej tablicy
	 movups xmm2, [eax + ebx] ; odczytanie osmku liczb z drugiej tablicy

	 pmaxsw xmm1, xmm2 ; obliczenie maximum dla tych osmiu liczb

	 mov eax, [ebp+16] ; adres tablicy wynikowej
	 movups [eax + ebx], xmm1 ; wczytanie tych maksymalnych 8 cyfr

	 add ebx, 16
	 sub ecx, 8
	 cmp ecx, 0
	 jnz ptl

	 pop ebx
	 pop ebp
	 ret
	_szybki_max ENDP
END
