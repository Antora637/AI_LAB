#include<iostream>
using namespace std;
int n, ary[21][21],visited[21]={0};

void dfs(int v)
{
    cout<<v<<" ";
    visited[v]=1;

    for(int i=1;i<=n;i++)
    {
       if(ary[v][i]==1 && visited[i]==0)
       {
        dfs(i);
       }
    }
}

int main()
{
    cout<<"Enter the number of vertices: ";
    cin>>n;

    cout<<"Enter the graph as matrix form:\n";
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            cin>>ary[i][j];
            }
    }

    int start;
cout<<"Enter the starting vertex: ";
cin>>start;

cout<<"DFS Traversal: \n";

dfs(start);




}