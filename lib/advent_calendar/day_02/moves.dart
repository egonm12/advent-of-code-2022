enum Move {
  rock(1),
  paper(2),
  scissors(3);

  const Move(this.value);

  final int value;

  int resultAgainst(Move move) {
    if (move == Move.rock && this == Move.scissors) return 0;
    if (move == Move.paper && this == Move.scissors) return 6;

    if (move == Move.rock && this == Move.paper) return 6;
    if (move == Move.scissors && this == Move.paper) return 0;

    if (move == Move.scissors && this == Move.rock) return 6;
    if (move == Move.paper && this == Move.rock) return 0;

    // move == this
    return 3;
  }

  Move findMove(String requiredResult) {
    return requiredResult == 'X'
        ? Move.values.firstWhere((move) => resultAgainst(move) == 6)
        : requiredResult == 'Y'
            ? Move.values.firstWhere((move) => resultAgainst(move) == 3)
            : Move.values.firstWhere((move) => resultAgainst(move) == 0);
  }
}
