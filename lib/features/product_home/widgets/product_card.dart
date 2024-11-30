import 'package:ecommerce_task/core/common/widgets/widget.dart';
import 'package:ecommerce_task/core/theme/colors_scheme.dart';
import 'package:ecommerce_task/features/product_home/screens/product_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task/core/utilies/discounted_price_calculator.dart';
import 'package:ecommerce_task/features/cart/cart.dart';
import 'package:ecommerce_task/features/product_home/models/model.dart';
import 'package:ecommerce_task/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grey100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          Navigator.push(context, ProductDetailsView.route(product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8.0)),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: product.images!.first,
                        fit: BoxFit.cover,
                      ),
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
                      return Positioned(
                        right: 5,
                        bottom: 5,
                        child: IconButton(
                          onPressed: () {
                            if (!state) {
                              getIt<CartBloc>().add(
                                  CartAddItemEvent(CartItemModel(product, 1)));
                            } else {
                              customSnackBar(context, title: 'Already In Cart');
                            }
                          },
                          style: IconButton.styleFrom().copyWith(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsetsDirectional.all(0))),
                          icon: Icon(
                            state
                                ? Icons.remove_shopping_cart_rounded
                                : Icons.add_shopping_cart_rounded,
                            color: AppColors.black,
                            size: 18,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? ' No title',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    maxLines: 1,
                  ),
                  //
                  if (product.brand != null)
                    Text(
                      product.brand!,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "₹${product.price!.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: AppColors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      10.horizontalSpace,
                      Text(
                        "₹${discountedPrice(product.price!, product.discountPercentage!)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "${product.discountPercentage!}% OFF",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
