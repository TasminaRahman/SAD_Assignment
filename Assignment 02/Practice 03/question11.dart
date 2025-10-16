void createUser(String name, int age, {bool isActive = true}) {
  print("User Name: $name");
  print("Age: $age");
  print("Active: $isActive");
}

void main() {
  createUser("Tasmina", 22);
  createUser("Rahim", 25, isActive: false);
}
