import 'dart:math';

import 'package:advent_of_code_2022_1/advent_calendar/day_04/load_section_ids.dart';
import 'package:advent_of_code_2022_1/advent_calendar/day_04/main.dart';
import 'package:test/test.dart';

void main() {
  group('Day 04', () {
    test(loadSectionIds, () async {
      const path = 'test/data/day_04.txt';
      final expected = [
        ['2-4', '6-8'],
        ['2-3', '4-5'],
        ['5-7', '7-9'],
        ['2-8', '3-7'],
        ['6-6', '4-6'],
        ['2-6', '4-8'],
      ];

      expect(await loadSectionIds(path), expected);
    });

    test('isWithinRange', () {
      expect(1.isWithinRange(0, 2), true);
      expect(1.isWithinRange(0, 1), true);
      expect(1.isWithinRange(1, 1), true);
      expect(1.isWithinRange(1, 2), true);
      expect(1.isWithinRange(2, 3), false);
      expect(1.isWithinRange(-2, 0), false);
    });

    test(fullyContainsAssignment, () {
      expect(fullyContainsAssignment('1-3', '1-2'), true);
      expect(fullyContainsAssignment('1-2', '1-3'), true);
      expect(fullyContainsAssignment('1-3', '1-3'), true);
    });

    test(partiallyContainsAssignment, () {
      expect(partiallyContainsAssignment('1-3', '3-4'), true);
      expect(partiallyContainsAssignment('1-2', '2-3'), true);
      expect(partiallyContainsAssignment('1-3', '0-1'), true);
    });
  });
}
