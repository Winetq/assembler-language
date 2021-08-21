public sum_of_squares

.code
	sum_of_squares PROC
	push rbx
	push rdx
	push rsi
	push rdi

	mov rbx, rcx ; adres pierwszego elementu w tablicy
	mov rcx, rdx ; liczba elementow
	mov rsi, 0 ; indeks
	mov rdi, 0 ; wynik

	ptl: mov rax, [rbx+rsi]
	imul rax
	add rdi, rax
	add rsi, 8
	dec rcx
	jnz ptl

	mov rax, rdi

	pop rdi
	pop rsi
	pop rdx
	pop rbx
	ret
	sum_of_squares ENDP
END