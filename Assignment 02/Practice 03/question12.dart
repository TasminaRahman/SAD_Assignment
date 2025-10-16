num calculateArea({num length = 1, num width = 1}) {
  return length * width;
}

void main() {
  print("Default area: ${calculateArea()}");
  print("Custom area: ${calculateArea(length: 5, width: 3)}");
}
