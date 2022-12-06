import 'package:advent_of_code_2022_1/advent_calendar/day_05/main.dart';
import 'package:advent_of_code_2022_1/advent_calendar/day_05/parse_instructions.dart';
import 'package:test/test.dart';

void main() {
  test(parseInstructions, () async {
    final expected = [
      [1, 2, 1],
      [3, 1, 3],
      [2, 2, 1],
      [1, 1, 2]
    ];

    expect(await parseInstructions('test/data/day_05.txt'), expected);
  });

  test(moveCratesOneByOne, () {
    final Map<int, List<String>> input = {
      1: ['Z', 'N'],
      2: ['M', 'C', 'D'],
      3: ['P'],
    };
    final Map<int, List<String>> expected = {
      1: ['Z', 'N'],
      2: ['M'],
      3: ['P', 'D', 'C'],
    };

    expect(moveCratesOneByOne(input, 2, 2, 3), expected);
  });

  test(moveCratesRetainingOrder, () {
    final Map<int, List<String>> input = {
      1: ['Z', 'N'],
      2: ['M', 'C', 'D'],
      3: ['P'],
    };
    final Map<int, List<String>> expected = {
      1: ['Z', 'N'],
      2: ['M'],
      3: ['P', 'C', 'D'],
    };

    expect(moveCratesRetainingOrder(input, 2, 2, 3), expected);
  });

  test(result, () async {
    final Map<int, List<String>> input = {
      1: ['Z', 'N'],
      2: ['M', 'C', 'D'],
      3: ['P'],
    };

    expect(result(input), 'NDP');
  });

  test(crateMover9000, () async {
    final Map<int, List<String>> input = {
      1: ['Z', 'N'],
      2: ['M', 'C', 'D'],
      3: ['P'],
    };
    final instructions = await parseInstructions('test/data/day_05.txt');

    expect(await crateMover9000(input, instructions), 'CMZ');
  });

  test(crateMover9001, () async {
    final Map<int, List<String>> input = {
      1: ['Z', 'N'],
      2: ['M', 'C', 'D'],
      3: ['P'],
    };
    final instructions = await parseInstructions('test/data/day_05.txt');

    expect(await crateMover9001(input, instructions), 'MCD');
  });
}
