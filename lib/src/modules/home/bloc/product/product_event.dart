part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QtyInCreaseEvent extends ProductEvent {
  final int num;

  QtyInCreaseEvent({required this.num});

  @override
  List<Object?> get props => [num];
}

class QtyDeCreaseEvent extends ProductEvent {
  final int num;

  QtyDeCreaseEvent({required this.num});

  @override
  List<Object?> get props => [num];
}

class ProductAddToCartEvent extends ProductEvent {
  final int productID;
  final int qty;

  ProductAddToCartEvent({required this.productID, required this.qty});

  @override
  List<Object?> get props => [productID, qty];
}
