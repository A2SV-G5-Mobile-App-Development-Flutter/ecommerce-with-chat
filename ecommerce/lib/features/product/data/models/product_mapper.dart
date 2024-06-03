// ignore_for_file: unused_element

import '../../domain/entities/product.dart';
import 'product_model.dart';

extension on ProductModel {
  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
      );
}

extension on Product {
  ProductModel toModel() => ProductModel(
        id: id,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
      );
}
