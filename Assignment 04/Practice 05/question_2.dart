import 'dart:io';

void main() async {
  var file = File('hello.txt');
  await file.writeAsString('\nMy friend: Ayesha Khan', mode: FileMode.append);
  print('Friend\'s name appended successfully.');
}
