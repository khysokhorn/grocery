import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Checkout",
              style: TextStyle(
                color: AppConstrant.appColorBlack,
              ),
            ),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Delivery Address",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
