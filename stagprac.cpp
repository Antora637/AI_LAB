#include<iostream>
#include<cstdlib>
#include<ctime>
using namespace std;

int main()
{
 srand(time(0));
 int sims=100,rounds=10;
 int risklevel[]={10,25,40,55,70,85};

 cout<<"Risk\tStag%\tHare%\tAvg_payoff%\n";
 cout<<"------------------------------------\n";

 for(int k=0;k<6;k++)
 {
   int risk=risklevel[k];
   int stag=0,hare=0;
   double avg_payoff=0;

   for(int i=0;i<sims;i++)
   {
      for(int j=0;j<rounds;j++)
      {
         double a=(double)rand()/RAND_MAX;
         double b=(double)rand()/RAND_MAX;

         string A=(a<(100-risk)/100.0)?"S":"H";
         
         string B=(b<(100-risk)/100.0)?"S":"H";

         if(A=="S" && B=="S")
         avg_payoff+=10;
         else if(A=="H" && B=="H")
         avg_payoff+=7;
         else if(A=="S"&& B=="H")
         avg_payoff+=0;
         else
         avg_payoff+=7;

         if(A=="S")
         stag++;
         else
         hare++;
      }
   }
 int total=sims*rounds;
 int stagper=(stag*100)/total;
 int hareper=(hare*100)/total;
 double avg_payoffper=avg_payoff/total;

 cout<<risk<<"%\t"<<stagper<<"%\t"<<hareper<<"%\t"<<avg_payoffper<<"%\n"<<endl;

 }

return 0;

}