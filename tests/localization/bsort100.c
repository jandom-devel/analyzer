#define NUMELEMS 100

int 
main(void)
{

	int             Sorted = 0;
	int             Temp, Index, i;

	for (i = 1;
	     i <= NUMELEMS - 1;	
	     i++) {
		Sorted = 1;
		for (Index = 1;
		     Index <= NUMELEMS - 1;
		     Index++) {
			if (Index > NUMELEMS - i) break;
			if (Temp) Sorted = 0;
		}

		if (Sorted)
			break;
	}
	
	return 0;
}

