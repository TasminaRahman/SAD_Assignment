import 'dart:io';

void main() {
  stdout.write("Enter a character: ");
  String ch = stdin.readLineSync()!;

  if (ch.length != 1) {
    print("Please enter only one character!");
  } else if ('aeiouAEIOU'.contains(ch)) {
    print("$ch is a vowel");
  } else {
    print("$ch is a consonant");
  }
}
