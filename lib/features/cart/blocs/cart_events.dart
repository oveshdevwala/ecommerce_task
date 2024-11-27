part of 'cart_bloc.dart';

/// Enum for cart events
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartFetchItemEvent extends CartEvent {}

class CartAddItemEvent extends CartEvent {
  final CartItemModel item;

  const CartAddItemEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class CartRemoveItemEvent extends CartEvent {
  final int itemId; 

  const CartRemoveItemEvent(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class CartItemQuantityIncrementEvent extends CartEvent {
  final int itemId;

  const CartItemQuantityIncrementEvent(this.itemId);
  @override
  List<Object?> get props => [itemId];
}
class CartItemQuantityDecrementEvent extends CartEvent {
  final int itemId;

  const CartItemQuantityDecrementEvent (this.itemId);
  @override
  List<Object?> get props => [itemId];
}
