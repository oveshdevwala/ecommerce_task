// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  final CartStatus status;
  final List<ProductModelBox> cartItems;
  final double totalPrice;
  final double totalDiscount;
  final String? error;
  const CartState({
    required this.status,
    this.cartItems = const [],
    this.totalPrice = 0,
    this.totalDiscount = 0,
    this.error,
  });

  CartState copyWith({
    CartStatus? status,
    List<ProductModelBox>? cartItems,
    double? totalPrice,
    double? totalDiscount,
    String? error,
  }) {
    return CartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props =>
      [status, cartItems, totalPrice, totalDiscount, error];
}
