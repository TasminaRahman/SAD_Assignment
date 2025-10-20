void main() {
  List<String> friends = ["Ayesha", "Rahim", "Anika", "Tasmina", "Farhan", "Arif", "Sadia"];

  Iterable<String> aNames = friends.where((name) => name.toLowerCase().startsWith('a'));

  print("Friends whose names start with 'A':");
  for (String name in aNames) {
    print(name);
  }
}
