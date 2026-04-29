#include<iostream>
#include<queue>
using namespace std;
int main()
{
  int n;
  cout<<"Enter the number of vertices: ";
  cin>>n;

  int a[21][21],visited[21]={0};

  cout<<"Enter the graph data in matrix form: \n";
  for(int i=1;i<=n;i++)
  {
    for(int j=1;j<=n;j++)
    {
      cin>>a[i][j];
    }
  }

  int start;
  cout<<"Enter the starting vertex: ";
  cin>>start;
 
if(start<1 || start>n)
{
  cout<<"Invalid vertex!";
  return 0;
}

queue<int>q;
q.push(start);
visited[start]=1;

cout<<"BFS Traversal: \n";
while(!q.empty())
{
    int v=q.front();
    q.pop();
    cout<<v<<" ";

    for(int i=1;i<=n;i++)
    {
      if(a[v][i]==1 && visited[i]==0)
      {
        q.push(i);
        visited[i]=1;
      }
    }



}
return 0;
}