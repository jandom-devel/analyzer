int main() 
{
   int i = 0;
   while (i<4) {
      int j=0;
      while (j<4) { 
         i=i+1;
         j=j+1;     
      }
      i = i-j+1;
   }
   return 0;
}

