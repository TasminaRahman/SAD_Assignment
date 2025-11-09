import 'dart:io';

void main() async {
  var file = File('students.csv');

  // Write data
  await file.writeAsString('Name,Age,Address\n');
  await file.writeAsString('Tasmina,22,Dhaka\n', mode: FileMode.append);
  await file.writeAsString('Ayesha,21,Chittagong\n', mode: FileMode.append);
  await file.writeAsString('Rafi,23,Khulna\n', mode: FileMode.append);
  print('Data written to students.csv');

  // Read data
  String contents = await file.readAsString();
  print('\nFile contents:\n$contents');
}
