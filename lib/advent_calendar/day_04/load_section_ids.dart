import 'dart:convert';
import 'dart:io';

Future<List<List<String>>> loadSectionIds(String path) async {
  final List<List<String>> data = [];

  await File('${Directory.current.path}/$path')
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach((value) {
    data.add(value.split(','));
  });

  return data;
}
