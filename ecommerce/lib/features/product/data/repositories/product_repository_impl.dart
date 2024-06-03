import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';

import '../../domain/repositories/product_repository.dart';
import '../data_sources/local/local_data_source.dart';
import '../data_sources/remote/remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  final ProductLocalDataSource _productLocalDataSource;
  final NetworkInfo _networkInfo;

  ProductRepositoryImpl({
    required networkInfo,
    required remoteDataSource,
    required localDataSource,
  })  : _networkInfo = networkInfo,
        _productRemoteDataSource = remoteDataSource,
        _productLocalDataSource = localDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    if (await _networkInfo.isConnected) {
      final products = await _productRemoteDataSource.getProducts();
      _productLocalDataSource.cacheProducts(products);
      return Right(products);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> createProduct(Product product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
