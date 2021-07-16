import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';
import 'package:grocery/src/utils/ui/ui_utils.dart';
import 'package:grocery/src/widgets/widgets.dart';

class HomeWidget {
  Container search(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(
        left: appDmPrimary,
        top: appDmPrimary - 10,
        bottom: appDmPrimary - 10,
      ),
      decoration: BoxDecoration(
        color: AppConstrant.appColorGra.withOpacity(0.2),
        borderRadius: BorderRadius.circular(appDmPrimary),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(appDmPrimary),
          border: InputBorder.none,
          hintText: "Search",
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Column categoryItem({required String emoji}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(appDmPrimary - 5),
          margin: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: containerBKDecore()
            ..copyWith(color: Colors.red),
          child: Text(
            "$emoji",
            style: TextStyle(fontSize: 45),
          ),
        ),
        SizedBox(
          height: appDmPrimary,
        ),
        Text("Title")
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(appDmPrimary),
      color: AppConstrant.appColorGra.withOpacity(0.25),
    );
  }

  Container productItem({required BuildContext context,
    required String imageView,
    required String title,
    required String price,
    required Function addToCart}) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: boxDecoration(),
      padding: const EdgeInsets.all(appDmPrimary),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (conttext) {
            return ProductDetailView();
          }));
          print("click");
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$imageView",
              style: TextStyle(fontSize: 75),
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(
                top: appDmPrimary * 3,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$title"),
                      SizedBox(
                        height: appDmPrimary - 10,
                      ),
                      Text(
                        "$price",
                        style: appTitleStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: appDmPrimary,
                  ),
                  ElevatedButton(
                    onPressed: () => addToCart,
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column productList({
    required String headTitle,
    required TextButton leadingButton,
    required Size size,
    required List<String> categories,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$headTitle",
              style: appTitleStyle,
            ),
            leadingButton
          ],
        ),
        Container(
          height: size.height * 0.3,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return productItem(
                imageView: categories[index],
                addToCart: () {},
                price: '\$12 / kg',
                title: 'Title',
                context: context,
              );
            },
          ),
        )
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  final ProductItem productItem;

  const ProductList({
    Key? key,
    required this.size,
    required this.productItem,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: productItem.result.length,
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
                      url: "${productItem.result[index].imageUrl}",
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
                            "${productItem.result[index].title}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: appDmPrimary - 10,
                          ),
                          Text(
                              "\$ ${productItem.result[index].scale[0].itemPrice
                                  .price}")
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
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    Key? key,
    required this.categories,
    required this.homeWidget,
  }) : super(key: key);

  final List<String> categories;
  final HomeWidget homeWidget;

  @override
  Widget build(BuildContext context) {
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
}
