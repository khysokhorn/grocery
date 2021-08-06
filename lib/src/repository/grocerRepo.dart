import 'package:grocery/src/constants/api_path.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/repository/baseRequest.dart';
import 'package:grocery/src/utils/services/localServices/hiveHelper.dart';
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

  Future<List<CategoryModel>?> getCategory() async {
    List<CategoryModel>? category;
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

  Future<Response>? getProductExclusiveOffer() async {
    var result;
    await _baseRequest.getWithCallBackRes(
        "/exclusives", (response) => result = response);
    return result;
  }

  Future<Response>? getProductCategories() async {
    var result;
    await _baseRequest.getWithCallBackRes(
        APICONST.categories, (response) => result = response);
    return result;
  }

  Future<Response>? postAddToCart(int productID, int qty) async {
    var result;
    HiveHelper helper = HiveHelper();
    var model = helper.getUserModel();
    var body = {
      "user_id": model!.user!.id,
      "product_id": productID,
      "qty": qty
    };
    await _baseRequest.post1(
      "/carts",
      body,
      (response) => {result = response},
    );
    return result;
  }
}
