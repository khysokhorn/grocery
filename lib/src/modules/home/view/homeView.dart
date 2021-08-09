import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/cartView.dart';
import 'package:grocery/src/modules/favorite/view/favoriteView.dart';
import 'package:grocery/src/modules/home/bloc/category/category_bloc.dart';
import 'package:grocery/src/modules/home/bloc/product/product_bloc.dart';
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
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ProductBloc>(
                create: (BuildContext context) =>
                    ProductBloc(context.read<GrocerRepo>(), 0),
              ),
              BlocProvider<CategoryBloc>(
                create: (BuildContext context) =>
                    CategoryBloc(context.read<GrocerRepo>()),
              ),
            ],
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
                  CategoryProduct(),
                  // exclusive with see all
                  TittleWithSeeAllSliver(
                    title: "Exclusive offer",
                  ),
                  // list of exclusive
                  ExclusiveOfferList(itemSize: itemSize, size: size),
                  // best with see all
                  TittleWithSeeAllSliver(title: "Best Sell"),
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
                  TittleWithSeeAllSliver(title: "Groceries"),
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

class TittleWithSeeAllSliver extends StatelessWidget {
  const TittleWithSeeAllSliver({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TittleWithSeeAll(
        title: title,
        btnTitle: "See All",
        seeAllOnClick: () {},
      ),
    );
  }
}

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>()..add(GetCategoryEvent());
    return SliverToBoxAdapter(
      child: BlocBuilder<CategoryBloc, ProductState>(
        builder: (context, state) {
          print("=====> category state $state");
          if (state is GetProductCategorySuccess) {
            print("category state success  ${state.categories}");
            return HomeCategory(
              category: state.categories,
            );
          } else if (state is GetProductCategoryLoadingState) {
            return HomeCategory(category: []);
          } else if (state is GetProductCategoryError) {
            return Text(state.errorMessage);
          } else
            return Text("else ");
        },
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
    context.read<ProductBloc>()..add(ProductExclusiveOfferEvent());
    return SliverToBoxAdapter(
      child: Container(
        height: itemSize.height + appDmPrimary,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is GetProductExclusiveOfferSuccess) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.exclusiveResultModel.result!.items!.length,
                itemBuilder: (context, index) {
                  var model = state.exclusiveResultModel.result!.items![index];
                  return ProductItem(
                    productResultModel: model,
                    size: size,
                    addToCartOnClick: (productID) {
                      print("Product id $productID");
                    },
                    itemOnClick: (productID) {
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


