int f() {
   int i = 0;
   for (; i<10 ; i++) 
	for (int j = 0; j < 10 ; j++) ;
   return i;
}

int main()  {
   int a = f();
   return a;
}

