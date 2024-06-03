import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product_model.dart';
import 'local_data_source.dart';

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences _sharedPreferences;

  ProductLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<void> cacheProduct(ProductModel product) {
    // TODO: implement cacheProduct
    throw UnimplementedError();
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) {
    // TODO: implement cacheProducts
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
