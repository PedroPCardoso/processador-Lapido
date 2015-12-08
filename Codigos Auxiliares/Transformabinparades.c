#	include <stdio.h>

int bin_to_dec(int bin)
{
 int total = 0;
 int potenc = 1;
 while(bin > 0) {
 total += bin % 10 * potenc;
 bin = bin / 10;
 potenc = potenc * 2;
}
 return total;
}
 int main(void)
{
 int dec = 0;
 int bin = 0;
 printf("Digite um numero binario: ");
 
 scanf("%d", &bin);
 dec = bin_to_dec(bin);
 printf("Binario = %d - Decimal = %d\n", bin, dec);
 return 0;
}
