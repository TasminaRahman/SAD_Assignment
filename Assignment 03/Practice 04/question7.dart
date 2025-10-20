void main() {
  Map<String, String> contacts = {
    "John": "01711111111",
    "Alex": "01722222222",
    "Mark": "01733333333",
    "Ali": "01744444444",
  };

  Iterable<String> keysWithLength4 = contacts.keys.where((key) => key.length == 4);

  print("Keys with length 4:");
  for (String key in keysWithLength4) {
    print(key);
  }
}
