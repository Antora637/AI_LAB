#include <iostream>
using namespace std;

int G[20][20], visited[20], n;

void DFS(int i)
{
    cout << i << "\t";
    visited[i] = 1;

    for (int j = 0; j < n; j++)
    {
        if (G[i][j] == 1 && !visited[j])
        {
            DFS(j);
        }
    }
}

int main()
{
    int start;

    cout << "Enter number of vertices: ";
    cin >> n;

    cout << "Enter adjacency matrix:\n";
    for (int i = 0; i < n; i++)
    {
        visited[i] = 0;
        for (int j = 0; j < n; j++)
        {
            cin >> G[i][j];
        }
    }

    cout << "Enter starting vertex: ";
    cin >> start;

    cout << "\nDFS Traversal:\n";
    DFS(start);

    return 0;
}