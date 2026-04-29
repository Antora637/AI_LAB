#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main() {
    srand(time(0));

    int simulations = 100;
    int rounds = 10;

    int riskLevels[] = {10, 25, 40, 55, 70, 85};

    cout << "Risk\tStag%\tHare%\tAvg Payoff\n";
    cout << "--------------------------------------\n";

    // 🔵 outer loop (NOT i/j)
    for (int k = 0; k < 6; k++) {

        int risk = riskLevels[k];

        int stag = 0, hare = 0;
        double payoff = 0;

        // 🔵 nested loop (i and j use allowed here)
        for (int i = 0; i < simulations; i++) {
            for (int j = 0; j < rounds; j++) {

                double a = (double)rand() / RAND_MAX;
                double b = (double)rand() / RAND_MAX;

                string A = (a < (100 - risk) / 100.0) ? "S" : "H";
                string B = (b < (100 - risk) / 100.0) ? "S" : "H";

                if (A == "S") stag++;
                else hare++;

                if (A == "S" && B == "S") payoff += 10;
                else if (A == "H" && B == "H") payoff += 7;
                else if (A == "S" && B == "H") payoff += 0;
                else payoff += 7;
            }
        }

        int total = simulations * rounds;

        double stagPercent = (stag * 100.0) / total;
        double harePercent = (hare * 100.0) / total;
        double avgPayoff = payoff / total;

        cout << risk << "%\t"
             << stagPercent << "%\t"
             << harePercent << "%\t"
             << avgPayoff << "\n";
    }

    return 0;
}