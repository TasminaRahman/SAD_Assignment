num maxNumber(num a, num b, num c) {
  if (a >= b && a >= c) {
    return a;
  } else if (b >= a && b >= c) {
    return b;
  } else {
    return c;
  }
}

void main() {
  print("Largest number: ${maxNumber(12, 45, 33)}");
}
