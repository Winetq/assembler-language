#include <stdio.h>

float objetosc_stozka(float big_r, unsigned int small_r, float h);

int main()
{
	float wynik;
	wynik = objetosc_stozka(8.0, 4, 6.1);
	printf("\nWynik = %f\n", wynik);

	return 0;
}
