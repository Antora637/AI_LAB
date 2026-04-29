#include<iostream>
using namespace std;
int a[21][21],visited[21],n;

void dfs(int v)
{
    cout<<v<<" ";
    visited[v]=1;

    for(int i=1;i<=n;i++)
    {
        if(a[v][i]==1 && visited[i]==0)
        {
        
dfs(i);
        }

    }
}

int main()
{
  cout<<"Enter the number of vertices: ";
  cin>>n;

  cout<<"Enter the graph data in matrix form: \n";
  for(int i=1;i<=n;i++)
  {
    for(int j=1;j<=n;j++)
    {
        cin>>a[i][j];
    }
  }
  int start;
  cout<<"Enter the starting vertex:";
  cin>>start;

  if(start<1||start>n)
  {
    cout<<"Invalid vertex!";
    return 0;
  }

 cout<<"DFS Traversal:\n";
 dfs(start);


}