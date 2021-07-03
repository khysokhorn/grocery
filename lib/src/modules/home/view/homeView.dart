import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/cartView.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';
import 'package:grocery/src/utils/ui/ui_utils.dart';
import 'package:grocery/src/widgets/widgets.dart';

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
    List<String> banners = ["", "", "", ""];
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(
          appDmPrimary,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              title: Text(
                "Location",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppConstrant.appColorBlack,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CartView();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: AppConstrant.appColorBlack,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(child: search()),
            SliverToBoxAdapter(
              child: banner(size),
            ),
            // slider
            // SliverToBoxAdapter(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       enlargeCenterPage: true,
            //       enableInfiniteScroll: true,
            //       autoPlay: false,
            //       height: 1,
            //       scrollPhysics: BouncingScrollPhysics(),
            //     ),
            //     items: banners
            //         .map(
            //           (e) => Container(
            //             decoration: containerBKDecore(),
            //             child: Row(
            //               children: [
            //                 Expanded(
            //                   child: Container(
            //                     margin: const EdgeInsets.all(appDmPrimary - 10),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Text(
            //                           "Enjoy the special offer up to 30%",
            //                           textAlign: TextAlign.center,
            //                           style: TextStyle(color: Colors.black, fontSize: 18),
            //                         ),
            //                         const SizedBox(
            //                           height: appDmPrimary - 5,
            //                         ),
            //                         Text(
            //                           "26-30 April 2021",
            //                           style: TextStyle(color: Colors.grey),
            //                           textAlign: TextAlign.center,
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Image.network(
            //                     'https://www.myfamilyfirstchiro.com/wp-content/uploads/2016/06/Fresh-Vegetables.jpg',
            //                     fit: BoxFit.cover,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // )
            SliverToBoxAdapter(
              child: categoriesList(categories, homeWidget),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exclusive Offer",
                    style: appTitleStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ExploreView();
                      }));
                    },
                    child: Text("See All"),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.3,
                child: productLists(size),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: appTitleStyle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("See All"),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.3,
                child: productLists(size),
              ),
            ),
            // end content
            SliverToBoxAdapter(
              child: SizedBox(
                height: size.height * 0.15,
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView productLists(Size size) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: appDmPrimary - 5,
          ),
          decoration: containerBKDecore().copyWith(
            color: Colors.grey.withOpacity(0.06),
          ),
          child: InkWell(
            borderRadius: appInweekRadius(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductDetailView();
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    child: appImgNetFadeIn(
                      url:
                          "https://www.myfamilyfirstchiro.com/wp-content/uploads/2016/06/Fresh-Vegetables.jpg",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(appDmPrimary),
                      topRight: Radius.circular(appDmPrimary),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(appDmPrimary),
                  width: size.width * 0.5,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Broccoli",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: appDmPrimary - 10,
                          ),
                          Text("\$4.99")
                        ],
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                )
              ],
            ),
          ),
        );
      },
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartView();
                },
              ),
            );
          },
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

  Container banner(Size size) {
    return Container(
      decoration: containerBKDecore(),
      margin: const EdgeInsets.symmetric(vertical: appDmPrimary),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(appDmPrimary - 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enjoy the special offer up to 30%",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: appDmPrimary - 5,
                  ),
                  Text(
                    "26-30 April 2021",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(appDmPrimary),
                bottomRight: Radius.circular(appDmPrimary),
              ),
              clipBehavior: Clip.hardEdge,
              child: appImgNetFadeIn(
                url:
                    "https://www.myfamilyfirstchiro.com/wp-content/uploads/2016/06/Fresh-Vegetables.jpg",
              ),
            ),
          )
        ],
      ),
    );
  }
}
