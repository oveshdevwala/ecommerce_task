import 'dart:async';

import 'package:ecommerce_task/core/object_box/models/product_model_box.dart';
import 'package:ecommerce_task/features/cart/cart.dart';
import 'package:ecommerce_task/main.dart';
import 'package:ecommerce_task/objectbox.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_events.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(const CartState(
          status: CartStatus.initial,
        )) {
    on<CartFetchItemEvent>(_cartFetchItemEvent);
    on<CartAddItemEvent>(_cartAddItemEvent);
    on<CartRemoveItemEvent>(_cartRemoveItemEvent);
    on<CartItemQuantityIncrementEvent>(_cartIncrementEvent);
    on<CartItemQuantityDecrementEvent>(_cartDecrementEvent);
  }

  // Fetch Cart Items
  FutureOr<void> _cartFetchItemEvent(
      CartFetchItemEvent event, Emitter<CartState> emit) async {
    // emit(state.copyWith(status: CartStatus.loading));
    try {
      // Mock fetching cart data (replace with ObjectBox or backend calls).
      await Future.delayed(
          const Duration(milliseconds: 500)); // Simulate delay.
      final projectBox = object;
      final allCart = projectBox.productBox.getAll();
      double totalPrice = 0;
      double totalDiscount = 0; // Example discount value.

      for (var each in allCart) {
        final finalPrice = each.price-(each.price * each.discountPercentage / 100);
        totalPrice +=
           finalPrice * each.quantity;
        totalDiscount += each.discountPercentage;
      }
      emit(state.copyWith(
        status: CartStatus.success,
        cartItems: allCart,
        totalPrice: totalPrice,
        totalDiscount: totalDiscount / allCart.length,
      ));
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, error: e.toString()));
    }
  }

  // Add Item to Cart
  FutureOr<void> _cartAddItemEvent(
      CartAddItemEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      final item = event.item.product;
      if (!object.productBox.contains(item.id!)) {
        object.productBox.put(
            ProductModelBox(
                productId: item.id!,
                name: item.title!,
                price: item.price!,
                discountPercentage: item.discountPercentage!,
                description: item.description!,
                imageUrl: item.images!.first,
                quantity: 1),
            mode: PutMode.insert);
      } else {
        add(CartItemQuantityIncrementEvent(item.id!));
      }
      add(CartFetchItemEvent());
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, error: e.toString()));
    }
  }

// make working model incriment dicriment of quantity;
  // Remove Item from Cart
  FutureOr<void> _cartRemoveItemEvent(
      CartRemoveItemEvent event, Emitter<CartState> emit) async {
    // emit(state.copyWith(status: CartStatus.loading));
    try {
      object.productBox.remove(event.itemId);
      add(CartFetchItemEvent());
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, error: e.toString()));
    }
  }

  FutureOr<void> _cartIncrementEvent(
      CartItemQuantityIncrementEvent event, Emitter<CartState> emit) async {
    try {
      for (var item in state.cartItems) {
        if (item.id == event.itemId) {
          item.quantity++;
          object.productBox.put(item,
              mode: PutMode.update); // Save the updated item to ObjectBox
          break; // Exit loop after updating
        }
      }
      add(CartFetchItemEvent());
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, error: e.toString()));
    }
  }

  FutureOr<void> _cartDecrementEvent(
      CartItemQuantityDecrementEvent event, Emitter<CartState> emit) async {
    try {
      for (var item in state.cartItems) {
        if (item.id == event.itemId) {
          if (item.quantity != 1) {
            item.quantity--;
            object.productBox.put(item, mode: PutMode.update);
          } else {
            object.productBox.remove(event.itemId);
          }
        }
      }
      add(CartFetchItemEvent());
    } catch (e) {
      emit(state.copyWith(status: CartStatus.failure, error: e.toString()));
    }
  }
}
