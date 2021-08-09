import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/home/bloc/product/product_bloc.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/repository/grocerRepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, ProductState> {
  CategoryBloc(this.repo) : super(ProductInitialState());
  final GrocerRepo repo;
  @override
  Stream<ProductState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetCategoryEvent) {
      yield GetProductCategoryLoadingState();
      Response? response = await repo.getProductCategories();
      if (response!.statusCode == 200) {
        print("===> Category res ${response.body}");
        var categories = categoryModelFromJson(response.body);
        yield GetProductCategorySuccess(categories: categories);
      } else {
        yield GetProductCategoryError(errorMessage: "Something went wrong");
      }
    }
  }
}
