class Camera {
  int _id;
  String _brand;
  String _color;
  double _price;

  Camera(this._id, this._brand, this._color, this._price);

  // Getters
  int get id => _id;
  String get brand => _brand;
  String get color => _color;
  double get price => _price;

  // Setters
  set price(double newPrice) => _price = newPrice;
}

void main() {
  Camera c1 = Camera(1, 'Canon', 'Black', 75000);
  Camera c2 = Camera(2, 'Nikon', 'Silver', 85000);
  Camera c3 = Camera(3, 'Sony', 'Gray', 95000);

  List<Camera> cameras = [c1, c2, c3];

  for (var cam in cameras) {
    print('ID: ${cam.id}, Brand: ${cam.brand}, Color: ${cam.color}, Price: ${cam.price}');
  }
}
