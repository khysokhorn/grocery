import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/model/categoryModel.dart';
import 'package:grocery/src/widgets/widgets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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

TextStyle titleStyle() {
  return TextStyle(
    color: AppConstrant.appColorBlack,
    fontWeight: FontWeight.w500,
  );
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
  }) : super(key: key);

  final Size size;
  final Function(String id) itemOnClick;
  final Function(String productID) addToCartOnClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(appDmPrimary / 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(appDmPrimary),
        radius: appDmPrimary,
        onTap: () => itemOnClick("id"),
        child: Container(
          padding: EdgeInsets.all(appDmPrimary),
          decoration: containerDecoration(),
          height: size.height * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FadeImageCart(
                imageUrl:
                    'https://grocerdel.com/assets/uploads/products/51d6df5accc8f53ed4724bf71bddbc90.jpg',
              ),
              Expanded(
                child: Container(
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle(),
                      ),
                      SizedBox(
                        height: appDmPrimary / 2,
                      ),
                      Text(
                        "7pcs, Priceg",
                      ),
                      SizedBox(
                        height: appDmPrimary / 2,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Title",
                              style: titleStyle(),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder()),
                                onPressed: () {
                                  return addToCartOnClick("productID");
                                },
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
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
