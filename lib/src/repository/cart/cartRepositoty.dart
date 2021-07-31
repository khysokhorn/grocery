import 'package:grocery/src/modules/cart/model/cartModel.dart';
import 'package:grocery/src/repository/BaseRepository.dart';
import 'package:grocery/src/repository/cart/CartInterface.dart';

class CartRepository extends BaseRepository implements CartInterface {
  @override
  Future<CartModels?> getCart(String userID) async {
    CartModels? cartModel;
    await baseRequest
        .get('/carts')
        .then((value) => cartModel = cartModelFromJson(value));
    return cartModel;
  }
}
