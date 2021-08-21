#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>

float* get_actual_distribution(wchar_t* data, unsigned int len);

int main()
{
	wchar_t data[] = L"31924271"; // 1...9
	float* benford = get_actual_distribution(data, 8);

	for (int i = 0; i < 9; i++)
		printf("%.2f\n", benford[i]);

	return 0;
}
