#include<iostream>
using namespace std;
int n,cost[20][20];
bool visited[20];
int mincost=999999;

int path[20];
int bestPath[1000][20];
int pathCount=0;

void tsp(int city,int count,int currentCost)
{
    if(count==n)
    {
        if(cost[city][0]!=0)
        {
            int totalCost=currentCost+cost[city][0];

            if(totalCost<mincost)
            {
                mincost=totalCost;
                pathCount=0;
            }

            if(totalCost==mincost)
            {
                for(int i=0;i<n;i++)
                bestPath[pathCount][i]=path[i];
                pathCount++;
            }
        }
        return;
    }

    for(int i=0;i<n;i++)
    {
        if(!visited[i] && cost[city][i]!=0)
        {
            visited[i]=true;
            path[count]=i;

            tsp(i,count+1, currentCost+cost[city][i]);
            visited[i]=false;
        }

    }
}



int main()
{
    cout<<"Enter the number of cities: ";
    cin>>n;

    cout<<"Enter the cost matrix:\n";
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            cin>>cost[i][j];
        }
    }

    for(int i=0;i<n;i++)
    visited[i]=false;

    visited[0]=true;
    path[0]=0;
    tsp(0,1,0);

    cout<<"\nMinimun cost : "<<mincost<<endl;
    cout<<"\nAll minimum path: \n";
    for(int i=0;i<pathCount;i++)
    {
        for(int j=0;j<n;j++)
        {
            cout<<char('A'+bestPath[i][j])<<" -> ";
        }
        cout<<'A'<<endl;
    }

    cout<<"\nTotal minimum path: "<<pathCount<<endl;
    return 0;
}