import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/repository/baseRequest.dart';
import 'package:http/http.dart';

class GrocerRepo {
  AppBaseRequest _baseRequest = AppBaseRequest();

  Future<ProductItem?> getProductItem() async {
    ProductItem? productItem;
    await _baseRequest.get('/products').then((value) => {
          productItem = productItemFromJson(value),
        });
    return productItem;
  }

  Future<CategoryModel?> getCategory() async {
    CategoryModel? category;
    await _baseRequest
        .get('/categories')
        .then((value) => category = categoryModelFromJson(value));
    return category;
  }

  Future<Response>? getProductList() async {
    var result;
    await _baseRequest.getWithCallBackRes(
        "/products", (response) => result = response);
    return result;
  }
}
