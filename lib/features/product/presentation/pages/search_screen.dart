import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/features/product/bloc/search_product_bloc.dart';
import 'package:flutter_assignment/features/product/presentation/widgets/product_grid.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<SearchProductBloc>().add(
                  SearchProductQueryChanged(value),
                );
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<SearchProductBloc, SearchProductState>(
              builder: (context, state) {
                if (state is SearchProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SearchProductLoaded) {
                  return ProductGrid(products: state.products);
                }

                if (state is SearchProductEmpty) {
                  return const Center(child: Text('No products found'));
                }

                return const Center(child: Text('Search something'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
