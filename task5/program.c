#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

int dot_product(int tab1[], int tab2[], int n);

int main()
{
	int n = 3;
	int wynik;
	int* arr1 = malloc(sizeof(int) * n);
	int* arr2 = malloc(sizeof(int) * n);

	printf("\nPodaj trzy liczby calkowite dla pierwszego wektora: ");
	for (int i = 0; i < n; i++) scanf("%d", &arr1[i]);

	printf("\nPodaj trzy liczby calkowite dla drugiego wektora: ");
	for (int i = 0; i < n; i++) scanf("%d", &arr2[i]);

	wynik = dot_product(arr1, arr2, n);
	printf("\nWynik to: %d\n", wynik);

	free(arr2);
	free(arr1);

	return 0;
}
