import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product/data/data_sources/local/local_data_source.dart';
import 'package:ecommerce/features/product/data/data_sources/remote/remote_data_source.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ProductRemoteDataSource>(as: #MockProductRemoteDataSource),
  MockSpec<ProductLocalDataSource>(as: #MockProductLocalDataSource),
  MockSpec<NetworkInfo>(as: #MockNetworkInfo),
])
void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late ProductRepositoryImpl productRepository;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    productRepository = ProductRepositoryImpl(
        networkInfo: mockNetworkInfo,
        remoteDataSource: mockProductRemoteDataSource,
        localDataSource: mockProductLocalDataSource);
  });

  const tProductId = 'id';
  const tProduct = ProductModel(
      id: tProductId,
      name: 'name',
      description: 'description',
      price: 123.45,
      imageUrl: 'https://product.image.com/id');
  const tProducts = [tProduct];

  group('when network is available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    group('getProducts', () {
      test('should get products from remote data source', () async {
        when(mockProductRemoteDataSource.getProducts())
            .thenAnswer((_) async => tProducts);

        final result = await productRepository.getProducts();

        expect(result, const Right(tProducts));
        verify(mockProductRemoteDataSource.getProducts());
      });

      test('should cache products from remote data source', () async {
        when(mockProductRemoteDataSource.getProducts())
            .thenAnswer((_) async => tProducts);

        await productRepository.getProducts();

        verify(mockProductRemoteDataSource.getProducts());
        verify(mockProductLocalDataSource.cacheProducts(tProducts));
      });
    });
  });

  group('when network is not available', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    group('getProducts', () {
      test('should get products from local data source', () async {
        when(mockProductLocalDataSource.getProducts())
            .thenAnswer((_) async => tProducts);

        final result = await productRepository.getProducts();

        expect(result, const Right(tProducts));
        verify(mockProductLocalDataSource.getProducts());
      });

      test('should not call remote data source', () async {
        await productRepository.getProducts();

        verifyZeroInteractions(mockProductRemoteDataSource);
      });
    });
  });
}
