import 'dart:io';

void main() async {
  var source = File('hello.txt');
  var destination = File('hello_copy.txt');
  await source.copy(destination.path);
  print('File copied to hello_copy.txt successfully.');
}
