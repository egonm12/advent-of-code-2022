import 'package:advent_of_code_2022_1/advent_calendar/day_04/load_section_ids.dart';

void main() async {
  final input = await loadSectionIds('lib/data/day_04.txt');

  int count = 0;

  for (final pair in input) {
    if (partiallyContainsAssignment(pair[0], pair[1])) count++;
  }

  print(count);
}

bool fullyContainsAssignment(String assignmentA, String assignmentB) {
  final rangeA = assignmentA.split('-').map(int.parse).toList();
  final rangeB = assignmentB.split('-').map(int.parse).toList();

  if (isInRange(rangeA[0], rangeB[0], rangeB[1]) &&
      isInRange(rangeA[1], rangeB[0], rangeB[1])) {
    return true;
  } else if (isInRange(rangeB[0], rangeA[0], rangeA[1]) &&
      isInRange(rangeB[1], rangeA[0], rangeA[1])) {
    return true;
  }

  return false;
}

bool partiallyContainsAssignment(String assignmentA, String assignmentB) {
  final rangeA = assignmentA.split('-').map(int.parse).toList();
  final rangeB = assignmentB.split('-').map(int.parse).toList();

  if (isInRange(rangeA[0], rangeB[0], rangeB[1]) ||
      isInRange(rangeA[1], rangeB[0], rangeB[1])) {
    return true;
  } else if (isInRange(rangeB[0], rangeA[0], rangeA[1]) ||
      isInRange(rangeB[1], rangeA[0], rangeA[1])) {
    return true;
  }

  return false;
}

bool isInRange(int value, int from, int to) => value.isWithinRange(from, to);

extension Range on num {
  bool isWithinRange(num from, num to) {
    return from <= this && this <= to;
  }
}
