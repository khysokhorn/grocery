import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/cart/cartView.dart';
import 'package:grocery/src/modules/favorite/view/favoriteView.dart';
import 'package:grocery/src/modules/home/bloc/product_item_cubit.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: appDmPrimary,
          ),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
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
                  )
                ],
              ),
              // search
              SliverToBoxAdapter(
                child: SearchWidget(),
              ),
              // banner
              SliverToBoxAdapter(
                child: HomeBanner(),
              ),
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
                        return Text("hi");
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
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProductItem(
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
                  ),
                ),
              ),
              // best with see all
              SliverToBoxAdapter(
                child: TittleWithSeeAll(
                  title: "Best Sell",
                  btnTitle: "See All",
                  seeAllOnClick: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProductItem(
                        size: size,
                        itemOnClick: (productID) {},
                        addToCartOnClick: (productID) {},
                      );
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
    );
  }
}

