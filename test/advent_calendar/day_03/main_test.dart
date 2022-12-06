import 'package:advent_of_code_2022_1/advent_calendar/day_03/main.dart';
import 'package:advent_of_code_2022_1/advent_calendar/day_03/load_rucksack_items_from_file.dart';
import 'package:test/test.dart';

void main() {
  group('Day 03', () {
    test(loadRucksackItemsFromFile, () async {
      final path = 'test/data/day_03.txt';
      final rucksacks = await loadRucksackItemsFromFile(path);
      final expected = [
        ['v', 'J', 'r', 'w', 'p', 'W', 't', 'w', 'J', 'g', 'W', 'r'],
        ['h', 'c', 's', 'F', 'M', 'M', 'f', 'F', 'F', 'h', 'F', 'p'],
      ];

      expect(rucksacks[0], expected);
    });

    test('divideInGroups 3', () async {
      final input = [
        ['a'],
        ['b'],
        ['c'],
        ['d'],
        ['e'],
        ['f']
      ];
      final expected = [
        [
          ['a'],
          ['b'],
          ['c']
        ],
        [
          ['d'],
          ['e'],
          ['f']
        ]
      ];

      expect(divideInGroups(input, 3), expected);
    });

    test('divideInGroups 2', () async {
      final input = [
        ['a'],
        ['b'],
        ['c'],
        ['d'],
        ['e'],
        ['f']
      ];
      final expected = [
        [
          ['a'],
          ['b'],
        ],
        [
          ['c'],
          ['d'],
        ],
        [
          ['e'],
          ['f']
        ]
      ];

      expect(divideInGroups(input, 2), expected);
    });

    test(findCommonItem2, () async {
      final input = await loadRucksacksFromFile('test/data/day_03.txt');

      expect(findCommonItem2(divideInGroups(input, 3)[1]), 'Z');
    });

    test(findCommonItem, () {
      final ruckSack = [
        ['v', 'J', 'r', 'w', 'p', 'W', 't', 'w', 'J', 'g', 'W', 'r'],
        ['h', 'c', 's', 'F', 'M', 'M', 'f', 'F', 'F', 'h', 'F', 'p'],
      ];

      expect(findCommonItem(ruckSack), 'p');
    });

    test(sumOfPriorities, () async {
      final ruckSacks = await loadRucksackItemsFromFile('test/data/day_03.txt');

      expect(sumOfPriorities(ruckSacks), 157);
    });

    test(sumOfPriorities2, () async {
      final ruckSacks = await loadRucksacksFromFile('test/data/day_03.txt');
      final foo = divideInGroups(ruckSacks, 3);
      expect(sumOfPriorities2(foo), 70);
    });
  });
}
