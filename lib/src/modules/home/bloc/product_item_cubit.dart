import 'package:bloc/bloc.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/repository/grocerRepo.dart';

class ProductItemCubit extends Cubit<ProductItem?> {
  ProductItemCubit() : super(null);
  GrocerRepo _grocerRepo = GrocerRepo();

  void getProduct() async => emit(await _grocerRepo.getProductItem());
}

class CategoryCubit extends Cubit<List<CategoryModel>?> {
  CategoryCubit() : super(null);
  GrocerRepo _grocerRepo = GrocerRepo();

  void getCategory() async => emit(await _grocerRepo.getCategory());
}
