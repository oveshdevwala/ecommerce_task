// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_task/di/app_modules.dart' as _i82;
import 'package:ecommerce_task/features/cart/cart.dart' as _i45;
import 'package:ecommerce_task/features/product_home/product_home.dart'
    as _i993;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModules = _$AppModules();
    gh.lazySingleton<_i361.Dio>(() => appModules.dio);
    gh.lazySingleton<_i993.ProductRepository>(
        () => appModules.productRepository);
    gh.lazySingleton<_i45.CartBloc>(() => appModules.cartBloc);
    gh.lazySingleton<_i993.ProductHomeBloc>(() => appModules.productHomeBloc);
    return this;
  }
}

class _$AppModules extends _i82.AppModules {}
