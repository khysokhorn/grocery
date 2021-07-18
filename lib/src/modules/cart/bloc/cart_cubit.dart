import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/cart/model/cartModel.dart';
import 'package:grocery/src/repository/cart/cartRepositoty.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;

  CartCubit(this.cartRepository) : super(CartInitial());

  void getCategory(String userID) async {
    try {
      emit(CartLoading());
      final cart = await cartRepository.getCart(userID);
      print("====> cart data $cart");
      emit(CartSuccess(cart!));
    } catch (e) {
      print("Error with $e");
      emit(CartError(e.toString()));
    }
  }
}
