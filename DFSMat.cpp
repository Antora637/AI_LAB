#include <iostream>
using namespace std;

int a[21][21], visited[21] = {0}, n;

void dfs(int v)
{
    cout << v << "\t";   // visit node
    visited[v] = 1;

    for (int i = 1; i <= n; i++)
    {
        if (a[v][i] == 1 && visited[i] == 0)
        {
            dfs(i);   // recursive call
        }
    }
}

int main()
{
    int start;

    cout << "Enter number of vertices: ";
    cin >> n;

    cout << "Enter graph data in matrix form:\n";
    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= n; j++)
        {
            cin >> a[i][j];
        }
    }

    cout << "Enter starting vertex: ";
    cin >> start;

    if (start < 1 || start > n)
    {
        cout << "Invalid starting vertex!\n";
        return 0;
    }

    cout << "\nDFS traversal:\n";
    dfs(start);

    return 0;
}