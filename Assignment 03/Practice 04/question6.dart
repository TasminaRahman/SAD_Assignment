void main() {
  Map<String, dynamic> person = {
    "name": "Tasmina Rahman",
    "address": "Dhaka",
    "age": 22,
    "country": "Bangladesh"
  };

  // Update country
  person["country"] = "Canada";

  print("Updated Person Information:");
  person.forEach((key, value) {
    print("$key: $value");
  });
}
