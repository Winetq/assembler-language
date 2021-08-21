#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

int* replace_below_zero(int tab[], int n, int value);

int main()
{
	int n = 3;
	int value = 5;
	int* arr = malloc(sizeof(int) * n);

	printf("\nPodaj trzy liczby calkowite: ");
	
	for (int i = 0; i < n; i++) scanf("%d", &arr[i]);

	arr = replace_below_zero(arr, n, value);
	
	for (int i = 0; i < n; i++) printf("%d  ", arr[i]);

	free(arr);

	return 0;
}
