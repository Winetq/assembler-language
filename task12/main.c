#include <stdio.h>

void nowy_strcat(char* wynik, char* zrodlo);

int main()
{
	char w[100] = "ala ma kota";
	char z[100] = " i psa";

	nowy_strcat(w, z);

	printf("%s", w);

	return 0;
}
