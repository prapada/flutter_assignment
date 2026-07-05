import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/features/product/bloc/product_list_bloc.dart';
import 'package:flutter_assignment/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_assignment/features/product/domain/usecases/get_products.dart';
import 'package:flutter_assignment/features/product/presentation/pages/product_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => _createProductListBloc(),
        child: const ProductListScreen(),
      ),
    );
  }

  ProductListBloc _createProductListBloc() {
    // Dependency Injection
    final dioClient = DioClient.create();
    final productRemoteDataSource = ProductRemoteDataSourceImpl(dioClient);
    final productRepository = ProductRepositoryImpl(productRemoteDataSource);
    final getProducts = GetProducts(productRepository);
    
    return ProductListBloc(getProducts);
  }
}