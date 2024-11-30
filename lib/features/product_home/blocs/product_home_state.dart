// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_home_bloc.dart';

enum ProductHomeStatus { initial, loading, success, failure }

class ProductHomeState extends Equatable {
  const ProductHomeState({
    required this.status,
    this.error,
    this.products,
    this.searchedProducts,
    this.query,
  });

  final ProductHomeStatus status;
  final String? error;
  final ProductsModel? products;
  final ProductsModel? searchedProducts;
  final String? query;
  @override
  List<Object?> get props => [status, error, products, searchedProducts,query];

  ProductHomeState copyWith({
    ProductHomeStatus? status,
    String? error,
    ProductsModel? products,
    ProductsModel? searchedProducts,
    String? query,
  }) {
    return ProductHomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      products: products ?? this.products,
      searchedProducts: searchedProducts ?? this.searchedProducts,
      query: query ?? this.query,
    );
  }
}
