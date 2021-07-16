import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/cartView.dart';
import 'package:grocery/src/modules/home/bloc/product_item_cubit.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';
import 'package:grocery/src/widgets/widgets.dart';

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
              child: HomeBanner(),
            ),
            SliverToBoxAdapter(
              child: HomeCategory(
                categories: categories,
                homeWidget: homeWidget,
              ),
            ),
           
            SliverToBoxAdapter(
              child: Container(
                height: size.height * 0.3,
                child: BlocProvider<ProductItemCubit>(
                  create: (context) {
                    return ProductItemCubit()..getProduct();
                  },
                  child: BlocBuilder<ProductItemCubit, ProductItem?>(
                    builder: (context, productItem) {
                      if (productItem == null) {
                        return Text("Please wait");
                      } else
                        return ProductList(
                          size: size,
                          productItem: productItem,
                        );
                    },
                  ),
                ),
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
}

class TittleWithSeeAll extends StatelessWidget {
  final String title;
  final String btnTitle;
  final Function seeAllOnClick;

  const TittleWithSeeAll({
    Key? key,
    required this.title,
    required this.btnTitle,
    required this.seeAllOnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Exclusive Offer",
          style: appTitleStyle,
        ),
        TextButton(
          onPressed: () => seeAllOnClick,
          child: Text("$btnTitle"),
        )
      ],
    );
  }
}

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
