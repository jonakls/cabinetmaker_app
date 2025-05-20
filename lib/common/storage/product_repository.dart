import 'package:cabinetmaker_app/common/model_repository.dart';
import 'package:cabinetmaker_app/model/product_model.dart';

class ProductRepository implements ModelRepository<ProductModel> {
  final Map<String, ProductModel> _productMap = {};

  @override
  void add(ProductModel object) {
    _productMap[object.id] = object;
  }

  @override
  void clear() {
    _productMap.clear();
  }

  @override
  ProductModel? findByEmail(String email) {
    return _productMap[email];
  }

  @override
  ProductModel? findById(String id) {
    return _productMap[id];
  }

  @override
  void remove(ProductModel object) {
    _productMap.remove(object.id);
  }

  @override
  void update(ProductModel object) {
    _productMap[object.id] = object;
  }


}