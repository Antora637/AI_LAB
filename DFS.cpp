#include <bits/stdc++.h>
using namespace std;

void dfs(int i, int v, vector<vector<int>> &adj_mat, vector<bool> &visited)
{
    visited[i] = true;
    cout << i << " ";
    for (int j : adj_mat[i])
    {
        if (!visited[j])
            dfs(j, v, adj_mat, visited);
    }
}

int main()
{
    int v, e;
    cin >> v >> e;
    vector<vector<int>> adj_mat(v);
    vector<bool> visited(v, false);

    for (int i = 0; i < e; i++)
    {
        int u, w;
        cin >> u >> w;
        adj_mat[u].push_back(w);
        adj_mat[w].push_back(u);
    }
    
    dfs(0, v, adj_mat, visited);
}