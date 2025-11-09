import 'dart:io';

void main() async {
  var file = File('hello.txt');
  await file.writeAsString('Tasmina Rahman Chowdhury');
  print('Name written to hello.txt successfully.');
}
