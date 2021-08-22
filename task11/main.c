#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

int* kopia_tablicy(int tab[], unsigned int n);

int main()
{
	int n = 7;
	int* arr1 = malloc(sizeof(int) * n);
	int* arr2;

	printf("\nPodaj siedem liczb calkowitych: ");
	for (int i = 0; i < n; i++)
		scanf("%d", &arr1[i]);

	arr2 = kopia_tablicy(arr1, n);

	for (int i = 0; i < n; i++)
		printf("%d ", arr2[i]);

	free(arr1);
	free(arr2);

	return 0;
}
