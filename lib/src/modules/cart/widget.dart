import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/widgets/widgets.dart';

import 'model/cartModel.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);
  final CartModels cartModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var model = cartModel.result.product[index];
          print("===> image ${model.imageUrl}");
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: appDmPrimary - 5,
              horizontal: appDmPrimary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:
                              AppConstrant.appColorGrayCardBG.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            appDmPrimary - 10,
                          )),
                      child: Container(
                        child: Image.network(
                          '${model.imageUrl}',
                          fit: BoxFit.contain,
                        ),
                        margin: const EdgeInsets.all(5),
                        width: 85,
                        height: 85,
                      ),
                    ),
                    SizedBox(
                      width: appDmPrimary,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: appDmPrimary - 10,
                        ),
                        Text(
                          "\$4.99 \ kg",
                          style: TextStyle(
                              color: AppConstrant.appColorGrayCardBG
                                  .withOpacity(1)),
                        ),
                      ],
                    )
                  ],
                ),
                addAndRemove()
              ],
            ),
          );
        },
        childCount: cartModel.result.product.length,
      ),
    );
  }
}
