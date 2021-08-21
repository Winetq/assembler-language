#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

extern __int64 sum_of_squares(__int64* tab1[], int n);

int main()
{
	__int64 arr[3] = { 1000000, 2, -3 };
	__int64 wynik = sum_of_squares(arr, 3);

	printf("\nWynik to: %I64d\n", wynik);

	return 0;
}
