import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/view/productDetail.dart';

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
          decoration: BoxDecoration(
            color: AppConstrant.appColorGrayCardBG,
            shape: BoxShape.circle,
          ),
          child: Text(
            "$emoji",
            style: TextStyle(fontSize: 45),
          ),
        ),
        SizedBox(height: appDmPrimary,),
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

  Container productItem(
      {required BuildContext context,
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
