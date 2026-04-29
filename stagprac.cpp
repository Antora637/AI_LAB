#include<iostream>
#include<cstdlib>
#include<ctime>
using namespace std;

int main()
{
  srand(time(0));

  int rounds=10,sims=100;
  int risklevel[]={10,25,40,55,70,85};
  cout<<"Risk\tStag%\tHare%\tAvg Payoff%\n";
  cout<<"---------------------------------------\n";

  for(int k=0;k<6;k++)
  {
    int risk=risklevel[k];
    int Stag=0,Hare=0;
    double Payoff=0;

    for(int i=0;i<sims;i++)
    {
        for(int j=0;j<rounds;j++)
        {
           double a=(double)rand()/RAND_MAX;
           double b=(double)rand()/RAND_MAX;

           string A=(a<(100-risk)/100.0)?"S":"H";
            string B=(b<(100-risk)/100.0)?"S":"H";

           if(A=="S" && B=="S")
           Payoff +=10;
           else if(A=="H" && B=="H")
           Payoff +=7;
           else if (A=="S" && B=="H")
           Payoff +=0;
           else
           Payoff +=7;
           
           if(A=="S")
           Stag++;
           else
           Hare++;


        }
     
    }


   int total=sims*rounds;
        double StagPercent= (Stag*100)/total;
        double HarePercent= (Hare*100)/total;
        double avg_Payoff= Payoff/total;

     cout<<risk<<" %\t"<<StagPercent<<" %\t"<<HarePercent<<" %\t"<<avg_Payoff<<" %\n";


  }

return 0;


}