.686
.XMM 
.model flat

public _szybki_max

.code
	_szybki_max PROC
	 push ebp
	 mov ebp, esp

	 ; ebp											[ebp+0]
	 ; adres powrotu								[ebp+4]
	 ; adres pierwszego elementu tablicy t1			[ebp+8]
	 ; adres pierwszego elementu tablicy t2			[ebp+12]

	 mov eax, [ebp+8]
	 movups xmm0, [eax]
	 mov eax, [ebp+12]
	 movups xmm1, [eax]

	 pmaxsw xmm0, xmm1

	 pop ebp
	 ret
	_szybki_max ENDP
END