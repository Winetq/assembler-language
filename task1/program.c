#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

int reduction(int tab[], int n, short reductionType);

int main()
{
	int n = 5;
	int wynik;
	int* arr = malloc(sizeof(int) * n);

	printf("\nPodaj %d liczb calkowitych: ", n);
	for (int i = 0; i < n; i++) scanf("%d", &arr[i]);

	wynik = reduction(arr, n, 1);

	printf("Wynik to: %d", wynik);

	free(arr);

	return 0;
}
