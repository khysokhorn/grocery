import 'package:grocery/src/modules/cart/model/cartModel.dart';

abstract class CartInterface {
  Future<CartModels?> getCart(String userID);
}
