import 'package:ecommerce_task/core/theme/colors_scheme.dart';
import 'package:ecommerce_task/core/utilies/discounted_price_calculator.dart';
import 'package:ecommerce_task/core/utilies/review_avg_calculator.dart';
import 'package:ecommerce_task/features/cart/cart.dart';
import 'package:ecommerce_task/features/product_home/models/model.dart';
import 'package:ecommerce_task/features/product_home/product_home.dart';
import 'package:ecommerce_task/injectable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  static Route<void> route(ProductModel product) => PageTransition(
        child: ProductDetailsView(
          product: product,
        ),
        type: PageTransitionType.size,
        childCurrent: const ProductPage(),
        alignment: Alignment.center,
      );
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          product.title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductImageWidget(product: product),
                Padding(
                  padding: const EdgeInsets.all(12.0).r,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title!, style: theme.titleLarge),
                      _Tags(product: product),
                      _ReviewsTiles(product: product),
                      _Description(product: product),
                      _StockAvaliable(product: product),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius:
                BorderRadius.vertical(top: const Radius.circular(12).r)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '₹ ${discountedPrice(product.price!, product.discountPercentage!)}',
                      style: theme.titleLarge,
                    ),
                    Text(
                      '₹ ${(product.price!)}',
                      style: theme.labelSmall!.copyWith(
                          color: AppColors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 1.5,
                          decorationColor: AppColors.black),
                    ),
                  ],
                ),
              ),
              BlocSelector<CartBloc, CartState, bool>(
                selector: (state) {
                  for (var each in state.cartItems) {
                    if (each.productId == product.id!) {
                      return true;
                    }
                  }
                  return false;
                },
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        if (!state) {
                          getIt<CartBloc>()
                              .add(CartAddItemEvent(CartItemModel(product, 1)));
                        } else {
                          Navigator.push(context, CartPage.route());
                        }
                      },
                      
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state ? 'Check Cart' : 'Add To Cart',
                          style: theme.titleMedium!
                              .copyWith(color: AppColors.white),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockAvaliable extends StatelessWidget {
  const _StockAvaliable({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    if (product.sku != null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text('${product.stock} Stock Avaliable',
              style: theme.bodySmall!.copyWith(color: AppColors.white)),
        ),
      );
    }
    return const SizedBox();
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    if (product.tags != null) {
      return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: product.tags!
              .map((e) => DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8).r,
                      color: AppColors.grey200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      child: Text(
                        e,
                        style: theme.bodySmall,
                      ),
                    ),
                  ))
              .toList());
    }
    return const SizedBox();
  }
}

class _Description extends StatelessWidget {
  const _Description({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.description != null)
          Text(
            'Description',
            style: theme.titleMedium,
          ),
        if (product.description != null)
          Text(
            product.description!,
            style: theme.labelSmall,
          ),
      ],
    );
  }
}

class _ReviewsTiles extends StatelessWidget {
  const _ReviewsTiles({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
      collapsedBackgroundColor: AppColors.grey200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
      title: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.white,
                    size: 20,
                  ),
                  5.horizontalSpace,
                  Text(
                    reviewAvgCal(product.reviews),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          5.horizontalSpace,
          Text(
            '(${product.reviews!.length} Review)',
            style: theme.labelSmall!.copyWith(color: AppColors.blueGrey),
          ),
        ],
      ),
      children: product.reviews!
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12).r),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12).w,
                tileColor: AppColors.grey100,
                leading: const Icon(CupertinoIcons.profile_circled),
                trailing: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppColors.grey200,
                      borderRadius: BorderRadius.circular(8).r),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          e!.rating.toString(),
                          style: theme.titleSmall,
                        ),
                        5.horizontalSpace,
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade800,
                          size: 17.w,
                        ),
                      ],
                    ),
                  ),
                ),
                title: Text(
                  e.reviewerName!,
                  style: theme.titleSmall,
                ),
                subtitle: Text(
                  e.comment!,
                  style: theme.labelSmall,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProductImageWidget extends StatelessWidget {
  const _ProductImageWidget({
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            // color: AppColors.grey100,
            borderRadius: BorderRadius.circular(12).r),
        child: SizedBox(
          // height: 300,
          width: 1.sw,
          child: product.images!.length != 1
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: product.images!
                          .map((e) => ImageTile(
                                url: e,
                              ))
                          .toList()),
                )
              : ImageTile(
                  url: product.images!.first,
                ),
        ),
      ),
    );
  }
}
