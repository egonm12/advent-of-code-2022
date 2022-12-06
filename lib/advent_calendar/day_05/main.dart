import 'package:advent_of_code_2022_1/advent_calendar/day_05/parse_instructions.dart';

main() async {
  final Map<int, List<String>> data = {
    1: ['D', 'L', 'V', 'T', 'M', 'H', 'F'],
    2: ['H', 'Q', 'G', 'J', 'C', 'T', 'N', 'P'],
    3: ['R', 'S', 'D', 'M', 'P', 'H'],
    4: ['L', 'B', 'V', 'F'],
    5: ['N', 'H', 'G', 'L', 'Q'],
    6: ['W', 'B', 'D', 'G', 'R', 'M', 'P'],
    7: ['G', 'M', 'N', 'R', 'C', 'H', 'L', 'Q'],
    8: ['C', 'L', 'W'],
    9: ['R', 'D', 'L', 'Q', 'J', 'Z', 'M', 'T'],
  };
  final List<List<int>> moves = await parseInstructions('lib/data/day_05.txt');

  final result = await crateMover9001(data, moves);
  print(result);
}

Future<String> crateMover9000(
  Map<int, List<String>> data,
  List<List<int>> moves,
) async {
  for (final move in moves) {
    moveCratesOneByOne(data, move[0], move[1], move[2]);
  }

  return result(data);
}

Future<String> crateMover9001(
  Map<int, List<String>> data,
  List<List<int>> moves,
) async {
  for (final move in moves) {
    moveCratesRetainingOrder(data, move[0], move[1], move[2]);
  }

  return result(data);
}

Map<int, List<String>> moveCratesOneByOne(
  Map<int, List<String>> currentStacks,
  int crates,
  int from,
  int to,
) {
  for (var i = 0; i < crates; i++) {
    currentStacks[to]!.add(currentStacks[from]!.last);
    currentStacks[from]!.removeAt(currentStacks[from]!.length - 1);
  }

  return currentStacks;
}

Map<int, List<String>> moveCratesRetainingOrder(
  Map<int, List<String>> currentStacks,
  int crates,
  int from,
  int to,
) {
  currentStacks[to]!
      .addAll(currentStacks[from]!.reversed.take(crates).toList().reversed);
  currentStacks[from]!.removeRange(
      currentStacks[from]!.length - crates, currentStacks[from]!.length);

  return currentStacks;
}

String result(Map<int, List<String>> stacks) {
  String message = '';
  for (final stack in stacks.values) {
    message += stack.last;
  }

  return message;
}
