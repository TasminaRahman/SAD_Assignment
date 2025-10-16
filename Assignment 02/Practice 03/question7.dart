import 'dart:math';
import 'dart:io';

num power(num base, num exponent) {
  return pow(base, exponent);
}

void main() {
  stdout.write("Enter base: ");
  num base = num.parse(stdin.readLineSync()!);

  stdout.write("Enter exponent: ");
  num exp = num.parse(stdin.readLineSync()!);

  print("$base^$exp = ${power(base, exp)}");
}
