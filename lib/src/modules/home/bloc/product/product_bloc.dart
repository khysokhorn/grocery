import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/exclusiveOfferModel.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/repository/grocerRepo.dart';
import 'package:http/http.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GrocerRepo repo;
  int qty = 1;

  ProductBloc(this.repo, this.qty) : super(ProductInitialState());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    print("==> init get product");
    yield ProductInitialState();
    print("==> init get product");
    if (event is GetProductEvent) {
      print("==> res product loading");
      yield ProductLoadingState();
      Response? response = await repo.getProductList();
      if (response == null) {
        yield ProductErrorState(errorMessage: "Something went wrong");
      } else {
        if (response.statusCode == 200) {
          var productModel = productItemFromJson(response.body);
          yield ProductLoadedSuccessState(productItem: productModel);
        } else
          yield ProductErrorState(errorMessage: "Error");
      }
    } else if (event is QtyInCreaseEvent) {
      print("==> qty event increase ${event.num}");
      qty = event.num + qty;
      yield QtyState(qty: qty);
    } else if (event is QtyDeCreaseEvent) {
      print("==> qty event decrease ${event.num}");
      qty = event.num + qty;
      yield QtyState(qty: qty);
    } else if (event is ProductAddToCartEvent) {
      yield AddToCartLoadingState();
      print("==> add to cart event ${event.qty} id ${event.productID}");
      await Future.delayed(Duration(seconds: 2));
      yield AddToCartFailState(error: "There is something wrong with API");
      //Response? response = await repo.postAddToCart(event.productID, event.qty);
      // if (response == null) {
      //   yield ProductErrorState(errorMessage: "Something went wrong");
      // } else {
      //   if (response.statusCode == 200) {
      //     var result = addToCartResModelFromJson(response.body);
      //
      //     yield AddToCartSuccessState(result: result.result);
      //   } else
      //     yield ProductErrorState(errorMessage: "Error");
      // }
    } else if (event is ProductExclusiveOfferEvent) {
      yield GetProductExclusiveOfferLoading();
      Response? response = await repo.getProductExclusiveOffer();
      Response? resCategory = await repo.getProductCategories();
      if (response!.statusCode == 200) {
        var exclusiveResult = exclusiveProductModelFromJson(response.body);
        print(
            "===> 🥰 product exclusive ${exclusiveResult.result!.items!.map((e)
            => print("==> item ${e.barcode}"))}");
        yield GetProductExclusiveOfferSuccess(
            exclusiveResultModel: exclusiveResult);
      } else {
        yield GetProductExclusiveOfferError(
            errorMessage: "Something went wrong");
      }
    }
  }
}
