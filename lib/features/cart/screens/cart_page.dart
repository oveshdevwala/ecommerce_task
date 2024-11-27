import 'package:ecommerce_task/features/cart/screens/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static Route<void> route() => PageTransition(
      child: const CartPage(), type: PageTransitionType.rightToLeft);
  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}
