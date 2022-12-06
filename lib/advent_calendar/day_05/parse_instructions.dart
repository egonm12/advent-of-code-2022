import 'dart:convert';
import 'dart:io';

Future<List<List<int>>> parseInstructions(String path) async {
  final List<List<int>> data = [];

  await File('${Directory.current.path}/$path')
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach((value) {
    data.add(
      value.split(' ').map(int.tryParse).whereType<int>().toList(),
    );
  });

  return data;
}
