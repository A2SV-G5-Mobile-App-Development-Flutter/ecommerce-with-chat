import '../../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(String id);
  Future<void> deleteProduct(String id);
  Future<void> cacheProduct(List<ProductModel> product);
  Future<void> cacheProducts(List<ProductModel> product);
}
