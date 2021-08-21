#include <stdio.h>
#include <xmmintrin.h>

__m128 mul_at_once(__m128 one, __m128 two);

int main()
{
	__m128 one, two;
	one.m128_i32[0] = 1;
	one.m128_i32[1] = 2;
	one.m128_i32[2] = 3;
	one.m128_i32[3] = 4;
	two.m128_i32[0] = 2;
	two.m128_i32[1] = 2;
	two.m128_i32[2] = 2;
	two.m128_i32[3] = 2;

	__m128 three = mul_at_once(one, two);

	for (int i = 0; i < 4; i++) printf("%i\n", three.m128_i32[i]);

	return 0;
}