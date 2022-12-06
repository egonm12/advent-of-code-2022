import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';

Future<List<List<List<String>>>> loadRucksackItemsFromFile(String path) async {
  final List<List<List<String>>> data = [];

  await File('${Directory.current.path}/$path')
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach((value) {
    final stringLength = value.length;

    final list = value.split('').slices(stringLength ~/ 2).toList();

    data.add(list);
  });

  return data;
}

Future<List<List<String>>> loadRucksacksFromFile(String path) async {
  final List<List<String>> data = [];

  await File('${Directory.current.path}/$path')
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach((value) {
    data.add(value.split('').toList());
  });

  return data;
}
