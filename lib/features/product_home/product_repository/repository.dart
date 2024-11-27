import 'package:dio/dio.dart';
import 'package:ecommerce_task/features/product_home/models/products_model.dart';
import 'package:retrofit/retrofit.dart';

part 'repository.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ProductRepository {
  factory ProductRepository(Dio dio, {String? baseUrl}) = _ProductRepository;

  @GET('/products')
  Future<ProductsModel> getProducts();
}
