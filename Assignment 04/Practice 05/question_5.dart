import 'dart:io';

void main() async {
  for (int i = 1; i <= 100; i++) {
    var file = File('file_$i.txt');
    await file.writeAsString('This is file number $i');
  }
  print('100 files created successfully.');
}
