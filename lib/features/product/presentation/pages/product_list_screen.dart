import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/product/presentation/pages/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/features/product/bloc/product_list_bloc.dart';
import 'package:flutter_assignment/features/product/presentation/widgets/product_grid.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ProductListBloc>().add(LoadProducts());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.9) {
        context.read<ProductListBloc>().add(LoadMoreProducts());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop'), centerTitle: true),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading && state.products == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductListLoaded ||
              (state is ProductListLoading && state.products != null)) {
            final products = state is ProductListLoaded
                ? state.products
                : (state as ProductListLoading).products!;

            final hasReachedMax = state is ProductListLoaded
                ? state.hasReachedMax
                : (state as ProductListLoading).hasReachedMax;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SearchScreen()),
                      );
                    },
                    child: IgnorePointer(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ProductGrid(
                    products: products,
                    controller: _scrollController,
                    isLoadingMore: !hasReachedMax,
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
