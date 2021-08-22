.686
.model flat

public _entropy

.data
	Wynik dd +0.0
	Minus_jeden dd -1.0

.code
_entropy PROC
	Push ebp ; standardowy prolog
	Mov ebp, esp
	Push esi
	Push ebx
	
	Mov esi, [ebp+8] ; adres pierwszego elementu tablicy probabilities
	Mov ecx, [ebp+12] ; parametr n
	Mov ebx, 0 ; iterator po tablicy esi

	finit ; przywrocenie domyslnych ustawien koprocesora
	Ptl:
	Mov eax, dword ptr [esi+ebx] ; w eax sprawdzimy czy to nie jest przypadkiem 0
	Cmp eax, dword ptr 0
	Je gotowe ; jesli jest to zero to pomijamy
	; czyli to nie jest zero wiec mozna dzialac
	Fld dword ptr [esi+ebx] ; pobranie kolejnego elementu na wierzcho³ek stosu koprocesora
	Fld dword ptr [esi+ebx] ; kopia tego elementu
	Fyl2x ; st(1) = st(1) * log_2(st(0)) i pop st(0), czyli w st(0) mamy prawdi³owy wynik
	Fld dword ptr wynik ; nie trzeba konwertowac bo jest to float (zmienna zadeklarowana w .data ponizej)
	Fadd ; st(1) = st(0) + st(1) i pop st(0)
	Fst dword ptr wynik ; odsylamy wynik
	Fstp st(0) ; i jeszcze zdjecie liczby z wierzcholka koprocesora

	gotowe:
	Add ebx, 4 ; przeskoczenie na nastepny element
	
	Dec ecx
	Jnz Ptl
	
	; i jeszcze trzeba dodac minusa
	Fld dword ptr wynik
 	Fld dword ptr minus_jeden ; zmienna zadeklaorwana ponizej w .data
	Fmul ; st(1) = st(0) * st(1) i pop st(0) i tym samym w st(0) mamy policzona entropie
	
	Pop ebx
	Pop esi
	Pop ebp ; standardowy epilog
	ret
_entropy ENDP
 END
