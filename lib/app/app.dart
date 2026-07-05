import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/features/product/bloc/product_list_bloc.dart';
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
        create: (_) => ProductListBloc(getProducts),
        child: const ProductListScreen(),
      ),
    );
  }
}
