import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/product/presentation/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List products;
  final ScrollController? controller;
  final bool isLoadingMore;

  const ProductGrid({
    super.key,
    required this.products,
    this.controller,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        return GridView.builder(
          controller: controller,
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: isSmallScreen ? 0.75 : 0.8,
            crossAxisSpacing: isSmallScreen ? 8 : 16,
            mainAxisSpacing: isSmallScreen ? 8 : 16,
          ),
          itemCount: isLoadingMore ? products.length + 1 : products.length,
          itemBuilder: (context, index) {
            if (index >= products.length) {
              return const Center(child: CircularProgressIndicator());
            }

            return ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}
