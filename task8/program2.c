#include <stdio.h>
#include <xmmintrin.h>

void szybki_max(short t_1[], short t_2[], short t_wynik[], int n);

void main()
{
	short val1[16] = { 1, -1, 2, -2, 3, -3, 4, -4, 1, -1, 2, -2, 3, -3, 4, -4 };

	short val2[16] = { -4, -3, -2, -1, 0, 1, 2, 3, -4, -3, -2, -1, 0, 1, 2, 3 };

	short t_wynik[16];

	szybki_max(val1, val2, t_wynik, 16);

	for (int i = 0; i < 16; i++) printf("%hi\n", t_wynik[i]);

	return 0;
}
