part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}
// get product event
class GetProductEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// qty event
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

// product add to cart event
class ProductAddToCartEvent extends ProductEvent {
  final int productID;
  final int qty;

  ProductAddToCartEvent({required this.productID, required this.qty});

  @override
  List<Object?> get props => [productID, qty];
}

// Exclusive product event

class ProductExclusiveOfferEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

// get category event

class GetProductCategoryEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
