import random
import json

NUM_SIMULATIONS = 100
NUM_ROUNDS = 10
RISK_LEVELS = [10, 25, 40, 55, 70, 85]

STAG = "STAG"
HARE = "HARE"

def get_choice(risk):
    stag_prob = (100 - risk) / 100
    return STAG if random.random() < stag_prob else HARE

def play_round(a, b):
    if a == STAG and b == STAG:
        return 10, 10
    elif a == HARE and b == HARE:
        return 7, 7
    elif a == STAG and b == HARE:
        return 0, 7
    else:
        return 7, 0

def run_simulation(risk):
    total_stag = 0
    total_hare = 0
    total_payoff = 0

    for _ in range(NUM_SIMULATIONS):
        for _ in range(NUM_ROUNDS):

            a = get_choice(risk)
            b = get_choice(risk)

            pa, pb = play_round(a, b)

            if a == STAG:
                total_stag += 1
            else:
                total_hare += 1

            total_payoff += (pa + pb) / 2

    total_choices = total_stag + total_hare

    return {
        "stag_percentage": round((total_stag / total_choices) * 100, 2),
        "hare_percentage": round((total_hare / total_choices) * 100, 2),
        "average_payoff": round(total_payoff / total_choices, 2)
    }

def main():
    results = {}

    print("\nSTAG HUNT EXPERIMENT RESULTS\n")
    print(f"{'Risk':<10} {'STAG %':<10} {'HARE %':<10} {'Avg Payoff':<10}")
    print("-" * 45)

    for risk in RISK_LEVELS:
        stats = run_simulation(risk)
        results[risk] = stats

        print(
            f"{risk}%{'':<6} "
            f"{stats['stag_percentage']}%{'':<5} "
            f"{stats['hare_percentage']}%{'':<5} "
            f"{stats['average_payoff']}"
        )

    with open("stag_hunt_results.json", "w") as f:
        json.dump(results, f, indent=2)

    print("\nResults saved to stag_hunt_results.json")

if __name__ == "__main__":
    main()
