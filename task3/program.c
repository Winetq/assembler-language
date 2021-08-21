#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

int* szukaj_elem_max(int tab[], int n);

int main()
{
	int n = 5;
	int* arr = malloc(sizeof(int) * n);
	int* wsk;

	printf("\nPodaj %d liczb calkowitych: ", n);
	for (int i = 0; i < n; i++) scanf("%d", &arr[i]);

	wsk = szukaj_elem_max(arr, n);
	
	printf("Max element to: %d", *wsk);

	free(arr);

	return 0;
}
