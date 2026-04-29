#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main() {
    srand(time(0));

    int rounds = 10, sims = 100;

    double total_no = 0, total_comm = 0;

    for (int s = 0; s < sims; s++) {

        double score_no = 0;
        double score_comm = 0;

        for (int r = 0; r < rounds; r++) {

            // 🎯 Without Communication (65% cooperate)
            double a = (double)rand() / RAND_MAX;
            double b = (double)rand() / RAND_MAX;

            char p1 = (a < 0.65) ? 'C' : 'D';
            char p2 = (b < 0.65) ? 'C' : 'D';

            // payoff system
            if (p1 == 'C' && p2 == 'C') score_no += 1;
            else if (p1 == 'D' && p2 == 'D') score_no += 5;
            else if (p1 == 'C' && p2 == 'D') score_no += 0;
            else score_no += 20;

            // 🎯 With Communication (85% cooperate)
            double c = (double)rand() / RAND_MAX;
            double d = (double)rand() / RAND_MAX;

            char p3 = (c < 0.85) ? 'C' : 'D';
            char p4 = (d < 0.85) ? 'C' : 'D';

            if (p3 == 'C' && p4 == 'C') score_comm += 1;
            else if (p3 == 'D' && p4 == 'D') score_comm += 5;
            else if (p3 == 'C' && p4 == 'D') score_comm += 0;
            else score_comm += 20;
        }

        total_no += score_no;
        total_comm += score_comm;
    }

    // 📊 Average score
    double avg_no = total_no / sims;
    double avg_comm = total_comm / sims;

    // 📊 Normalized percentage
    double max_score = 20.0 * rounds * sims;

    double no_percent = (total_no / max_score) * 100;
    double comm_percent = (total_comm / max_score) * 100;

    cout << "\n=== PRISONER'S DILEMMA RESULTS ===\n";

    cout << "\nWithout Communication:";
    cout << "\nAverage Score: " << avg_no;
    cout << "\nPercentage: " << no_percent << "%";

    cout << "\n\nWith Communication:";
    cout << "\nAverage Score: " << avg_comm;
    cout << "\nPercentage: " << comm_percent << "%";

    cout << "\n\nImprovement in Score: " << (avg_comm - avg_no);
    cout << "\nImprovement in %: " << (comm_percent - no_percent) << "%\n";

    return 0;
}