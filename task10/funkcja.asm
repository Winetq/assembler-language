.686
.XMM
.model flat

public _mul_at_once

.code
	_mul_at_once PROC
	
	pmulld xmm0, xmm1

	ret
	_mul_at_once ENDP
END
