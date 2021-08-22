.686
.model flat

public _kopia_tablicy

extern _malloc : PROC

.code
	_kopia_tablicy PROC
	push ebp
	mov ebp,esp

	push esi
	push edi
	push ebx
	
	; stos:
	; ebx
	; edi
	; esi
	; ebp [ebp+0]
	; adres powrotu [ebp+4]
	; adres pierwszego elementu tablicy tab [ebp+8]
	; n [ebp+12]

	mov eax, [ebp+12] ; eax = n
	mov ecx, 4 ; mul wymaga podania rejestru (nie mozna po prostu 4)
	mul ecx ; eax = 4*n (liczba bajtow) i edx = 0
	push eax ; parametr funkcji malloc (k - number of bytes)
	call _malloc ; adres zwroconego obszary o k bajtach w eax

	mov ecx, [ebp+12] ; ecx = n

	mov esi, [ebp+8] ; adres pierwszego elementu tablicy tab
	mov edi, eax ; edi = eax
	mov eax, 0 ; iterator po esi
	mov ebx, 0 ; iterator po edi
	ptl:
	mov edx, [esi + eax] ; pobranie kolejnej liczby
	bt edx, 0 ; sprawdzenie czy liczba parzysta
	jc gotowe
	; liczba parzysta
	mov [edi+ebx], edx ; przekopiowanie liczby parzystej
	add ebx, 4 ; kolejna element tablicy

	gotowe:
	add eax, 4 ; nastepna liczba

	dec ecx
	jnz ptl

	pop ecx
	sub ecx, ebx ; tyle zer trzeba dopisac
	cmp ecx, 0
	je koniec

	zera:
	mov [edi+ebx], dword ptr 0
	add ebx, 4

	sub ecx, 4
	jnz zera

	koniec:
	mov eax, edi ; zwracamy adres utworzonej tablicy

	pop ebx
	pop edi
	pop esi

	pop ebp
	ret
	_kopia_tablicy ENDP
 END
