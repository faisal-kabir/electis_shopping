import '../gen/assets.gen.dart';

class Product{
  AssetGenImage photo;
  String name, price;

  Product(this.photo, this.name, this.price);

  static List<Product> allProducts = [
    Product(Assets.camera, 'Sony Alpha 9 Mark III', 'RP 24.500.000'),
    Product(Assets.earphone, 'Mini Sport Earphone', 'RP 749.000'),
    Product(Assets.radio, 'Marshall Action 3', 'RP 5.400.000'),
  ];
}