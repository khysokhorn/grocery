import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/cartView.dart';
import 'package:grocery/src/modules/favorite/view/favoriteView.dart';
import 'package:grocery/src/modules/home/bloc/product/product_bloc.dart';
import 'package:grocery/src/modules/home/bloc/product_item_cubit.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';
import 'package:grocery/src/repository/grocerRepo.dart';
import 'package:grocery/src/utils/services/localServices/hiveHelper.dart';
import 'package:grocery/src/utils/ui/app_dialog.dart';

import '../../../../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ItemSize itemSize = ItemSize(width: size.width, height: size.height);
    AppDialog appDialog = AppDialog(context);
    return Scaffold(
      body: SafeArea(
        child: RepositoryProvider(
          create: (context) => GrocerRepo(),
          child: BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              context.read<GrocerRepo>(),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: appDmPrimary,
              ),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  HomeAppBar(appDialog: appDialog),
                  // search
                  SearchWidget(),
                  // banner
                  HomeBanner(),
                  // category
                  SliverToBoxAdapter(
                    child: BlocProvider<CategoryCubit>(
                        create: (context) => CategoryCubit()..getCategory(),
                        child: BlocBuilder<CategoryCubit, CategoryModel?>(
                          builder: (context, categoryModel) {
                            print("category $categoryModel");
                            if (categoryModel != null) {
                              return HomeCategory(
                                category: categoryModel,
                              );
                            }
                            return Container();
                          },
                        )),
                  ),
                  // exclusive with see all
                  SliverToBoxAdapter(
                    child: TittleWithSeeAll(
                      title: "Exclusive Offer",
                      btnTitle: "See All",
                      seeAllOnClick: () {},
                    ),
                  ),
                  // list of exclusive
                  ExclusiveOfferList(itemSize: itemSize, size: size),
                  // best with see all
                  SliverToBoxAdapter(
                    child: TittleWithSeeAll(
                      title: "Best Sell",
                      btnTitle: "See All",
                      seeAllOnClick: () {},
                    ),
                  ),
                  // list of best sale
                  SliverToBoxAdapter(
                    child: Container(
                      height: itemSize.height + appDmPrimary,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text("best sale");
                          // return ProductItem(
                          //   size: size,
                          //   itemOnClick: (productID) {},
                          //   addToCartOnClick: (productID) {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) {
                          //           return ProductDetailView();
                          //         },
                          //       ),
                          //     );
                          //     print(
                          //       ("item have click "),
                          //     );
                          //   },
                          // );
                        },
                      ),
                    ),
                  ),
                  // category
                  SliverToBoxAdapter(
                    child: TittleWithSeeAll(
                      title: "Groceries",
                      btnTitle: "See All",
                      seeAllOnClick: () {},
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: size.height * 0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GroceryItemWidget(size: size);
                        },
                      ),
                    ),
                  ),
                  // end content
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: appDmPrimary * 2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExclusiveOfferList extends StatelessWidget {
  const ExclusiveOfferList({
    Key? key,
    required this.itemSize,
    required this.size,
  }) : super(key: key);

  final ItemSize itemSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>()..add(GetProductEvent());
    return SliverToBoxAdapter(
      child: Container(
        height: itemSize.height + appDmPrimary,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadedSuccessState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.productItem.result.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    productResultModel: state.productItem.result[index],
                    size: size,
                    addToCartOnClick: (productID) {
                      print("Product id $productID");
                    },
                    itemOnClick: (productID) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailView();
                          },
                        ),
                      );
                      print(
                        ("item have click "),
                      );
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.appDialog,
  }) : super(key: key);

  final AppDialog appDialog;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      title: Text(
        "Grocery Store",
        style: GoogleFonts.gildaDisplay(
          color: HexColor("#4C4F4D"),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FavoriteView();
                },
              ),
            );
          },
          icon: Icon(
            Icons.favorite_border,
            color: AppConstrant.appColorPrimaryColor,
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
            Icons.shopping_cart_outlined,
            color: AppConstrant.appColorPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            appDialog.confirmDialog(() {
              print("log out ");
              // clear data app here
              HiveHelper().deleteUser();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ),
              );
              Navigator.pop(context);
            });
          },
          icon: Icon(
            Icons.login_outlined,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

// bottom navigation item
///  bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.green,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 2,
//               color: AppConstrant.appColorGrayCardBG,
//             ),
//           ],
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(appDmPrimary),
//           ),
//         ),
//         child: BottomNavigationBar(
//           unselectedLabelStyle: GoogleFonts.khula(
//             color: AppConstrant.appColorLightBlack2,
//           ),
//           unselectedIconTheme: IconThemeData(
//             color: AppConstrant.appColorLightBlack2,
//           ),
//           type: BottomNavigationBarType.shifting,
//           items: [
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//           ],
//         ),
//       ),
///
///
