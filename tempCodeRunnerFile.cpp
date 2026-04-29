#include <iostream>
#include <cstdlib>
#include <ctime>  
using namespace std;

int main() {
    srand(time(0));

    int rounds = 10, sims = 100;
    int coop1 = 0, coop2 = 0;

    // Without Communication
    for (int i = 0; i < sims; i++) {
        for (int j = 0; j < rounds; j++) {
            double r1 = (double)rand() / RAND_MAX;
            double r2 = (double)rand() / RAND_MAX;

            if (r1 < 0.65 && r2 < 0.65)
                coop1++;
        }
    }

    // With Communication
    for (int i = 0; i < sims; i++) {
        for (int j = 0; j < rounds; j++) {
            double r1 = (double)rand() / RAND_MAX;
            double r2 = (double)rand() / RAND_MAX;

            if (r1 < 0.85 && r2 < 0.85)
                coop2++;
        }
    }

    double total = rounds * sims;

    double no_coop = (coop1 / total) * 100;
    double wc_coop = (coop2 / total) * 100;

    cout << "\n=== PRISONER'S DILEMMA RESULTS ===\n";

    cout << "\nWithout Communication: Cooperation: "
         << no_coop << "%, Defection: " << (100 - no_coop) << "%\n";

    cout << "With Communication:    Cooperation: "
         << wc_coop << "%, Defection: " << (100 - wc_coop) << "%\n";

    cout << "\nCommunication increased cooperation by: "
         << (wc_coop - no_coop) << "%\n";

    return 0;
}