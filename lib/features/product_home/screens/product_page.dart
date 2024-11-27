import 'package:ecommerce_task/features/cart/cart.dart';
import 'package:ecommerce_task/features/product_home/product_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'product_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProductView();
  }
}
