part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CartError extends CartState {
  final String error;

  CartError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class CartSuccess extends CartState {
  final CartModels cartModel;

  CartSuccess(this.cartModel);

  @override
  List<Object> get props => [cartModel];
}
