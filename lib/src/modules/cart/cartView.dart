import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/bloc/cart_cubit.dart';
import 'package:grocery/src/modules/cart/widget.dart';
import 'package:grocery/src/repository/cart/cartRepositoty.dart';
import 'package:grocery/src/widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text("Cart",
                        style: TextStyle(
                          color: AppConstrant.appColorBlack,
                        )),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppConstrant.appColorBlack,
                      ),
                    ),
                    pinned: true,
                    floating: true,
                    snap: true,
                  ),
                  RepositoryProvider(
                    create: (context) => CartRepository(),
                    child: BlocProvider<CartCubit>(
                      create: (context) => CartCubit(
                        context.read<CartRepository>(),
                      )..getCategory("1"),
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          print("state $state");
                          if (state is CartInitial) {
                            return SliverToBoxAdapter(
                              child: Text("init cart"),
                            );
                          } else if (state is CartError) {
                            return SliverToBoxAdapter(
                              child: Text("Error with ${state.error}"),
                            );
                          } else if (state is CartSuccess) {
                            var model = state.cartModel;
                            return CartItem(
                              cartModel: model,
                            );
                          } else
                            return SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator.adaptive(semanticsLabel: "fldskf",),
                              ),
                            );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              child: Container(
                decoration: shadowContaianerdecore(),
                padding: const EdgeInsets.all(appDmPrimary),
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    show(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return CheckOutView();
                    //     },
                    //   ),
                    // );
                  },
                  child: Text("Checkout"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: ,
            child: Column(
              children: [Text("hi"),
              ],
            ),
          );
        });
  }
}
