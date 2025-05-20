import 'package:cabinetmaker_app/model/model.dart';

class ProductModel implements Model {
  final String _id;
  String _name;
  String _description;
  String _category;
  String _imageUrl;
  double _price;
  int _stock;

  ProductModel({
    required String id,
    required String name,
    required String description,
    required String category,
    required String imageUrl,
    required double price,
    required int stock,
  }) : _id = id,
       _name = name,
       _description = description,
       _category = category,
       _imageUrl = imageUrl,
       _price = price,
       _stock = stock;

  ProductModel.randomId({
    required String name,
    required String description,
    required String category,
    required String imageUrl,
    required double price,
    required int stock,
  }) : _id = DateTime.now().millisecondsSinceEpoch.toString(),
       _name = name,
       _description = description,
       _category = category,
       _imageUrl = imageUrl,
       _price = price,
       _stock = stock;

  @override
  String get id => _id;

  String get name => _name;

  String get description => _description;

  String get category => _category;

  String get imageUrl => _imageUrl;

  double get price => _price;

  int get stock => _stock;

  set name(String name) => _name = name;

  set description(String description) => _description = description;

  set category(String category) => _category = category;

  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  set price(double price) => _price = price;

  set stock(int stock) => _stock = stock;
}
