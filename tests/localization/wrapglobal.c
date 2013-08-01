int next = 1;

void rand(void)
{
	next = next * 10 + 1;
	return ;
}


int 
main()
{
	int nondet;

	rand();
	while (nondet) {
		rand();
	}

	return 0;

}

