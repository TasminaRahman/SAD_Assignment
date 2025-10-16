import 'dart:math';
import 'dart:io';

double areaOfCircle(double radius) {
  return pi * radius * radius;
}

void main() {
  stdout.write("Enter radius: ");
  double r = double.parse(stdin.readLineSync()!);

  double area = areaOfCircle(r);
  print("Area of circle = ${area.toStringAsFixed(2)}");
}
