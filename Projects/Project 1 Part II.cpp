#include <iostream>
using namespace std;

bool test_prime(int n);

const unsigned MAX_PRIMES = 100;

void main()
{
	//loop to keep advancing the numbers to be tested
	//function to test a number for prime-ness?
	unsigned numPrimes = MAX_PRIMES;
	
	//2 is the only even prime number, so output that first
	//then you only have to check odd numbers.
	cout << "2\n";
	
	//start at 3
	unsigned potentialPrime = 1;
	while (numPrimes)
	{
		potentialPrime += 2;
		if (test_prime(potentialPrime))
		{
			cout << potentialPrime << "\n";
			--numPrimes;
		}
	}
}


bool test_prime(unsigned n)
{
	unsigned halfN = n / 2;
	
	//test odd divisors greater than or equal to 3
	for (unsigned i = 3; i <= halfN; i += 2)
		if (!(n % i))
			return false;
		
	return true;
}