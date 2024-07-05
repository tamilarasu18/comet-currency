class Product {
  int? id;
  String? name;
  String? image;
  double? price;
  String? description;

  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
    );
  }
}
