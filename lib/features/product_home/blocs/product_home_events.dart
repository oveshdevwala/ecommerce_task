part of 'product_home_bloc.dart';

abstract class ProductHomeEvent extends Equatable {
  const ProductHomeEvent();

  @override
  List<Object> get props => [];
}

class ProductHomeFetchEvents extends ProductHomeEvent {}

class ProductFetchBySearchEvent extends ProductHomeEvent {
  final String query;

  const ProductFetchBySearchEvent(this.query);
  @override
  List<Object> get props => [query];
}
