import 'dart:async';
import 'dart:io';
import 'package:ecommerce_task/features/product_home/models/model.dart';
import 'package:ecommerce_task/features/product_home/models/products_model.dart';
import 'package:ecommerce_task/features/product_home/product_repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_home_events.dart';
part 'product_home_state.dart';

class ProductHomeBloc extends Bloc<ProductHomeEvent, ProductHomeState> {
  final ProductRepository _productRepository;
  ProductHomeBloc(ProductRepository productRepository)
      : _productRepository = productRepository,
        super(const ProductHomeState(
          status: ProductHomeStatus.initial,
        )) {
    on<ProductHomeFetchEvents>(_productFetchEvent);
    on<ProductFetchBySearchEvent>(_productFetchBySearchEvent);
  }

  FutureOr<void> _productFetchEvent(
      ProductHomeFetchEvents event, Emitter<ProductHomeState> emit) async {
    emit(state.copyWith(status: ProductHomeStatus.loading));
    try {
      final ProductsModel product = await _productRepository.getProducts();
      if (product.products!.isNotEmpty) {
        emit(state.copyWith(
            status: ProductHomeStatus.success, products: product));
      } else {
        debugPrint('Products Not Found From API');
        emit(state.copyWith(
            status: ProductHomeStatus.failure, error: 'Products Not Found'));
      }
    } on SocketException catch (e) {
      emit(state.copyWith(status: ProductHomeStatus.failure, error: e.message));
    } on Exception catch (e) {
      emit(state.copyWith(
          status: ProductHomeStatus.failure, error: e.toString()));
    } catch (e) {
      emit(state.copyWith(
          status: ProductHomeStatus.failure, error: e.toString()));
    }
  }

  FutureOr<void> _productFetchBySearchEvent(
      ProductFetchBySearchEvent event, Emitter<ProductHomeState> emit) async {
    if (state.status == ProductHomeStatus.success) {
      List<ProductModel> filteredList = state.products!.products!
          .where((element) =>
              (element.title ?? "")
                  .toLowerCase()
                  .contains(event.query.toLowerCase()) ||
              (element.description ?? "")
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();

      if (event.query.isNotEmpty) {
        emit(state.copyWith(
            searchedProducts:
                ProductsModel(filteredList, filteredList.length, 0, 30)));
      }
    }
  }
}
