// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_home_bloc.dart';

enum ProductHomeStatus { initial, loading, success, failure }

class ProductHomeState extends Equatable {
  const ProductHomeState({
    required this.status,
    this.error,
    this.products,
  });

  final ProductHomeStatus status;
  final String? error;
  final ProductsModel? products;
  @override
  List<Object?> get props => [status, error, products];

  ProductHomeState copyWith({
    ProductHomeStatus? status,
    String? error,
    ProductsModel? products,
  }) {
    return ProductHomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      products: products ?? this.products,
    );
  }
}
