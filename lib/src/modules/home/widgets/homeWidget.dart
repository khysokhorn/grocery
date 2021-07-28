import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
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
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      child: ListView.builder(
        itemCount: category.result.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var model = category.result[index];
          return CategoryWidget(title: model.title, imageUrl: model.imageUrl);
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
  final ProductResultModel productResultModel;
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
        onTap: () => itemOnClick("id"),
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
                  imageUrl: productResultModel.imageUrl,
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
                          productResultModel.title,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: GoogleFonts.khula(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "7pcs, ${productResultModel.unit.title}",
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
                                  '${productResultModel.scale[0].itemPrice.price} \$',
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

TextStyle titleStyle() {
  return GoogleFonts.khula(
      color: AppConstrant.appColorBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16);
}
