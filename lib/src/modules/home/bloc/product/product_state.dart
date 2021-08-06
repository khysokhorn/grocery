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

// exclusive product
class GetProductExclusiveOfferSuccess extends ProductState {
  final ExclusiveProductModel exclusiveResultModel;

  GetProductExclusiveOfferSuccess({required this.exclusiveResultModel});

  @override
  List<Object?> get props => [exclusiveResultModel];
}

class GetProductExclusiveOfferLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class GetProductExclusiveOfferError extends ProductState {
  final String errorMessage;

  GetProductExclusiveOfferError({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
// ===> end exclusive product

// product category
class GetProductCategorySuccess extends ProductState {
  final List<CategoryModel> categories;

  GetProductCategorySuccess({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class GetProductCategoryError extends ProductState {
  final String errorMessage;

  GetProductCategoryError({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class GetProductCategoryLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// ===> end product category
