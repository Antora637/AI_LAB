#include <iostream>
#include <string>

using namespace std;

int main() {
    int totalRounds;
    int userTotalJail = 0;
    int computerTotalJail = 0;
    int userLastMove = 0; // ০ মানে চুপ থাকা, ১ মানে বিশ্বাসঘাতকতা

    cout << "--- Prisoners' Dilemma Game ---" << endl;
    cout << "Koto round khelte chan? ";
    cin >> totalRounds;

    for (int i = 1; i <= totalRounds; i++) {
        int userMove;
        int computerMove;

        cout << "\nRound " << i << ":" << endl;
        cout << "Apnar chal din (0 = Silent, 1 = Betray): ";
        cin >> userMove;

        // Computer Strategy: Tit-for-Tat
        if (i == 1) {
            computerMove = 0; // প্রথম রাউন্ডে কম্পিউটার সবসময় চুপ থাকবে
        } else {
            computerMove = userLastMove; // আগের রাউন্ডে আপনি যা করেছিলেন, কম্পিউটার তাই করবে
        }

        // Jail calculation logic
        if (userMove == 0 && computerMove == 0) {
            userTotalJail += 1;
            computerTotalJail += 1;
            cout << "Dujonei Silent chilen. Shaza: 1 bochor kore." << endl;
        } 
        else if (userMove == 0 && computerMove == 1) {
            userTotalJail += 10;
            computerTotalJail += 0;
            cout << "Apni Silent chilen kintu Computer Betray korse! Apnar 10 bochor jail." << endl;
        } 
        else if (userMove == 1 && computerMove == 0) {
            userTotalJail += 0;
            computerTotalJail += 10;
            cout << "Apni Betray koresen kintu Computer Silent chilo! Apnar mukti." << endl;
        } 
        else {
            userTotalJail += 5;
            computerTotalJail += 5;
            cout << "Dujonei Betray koresen. Shaza: 5 bochor kore." << endl;
        }

        userLastMove = userMove; // এই রাউন্ডের চাল মনে রাখা হচ্ছে পরের রাউন্ডের জন্য
    }

    // Final Result
    cout << "\n===============================" << endl;
    cout << "Shorbomot Jail:" << endl;
    cout << "Apnar: " << userTotalJail << " bochor" << endl;
    cout << "Computer-er: " << computerTotalJail << " bochor" << endl;

    if (userTotalJail < computerTotalJail) {
        cout << "Result: Apni jitesen!" << endl;
    } else if (userTotalJail > computerTotalJail) {
        cout << "Result: Computer jitese!" << endl;
    } else {
        cout << "Result: Draw hoyese!" << endl;
    }
    cout << "===============================" << endl;

    return 0;
}