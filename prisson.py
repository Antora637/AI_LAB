import random
import json

class PrisonersDilemma:
    def __init__(self, rounds=10, sims=100):
        self.rounds = rounds
        self.sims = sims

    def play(self, p1, p2):
        if p1 == "C" and p2 == "C":
            return (1, 1)
        if p1 == "D" and p2 == "D":
            return (5, 5)
        if p1 == "C" and p2 == "D":
            return (20, 0)
        return (0, 20)

    def strategy(self, rate=0.7):
        return "C" if random.random() < rate else "D"

    def run_sim(self, communication=False):
        boost = 0.2 if communication else 0
        coop = defect = 0
        for _ in range(self.rounds):
            rate = 0.65 + boost
            p1 = self.strategy(rate)
            p2 = self.strategy(rate)
            if p1 == "C" and p2 == "C":
                coop += 1
            else:
                defect += 1
        return coop, defect

    def run_all(self):
        no_comm = [self.run_sim(False) for _ in range(self.sims)]
        with_comm = [self.run_sim(True) for _ in range(self.sims)]
        return no_comm, with_comm

    def stats(self, results):
        total_coop = sum(c for c, d in results)
        total_rounds = self.sims * self.rounds
        coop_rate = round((total_coop/total_rounds)*100, 2)
        return coop_rate, round(100 - coop_rate, 2)
if __name__ == "__main__":
    exp = PrisonersDilemma()
    no_comm, with_comm = exp.run_all()
    no_coop, no_def = exp.stats(no_comm)
    wc_coop, wc_def = exp.stats(with_comm)

    print("\n=== PRISONER'S DILEMMA RESULTS ===")
    print(
        f"\nWithout Communication: Cooperation: {no_coop}%, Defection: {no_def}%")
    print(
        f"With Communication:    Cooperation: {wc_coop}%, Defection: {wc_def}%")
    print(
        f"\nCommunication increased cooperation by: {round(wc_coop-no_coop,2)}%")

