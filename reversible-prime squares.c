/* Author: 202000715- MAPESHOANE.M
   This program determines and prints the first 10 reversible prime squares
   A number is a reversible prime square if
     1. It is not a palindrome
     2. It is the square of a prime, and its reverse is also the square of a prime
*/

#include <stdio.h>

//defining a function that checks if an integer is a prime number
int checkPrime(int num)
{
	int i;
	
	//condition that checks if the given number is prime or not
	for(i=2; i <= num/2; i++)
	{
		if(num % i == 0)
		{
			return 0;
		}
	}
	return 1;
}

//defining a function that gives the reverse of any number
int reverse(int num)
{
	int  rev = 0, rem;   //declare remainder variable(rem) of type int and reverse variable(rev) of type int initialised at 0
	
	//the while loop will iterate as long as the condition is true, once false it terminates and gives the reverse of any number
	while(num != 0)
	{
		rem= num % 10;
		rev = rev * 10 + rem;
		num = num / 10;
	}
 	return rev;
}


//defining a function that will square a number if it is prime and reverse it and also determine if it is a palindrome or not 
void rev_prime_sqrs()     //reversible prime squares
{
	int number,count,i;    //declare varibles
	
	for(number = 1, count = 0; count < 10; number++)     //required to give 10 numbers
	{

		if(checkPrime(number) == 1)
		{
			int square = number*number;      //square number
			int rev_num = reverse(square);    //declare reversed number variable(rev_num) and calling the reverse() function to reverse the square
			
			//condition to check whether a number is a palindrome or not
			if(square != rev_num)
			{
				for(i = 0; i < rev_num/2; i++)
				{
					if(i*i == rev_num)
					{
						if(checkPrime(i) == 1)
						{
							printf("\n%d",square);     //output 10 reversible prime squares 
							count ++;
						}
					}
				}
			}
			//condition to check palindrome ends
		}
	}
}

int main()
{

    rev_prime_sqrs();   //call the rev_prime_sqrs() function in order to output result of program
    return 1;
}
