import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/repository/grocerRepo.dart';
import 'package:http/http.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GrocerRepo repo;

  ProductBloc(this.repo) : super(ProductInitialState());

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
    }
  }
}
