import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task/core/theme/colors_scheme.dart';
import 'package:ecommerce_task/core/utilies/utilities.dart';
import 'package:ecommerce_task/features/cart/blocs/cart_bloc.dart';
import 'package:ecommerce_task/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18.sp)),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.success) {
            if (state.cartItems.isEmpty) {
              return Center(
                  child: Text(
                'Empty Cart',
                style: Theme.of(context).textTheme.titleLarge,
              ));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: ListTile(
                          onLongPress: () {
                            getIt<CartBloc>().add(CartRemoveItemEvent(item.id));
                          },
                          tileColor: AppColors.grey100,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12).r),
                          leading: SizedBox(
                              width: 60,
                              child: Center(
                                  child: CachedNetworkImage(
                                      imageUrl: item.imageUrl))),
                          title: Text(
                            item.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            maxLines: 2,
                          ),
                          trailing: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.grey200,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      getIt<CartBloc>().add(
                                          CartItemQuantityDecrementEvent(
                                              item.id));
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text(item.quantity.toString()),
                                IconButton(
                                    onPressed: () {
                                      getIt<CartBloc>().add(
                                          CartItemQuantityIncrementEvent(
                                              item.id));
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '₹ ${item.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.red,
                                        fontSize: 10.sp,
                                        decoration: TextDecoration.lineThrough),
                              ),
                              10.horizontalSpace,
                              FittedBox(
                                child: Text(
                                  '₹ ${discountedPrice(item.price, item.discountPercentage)}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state.status == CartStatus.failure) {
            return Center(child: Text(state.error ?? 'Unknown Error'));
          }
          if (state.status == CartStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Text('Loading....');
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.success) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                  color: AppColors.grey200),
              child: SizedBox(
                height: 90,
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Amount',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text('₹${state.totalPrice.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Buy Now')),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
