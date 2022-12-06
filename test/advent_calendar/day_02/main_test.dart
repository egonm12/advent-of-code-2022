import 'package:advent_of_code_2022_1/advent_calendar/day_02/load_string_list_from_file.dart';
import 'package:advent_of_code_2022_1/advent_calendar/day_02/main.dart';
import 'package:advent_of_code_2022_1/advent_calendar/day_02/moves.dart';
import 'package:test/test.dart';

void main() {
  group('Day 02', () {
    test('loadStringListFromFile', () async {
      const path = 'test/data/day_02.txt';
      const expected = [
        [
          'A',
          'Y',
        ],
        [
          'B',
          'X',
        ],
        [
          'C',
          'Z',
        ],
      ];

      final result = await loadStringListFromFile(path);

      expect(result, expected);
    });

    test('findMove', () {
      final loseMove = 'X';
      final drawMove = 'Y';
      final winMove = 'Z';

      expect(Move.rock.findMove(loseMove), Move.scissors);
      expect(Move.rock.findMove(drawMove), Move.rock);
      expect(Move.rock.findMove(winMove), Move.paper);

      expect(Move.paper.findMove(loseMove), Move.rock);
      expect(Move.paper.findMove(drawMove), Move.paper);
      expect(Move.paper.findMove(winMove), Move.scissors);

      expect(Move.scissors.findMove(loseMove), Move.paper);
      expect(Move.scissors.findMove(drawMove), Move.scissors);
      expect(Move.scissors.findMove(winMove), Move.rock);
    });

    test(assignment_2, () async {
      final data = await loadStringListFromFile('test/data/day_02.txt');

      expect(await assignment_2(data), 12);
    });
  });
}
