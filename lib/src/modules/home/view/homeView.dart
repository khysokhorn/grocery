import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/constants/assets_path.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';

import 'exploreView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    HomeWidget homeWidget = HomeWidget();
    Size size = MediaQuery.of(context).size;
    List<String> categories = ['🥩', '🍊', '🧃', '🛍️'];
    return Scaffold(
      appBar: homeAppBar(),
      body: Container(
        margin: const EdgeInsets.all(appDmPrimary),
        child: ListView(
          children: [
            // search
            homeWidget.search(TextEditingController()),
            // banner discount
            banner(size, homeWidget),
            // category
            categoriesList(categories, homeWidget),
            // exclusive offer
            Container(
              margin: EdgeInsets.symmetric(vertical: appDmPrimary * 2),
              child: homeWidget.productList(
                headTitle: "Exclusive Offer",
                leadingButton: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ExploreView();
                      }));
                    },
                    child: Text("See all")),
                size: size,
                categories: categories,
              ),
            ),
            // best selling
            Container(
              margin: EdgeInsets.symmetric(vertical: appDmPrimary * 2),
              child: homeWidget.productList(
                headTitle: "Best Selling",
                leadingButton: TextButton(
                  onPressed: () {},
                  child: Text("See all"),
                ),
                size: size,
                categories: categories,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container categoriesList(List<String> categories, HomeWidget homeWidget) {
    return Container(
      height: (45 + appDmPrimary) * 2,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return homeWidget.categoryItem(emoji: "${categories[index]}");
        },
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.person,
          color: AppConstrant.appColorBlack,
        ),
      ),
      title: Text(
        "Location",
        style: TextStyle(
          color: AppConstrant.appColorBlack,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: AppConstrant.appColorBlack,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: AppConstrant.appColorBlack,
          ),
        ),
        SizedBox(
          width: appDmPrimary,
        ),
      ],
    );
  }

  Container banner(Size size, HomeWidget homeWidget) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: appDmPrimary * 2,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: 140,
            decoration: homeWidget.boxDecoration(),
          ),
          Container(
            margin: const EdgeInsets.all(appDmPrimary * 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enjoy the special offer up to 30 %"),
                    SizedBox(
                      height: appDmPrimary - 10,
                    ),
                    Text(
                      "25-30 April 2021",
                      style: appSubTitle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Image.network(
              appImgCard,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
