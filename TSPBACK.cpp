#include <iostream>
using namespace std;

// number of cities
int n;

// cost matrix (distance between cities)
int cost[20][20];

// visited array (true = already visited, false = not visited)
bool visited[20];

// minimum cost found so far
int minCost = 999999;

// current path store
int path[20];

// all best (minimum cost) paths store
int bestPath[1000][20];

// how many best paths found
int pathCount = 0;

// recursive function for TSP
void tsp(int city, int count, int currentCost)
{
    // BASE CASE: all cities visited
    if(count == n)
    {
        // check if return path exists to start (A = 0)
        if(cost[city][0] != 0)
        {
            int totalCost = currentCost + cost[city][0];

            // if new minimum cost found
            if(totalCost < minCost)
            {
                minCost = totalCost;   // update min cost
                pathCount = 0;         // reset previous paths
            }

            // if same minimum cost found, store path
            if(totalCost == minCost)
            {
                for(int i = 0; i < n; i++)
                    bestPath[pathCount][i] = path[i];

                pathCount++;
            }
        }
        return;
    }

    // try all possible next cities
    for(int i = 0; i < n; i++)
    {
        // if city not visited and path exists
        if(!visited[i] && cost[city][i] != 0)
        {
            visited[i] = true;      // mark visited
            path[count] = i;        // add city to path

            // recursive call for next city
            tsp(i, count + 1, currentCost + cost[city][i]);

            visited[i] = false;     // backtrack (undo choice)
        }
    }
}

int main()
{
    cout << "Enter number of cities: ";
    cin >> n;

    cout << "Enter cost matrix:\n";
    for(int i = 0; i < n; i++)
    {
        for(int j = 0; j < n; j++)
        {
            cin >> cost[i][j];
        }
    }

    // initialize all cities as not visited
    for(int i = 0; i < n; i++)
        visited[i] = false;

    // start from city 0 (A)
    visited[0] = true;
    path[0] = 0;

    // start recursion
    tsp(0, 1, 0);

    // print minimum cost
    cout << "\nMinimum Cost = " << minCost << endl;

    // print all minimum cost paths
    cout << "\nAll Minimum Cost Paths:\n";

    for(int i = 0; i < pathCount; i++)
    {
        for(int j = 0; j < n; j++)
        {
            // convert 0,1,2,3 -> A,B,C,D
            cout << char('A' + bestPath[i][j]) << " -> ";
        }
        cout << "A" << endl; // return to start city
    }

    // total number of best paths
    cout << "\nTotal minimum paths = " << pathCount << endl;

    return 0;
}