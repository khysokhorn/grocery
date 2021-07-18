import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/subcategory/categoryDetailView.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';
import 'package:grocery/src/utils/ui/ui_utils.dart';
import 'package:grocery/src/widgets/widgets.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          exploreAppBar(context, size),
          SliverToBoxAdapter(
            child: Container(
             // search
              margin: const EdgeInsets.all(appDmPrimary),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: appDmPrimary * 1.5,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                crossAxisSpacing: appDmPrimary * 1.5,
                mainAxisSpacing: appDmPrimary * 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    borderRadius: appInweekRadius(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CategoryDetailView(

                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: containerBKDecore(),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(appDmPrimary),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: appImgNetFadeIn(
                                  url:
                                      "https://www.pikpng.com/pngl/b/211-2113083_transparent-background-strawberry-png-clipart.png",
                                ),
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
                childCount: 15,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: appDmPrimary,
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar exploreAppBar(BuildContext context, Size size) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
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
          color: Colors.black54,
        ),
      ),
      centerTitle: true,
    );
  }
}
