import 'package:dio/dio.dart';
import 'package:ecommerce_task/features/cart/cart.dart';
import 'package:ecommerce_task/features/product_home/product_home.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModules {
  @lazySingleton
  Dio get dio => Dio();
  //
  @lazySingleton
  ProductRepository get productRepository => ProductRepository(dio);
  //
  @lazySingleton
  CartBloc get cartBloc => CartBloc();
  //
  @lazySingleton
  ProductHomeBloc get productHomeBloc => ProductHomeBloc(productRepository);
}
