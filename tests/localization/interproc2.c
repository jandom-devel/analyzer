char  		*OutBuff;
char            comp_text_buffer[1];

void output()
{
	int cond;

	do {				
 	    *OutBuff++ = 0;
	} while (cond);	
}

int main(void)
{
	OutBuff = comp_text_buffer;

	int cond;

	do {				
 	    *OutBuff++ = 0;
	} while (cond);	

	output();
	return 0;
}


