#include <bits/stdc++.h>
using namespace std;

void bfs(int i, int v, vector<vector<int>> &adj_mat, vector<bool> &visited){
    queue<int> Q;
    Q.push(i);

    while(!Q.empty()){
        int u = Q.front();
        cout << u << " ";
        Q.pop();
        visited[u] = true;

        for(auto j : adj_mat[u]) {
            if(!visited[j]){
                visited[j] = true;
                Q.push(j);
            }
        }
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
    
    bfs(0, v, adj_mat, visited);
}