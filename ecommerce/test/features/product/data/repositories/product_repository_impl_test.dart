import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product/data/data_sources/local/local_data_source.dart';
import 'package:ecommerce/features/product/data/data_sources/remote/remote_data_source.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource, NetworkInfo])
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
}
