import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onProductSelected;

  const ProductCard(
      {super.key, required this.product, required this.onProductSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onProductSelected(product);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            // Image
            SizedBox(
              height: 150,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            // Product Details
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Name and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name,
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                          '\$${product.price.toString()}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Description and rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.description,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Theme.of(context).hintColor),
                        ),
                        Icon(Icons.star, color: Colors.yellow[400], size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
