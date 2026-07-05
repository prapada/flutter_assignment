import 'package:flutter_assignment/core/network/dio_client.dart';
import 'package:flutter_assignment/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_assignment/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_assignment/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_assignment/features/product/domain/usecases/get_product_detail.dart';
import 'package:flutter_assignment/features/product/domain/usecases/get_products.dart';
import 'package:flutter_assignment/features/product/domain/usecases/search_products.dart';

final DioClient dioClient = DioClient.create();

final ProductRepository productRepository =
    ProductRepositoryImpl(ProductRemoteDataSourceImpl(dioClient));

final GetProducts getProducts =
    GetProducts(productRepository);

final GetProductDetail getProductDetail =
    GetProductDetail(productRepository);

final SearchProducts searchProducts =
    SearchProducts(productRepository);
