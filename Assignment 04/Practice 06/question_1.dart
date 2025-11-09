class Laptop {
  int id;
  String name;
  String ram;

  Laptop(this.id, this.name, this.ram);
}

void main() {
  Laptop l1 = Laptop(1, 'HP Pavilion', '8GB');
  Laptop l2 = Laptop(2, 'Dell Inspiron', '16GB');
  Laptop l3 = Laptop(3, 'Lenovo ThinkPad', '12GB');

  List<Laptop> laptops = [l1, l2, l3];

  for (var laptop in laptops) {
    print('ID: ${laptop.id}, Name: ${laptop.name}, RAM: ${laptop.ram}');
  }
}
