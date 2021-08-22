#include <stdio.h>

float entropy(float probabilities[], unsigned int n);

int main()
{
	float q[3] = { 0.5, 0.0, 0.5 };
	float wynik = entropy(q, 3);
	printf("%f", wynik); // 1.0 (DZIA£A)

	return 0;
}
