import 'package:advent_of_code_2022_1/advent_calendar/day_02/load_string_list_from_file.dart';

import 'moves.dart';

void main() async {
  final input2 = await loadStringListFromFile('lib/data/day_02.txt');

  final assignment2 = await assignment_2(input2);

  print(assignment2);
}

Future<int> assignment_2(List<List<String>> input) async {
  int finalResult = 0;

  for (final round in input) {
    final enemyMove = decryptMove2(round[0]);
    final myMove = enemyMove.findMove(round[1]);

    finalResult += myMove.resultAgainst(enemyMove) + myMove.value;
  }

  return finalResult;
}

Move decryptMove2(String encryptedMove) {
  if (encryptedMove == 'A') return Move.rock;
  if (encryptedMove == 'B') return Move.paper;
  if (encryptedMove == 'C') return Move.scissors;

  throw Exception('No valid encryption');
}
