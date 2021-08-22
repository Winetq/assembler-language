.686
.model flat
public _objetosc_stozka
.data
	trzy dd +3.0

.code
	_objetosc_stozka PROC
	push ebp
	mov ebp, esp

	; stos:
	; ebp [ebp+0]
	; adres powrotu [ebp+4]
	; big_r [ebp+8]
	; small_r [ebp+12]
	; h [ebp+16]

	finit

	fld dword ptr [ebp+8] ; big_r
	fild dword ptr [ebp+12] ; small_r
	fst st(2) ; st(2) = small_r

	fmul st(0), st(1) ; st(0) = R*r
	
	fld dword ptr [ebp+8] ; big_r
	fmul st(2), st(0) ; st(2) = R*R
	fstp st(0)

	fild dword ptr [ebp+12] ; small_r
	fmul st(3), st(0) ; st(3) = r*r
	fstp st(0)

	; st(0) = R*r
	; st(1) = R*R
	; st(2) = r*r

	fadd st(2), st(0)
	fstp st(0)

	fadd st(1), st(0)
	fstp st(0)

	; st(0) = (R*R + R*r + r*r)

	fld1
	fld trzy

	; st(0) = 3.0
	; st(1) = 1.0
	; st(2) = (R*R + R*r + r*r)

	fdivp st(1), st(0)
	
	; st(0) = 1/3
	; st(1) = (R*R + R*r + r*r)

	fmul ; fmulp; fmulp st(1), st(0)

	; st(0) = 1/3 * (R*R + R*r + r*r)

	fldpi
	fmul

	; st(0) = 1/3 * PI * (R*R + R*r + r*r)

	fld dword ptr [ebp+16] ; h
	fmul

	; st(0) = 1/3 * PI * h * (R*R + R*r + r*r)

	pop ebp
	ret
	_objetosc_stozka ENDP
END
