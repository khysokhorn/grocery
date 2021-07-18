import 'package:grocery/src/modules/cart/model/cartModel.dart';

abstract class CartInterface {
  Future<CartModel?> getCart(String userID);
}
