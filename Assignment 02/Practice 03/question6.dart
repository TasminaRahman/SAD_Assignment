String reverseString(String input) {
  return input.split('').reversed.join();
}

void main() {
  String text = "Tasmina";
  print("Original: $text");
  print("Reversed: ${reverseString(text)}");
}
