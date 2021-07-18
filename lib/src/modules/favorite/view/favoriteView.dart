import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/widgets/widgets.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

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
                    title: Text(
                      "Favorite",
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
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
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
                                        color: AppConstrant.appColorGrayCardBG
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                          appDmPrimary - 10,
                                        )),
                                    child: Container(
                                      child: Image.network(
                                        'https://www.pikpng.com/pngl/b/211-2113083_transparent-background-strawberry-png-clipart.png',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Strawberry"),
                                      SizedBox(
                                        height: appDmPrimary - 10,
                                      ),
                                      Text(
                                        "335ml, Price",
                                        style: TextStyle(
                                          color: AppConstrant.appColorGrayCardBG
                                              .withOpacity(1),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$1.50",
                                  ),
                                  SizedBox(
                                    width: appDmPrimary / 2,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppConstrant.appColorPrimaryColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      childCount: 10,
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
                  onPressed: () {},
                  child: Text("Add All to Cart"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
