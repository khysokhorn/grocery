import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/view/categoryDetailView.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeWidget homeWidget = HomeWidget();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        margin: const EdgeInsets.all(appDmPrimary),
        child: Column(
          children: [
            homeWidget.search(TextEditingController()),
            SizedBox(
              height: appDmPrimary,
            ),
            categoryList()
          ],
        ),
      ),
    );
  }

  Expanded categoryList() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: appDmPrimary - 5,
          mainAxisSpacing: appDmPrimary - 5,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CategoryDetailView(
                      categoryTitle: "Fresh Vegetables & Fruits",
                    );
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appDmPrimary - 5),
                color: AppConstrant.appColorGrayCardBG.withOpacity(0.10),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(appDmPrimary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://www.nicepng.com/png/full/6-67893_fruits-vegetables-png-fruits-and-vegetables-png.png',
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(
                        height: appDmPrimary - 5,
                      ),
                      Text(
                        "Fresh Vegetables & Fruits",
                        style: appTitleStyle.copyWith(
                          color: AppConstrant.appColorLightBlack2,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppConstrant.appColorBlack,
        ),
      ),
      title: Text(
        "Explore",
        style: TextStyle(
          color: AppConstrant.appColorBlack,
        ),
      ),
    );
  }
}
