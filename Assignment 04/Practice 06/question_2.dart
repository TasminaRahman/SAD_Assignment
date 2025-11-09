class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);
}

void main() {
  House h1 = House(1, 'Dream Villa', 5000000);
  House h2 = House(2, 'Sunny Apartment', 2500000);
  House h3 = House(3, 'Lake View', 4000000);

  List<House> houses = [h1, h2, h3];

  for (var house in houses) {
    print('ID: ${house.id}, Name: ${house.name}, Price: ${house.price}');
  }
}
