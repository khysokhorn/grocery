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


// add to cart
class AddToCartSuccessState extends ProductState {
  final String result;

  AddToCartSuccessState({required this.result});

  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class AddToCartFailState extends ProductState{
  final String error;

  AddToCartFailState({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class AddToCartLoadingState extends ProductState{
  @override
  List<Object?> get props => [];

}

// end add to cart state





class QtyState extends ProductState {
  final int qty;

  QtyState({required this.qty});

  @override
  List<Object?> get props => [qty];
}
