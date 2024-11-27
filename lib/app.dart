import 'package:ecommerce_task/core/theme/app_theme.dart';
import 'package:ecommerce_task/features/cart/blocs/cart_bloc.dart';
import 'package:ecommerce_task/features/product_home/blocs/product_home_bloc.dart';
import 'package:ecommerce_task/features/product_home/screens/product_page.dart';
import 'package:ecommerce_task/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductHomeBloc>(
          create: (context) =>
              getIt<ProductHomeBloc>()..add(ProductHomeFetchEvents()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => getIt<CartBloc>()..add(CartFetchItemEvent()),
        ),
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          home: const ProductPage(),
        );
      }),
    );
  }
}
