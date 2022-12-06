import 'package:advent_of_code_2022_1/advent_calendar/day_03/load_rucksack_items_from_file.dart';

void main() async {
  final path = 'lib/data/day_03.txt';
  final ruckSacks = await loadRucksacksFromFile(path);
  print(sumOfPriorities2(divideInGroups(ruckSacks, 3)));
}

List<List<List<String>>> divideInGroups(
  List<List<String>> ruckSacks,
  int divideIn,
) {
  final List<List<List<String>>> dividedGroups = [];

  for (int i = 0; i < ruckSacks.length; i++) {
    final currentGroupIndex = dividedGroups.length - 1;

    if (i % divideIn == 0) {
      // create new group
      dividedGroups.add([ruckSacks[i]]);
    } else {
      // add to existing group
      dividedGroups[currentGroupIndex].add(ruckSacks[i]);
    }
  }

  return dividedGroups;
}

int sumOfPriorities(List<List<List<String>>> ruckSacks) {
  int sum = 0;

  for (final ruckSack in ruckSacks) {
    final commonItem = findCommonItem(ruckSack);

    sum += charPriority[commonItem]!;
  }

  return sum;
}

int sumOfPriorities2(List<List<List<String>>> ruckSacks) {
  int sum = 0;

  for (final ruckSack in ruckSacks) {
    final commonItem = findCommonItem2(ruckSack);

    sum += charPriority[commonItem]!;
  }

  return sum;
}

String findCommonItem2(List<List<String>> rucksacks) {
  final rucksackOne = rucksacks[0];
  final rucksackTwo = rucksacks[1];
  final rucksackThree = rucksacks[2];
  final uniqueItems = rucksackOne.toSet();

  Set<String> commonItem = {};
  String foo = '';

  for (final item in rucksackTwo) {
    if (uniqueItems.contains(item)) {
      commonItem.add(item);
    }
  }

  for (final item in rucksackThree) {
    if (commonItem.contains(item)) {
      foo = item;
    }
  }

  return foo;
}

String findCommonItem(List<List<String>> ruckSack) {
  final compartmentOne = ruckSack[0];
  final compartmentTwo = ruckSack[1];
  final uniqueItems = compartmentOne.toSet();

  String commonItem = '';

  for (final item in compartmentTwo) {
    if (uniqueItems.contains(item)) {
      commonItem = item;
      break;
    }
  }

  return commonItem;
}

Map<String, int> charPriority = {
  'a': 1,
  'b': 2,
  'c': 3,
  'd': 4,
  'e': 5,
  'f': 6,
  'g': 7,
  'h': 8,
  'i': 9,
  'j': 10,
  'k': 11,
  'l': 12,
  'm': 13,
  'n': 14,
  'o': 15,
  'p': 16,
  'q': 17,
  'r': 18,
  's': 19,
  't': 20,
  'u': 21,
  'v': 22,
  'w': 23,
  'x': 24,
  'y': 25,
  'z': 26,
  'A': 27,
  'B': 28,
  'C': 29,
  'D': 30,
  'E': 31,
  'F': 32,
  'G': 33,
  'H': 34,
  'I': 35,
  'J': 36,
  'K': 37,
  'L': 38,
  'M': 39,
  'N': 40,
  'O': 41,
  'P': 42,
  'Q': 43,
  'R': 44,
  'S': 45,
  'T': 46,
  'U': 47,
  'V': 48,
  'W': 49,
  'X': 50,
  'Y': 51,
  'Z': 52,
};
