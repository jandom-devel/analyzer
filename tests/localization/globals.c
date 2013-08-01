int c = 0;

void f(int x) 
{
   while (x != 1) c=x;
}

int main() 
{
   for (int y = 1; y < 10; y++) f(y);
   return 0;
}

