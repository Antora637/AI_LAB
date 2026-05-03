#include<iostream>
#include<queue>
using namespace std;
int main()
{
    int n, a[21][21],visited[21]={0};
    
    cout<<"Enter the number of vertices: ";
    cin>>n;

    cout<<"Enter the graph as matrix form:\n";
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

cout<<"BFS Traversal: \n";

queue<int>q;
q.push(start);
visited[start]=1;

while(!q.empty())
{
int v=q.front();
q.pop();
cout<<v<<"  ";
for(int i=1;i<=n;i++){
if(a[v][i]==1 && visited[i]==0)
{
    q.push(i);
     visited[i]=1;

   
}
}

}
return 0;
}
