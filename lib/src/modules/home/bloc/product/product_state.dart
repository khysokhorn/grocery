part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
  @override
  List<Object> get props => [];
}

class ProductLoadedSuccessState extends ProductState {
  final ProductItem productItem;

  ProductLoadedSuccessState({required this.productItem});

  @override
  // TODO: implement props
  List<Object?> get props => [productItem];
}
