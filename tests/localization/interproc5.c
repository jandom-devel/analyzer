
int f (int x)
{
	return x;
}


int 
main(void)
{
	int z=0;
	for (int x =0 ; ; x++) z += f(x);
	return 0;
}

