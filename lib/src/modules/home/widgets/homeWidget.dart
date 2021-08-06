import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/constants/assets_path.dart';
import 'package:grocery/src/modules/home/bloc/product/product_bloc.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/exclusiveOfferModel.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';
import 'package:grocery/src/widgets/widgets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: containerBKDecore(),
        padding: const EdgeInsets.symmetric(
          horizontal: appDmPrimary,
          vertical: 2,
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            border: InputBorder.none,
            hintText: "Search",
            icon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(appDmPrimary - 5),
          margin: EdgeInsets.symmetric(horizontal: appDmPrimary / 2),
          alignment: Alignment.center,
          decoration: containerBKDecore()..copyWith(color: Colors.red),
          child: FadeImage(
            imageUrl: imageUrl,
          ),
        ),
        SizedBox(
          height: appDmPrimary,
        ),
        Text("$title")
      ],
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: containerBKDecore(),
        height: appDmBannerHeight,
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
                child: AppFadImage(
                  url: apImgBanner,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<CategoryModel>? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      child: ListView.builder(
        itemCount: category!.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var model = category![index];
          return CategoryWidget(title: model.name!, imageUrl: "");
        },
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
          "$title",
          style: titleStyle(),
        ),
        TextButton(
          onPressed: () => seeAllOnClick,
          child: Text("$btnTitle"),
        )
      ],
    );
  }
}

class GroceryItemWidget extends StatelessWidget {
  const GroceryItemWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(appDmPrimary / 2),
      height: size.height * 0.20,
      padding: const EdgeInsets.all(appDmPrimary),
      decoration: containerDecoration(),
      child: Row(
        children: [
          Image.asset(
            'asset/images/apple.png',
            width: 95,
            height: 95,
          ),
          SizedBox(
            width: appDmPrimary,
          ),
          Text("Title"),
          SizedBox(
            width: appDmPrimary,
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.size,
    required this.itemOnClick,
    required this.addToCartOnClick,
    required this.productResultModel,
  }) : super(key: key);

  final Size size;
  final ProductExclusiveItemModel productResultModel;
  final Function(String id) itemOnClick;
  final Function(String productID) addToCartOnClick;

  @override
  Widget build(BuildContext context) {
    Size itemSize = ItemSize(height: size.height, width: size.width);

    return Container(
      margin: const EdgeInsets.all(appDmPrimary / 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(appDmPrimary),
        radius: appDmPrimary,
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return ProductDetailView(
          //         productResultModel: productResultModel,
          //       );
          //     },
          //   ),
          // );
          return itemOnClick('id');
        },
        child: Container(
          decoration: containerDecoration()
            ..copyWith(color: Colors.transparent),
          width: itemSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(appDmPrimary),
                child: FadeImageCart(
                  height: itemSize.height * 0.5,
                  imageUrl: productResultModel.thumbnail!,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: appDmPrimary,
                    left: appDmPrimary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          productResultModel.name!,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "${productResultModel.quantity}, ${productResultModel.packaging}",
                        style: GoogleFonts.khula(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: appDmPrimary),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${productResultModel.price}\$',
                                  style: GoogleFonts.khula(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {},
                                  child: Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration containerDecoration() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.1),
    borderRadius: BorderRadius.circular(
      appDmPrimary,
    ),
  );
}

// product detail
class QtyAddOrRemoveToCart extends StatefulWidget {
  const QtyAddOrRemoveToCart({
    Key? key,
    required this.qtyCallBack,
  }) : super(key: key);
  final Function(int qty) qtyCallBack;

  @override
  _QtyAddOrRemoveToCartState createState() => _QtyAddOrRemoveToCartState();
}

class _QtyAddOrRemoveToCartState extends State<QtyAddOrRemoveToCart> {
  int itemQty = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is QtyState) {
          itemQty = state.qty;
        }
        return AddAndRemove(
          num: itemQty,
          onDecrease: () {
            if (state is QtyState) if (state.qty > 1) {
              context.read<ProductBloc>().add(
                    QtyDeCreaseEvent(
                      num: -1,
                    ),
                  );
            }
          },
          onIncrease: () {
            context.read<ProductBloc>().add(
                  QtyInCreaseEvent(
                    num: 1,
                  ),
                );
          },
        );
      },
    );
  }
}

// submit data to cart
class BtnSubmitDataToCart extends StatelessWidget {
  const BtnSubmitDataToCart({
    Key? key,
    required this.size,
    required this.qty,
    required this.widget,
  }) : super(key: key);

  final Size size;
  final int qty;
  final ProductDetailView widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Container(
          decoration: shadowContaianerdecore(),
          width: size.width,
          padding: const EdgeInsets.all(appDmPrimary / 2),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppConstrant.appColorLightBlack,
                    ),
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppConstrant.appColorLightBlack,
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: appDmPrimary),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: appDmPrimary - 10),
                  child: Stack(
                    children: [
                      BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (!(state is AddToCartLoadingState))
                            return Container(
                              width: size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  print("item have click add to cart ");
                                  print("====> qty $qty");
                                  context.read<ProductBloc>().add(
                                        ProductAddToCartEvent(
                                          productID:
                                              widget.productResultModel.id!,
                                          qty: qty,
                                        ),
                                      );
                                },
                                child: Text("Add To Cart"),
                              ),
                            );
                          return SizedBox.shrink();
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            if (state is AddToCartLoadingState)
                              return CircularProgressIndicator();
                            return SizedBox.shrink();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({
    Key? key,
    required this.widget,
    required this.size,
  }) : super(key: key);

  final ProductDetailView widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.zoomBackground,
        ],
        background: SafeArea(
          child: Container(
              margin: const EdgeInsets.all(appDmPrimary * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(appDmPrimary),
                  bottomRight: Radius.circular(appDmPrimary),
                ),
              ),
              child: AppFadImage(
                url: widget.productResultModel.imageUrl!,
              )),
        ),
      ),
      backgroundColor: AppConstrant.appImageBackground,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppConstrant.appColorBlack,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: AppConstrant.appColorBlack,
          ),
        ),
      ],
      expandedHeight: size.height * 0.30,
    );
  }
}

TextStyle titleStyle() {
  return GoogleFonts.khula(
      color: AppConstrant.appColorBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16);
}
