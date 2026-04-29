#include<iostream>
using namespace std;
int ary[10][10],visited[10],n,cost=0;

void takeinput()
{
    cout<<"Enter vertex number: ";
    cin>>n;

    cout<<"Enter cost matrix:\n";
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            cin>>ary[i][j];
        }
        visited[i]=0;
    }
}

int least(int c)
{
    int min=9999,nc=-1;

    for(int i=0;i<n;i++)
    {
        if(ary[c][i]!=0 && visited[i]==0)
        {
            if(ary[c][i]<min)
            {
                min=ary[c][i];
                nc=i;
            }
        }
        
    }
    if(nc!=-1)
        
            cost+=min;
            return nc;
        
}


void mincost(int city)
{
    visited[city]=1;
    cout<<city+1<<" -> ";
    int ncity=least(city);

    if(ncity==-1)
    {
        cout<<1;
        cost+=ary[city][0];
        return;
    }
    mincost(ncity);
}
int main()
{
    takeinput();
    cout<<"Path is: "<<" -> ";
    mincost(0);
    cout<<"\n Minimum cost : "<<cost<<endl;
    return 0;
}