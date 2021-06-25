import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  HomeWidget homeWidget = HomeWidget();
  List<String> categories = ['🥩', '🍊', '🧃', '🛍️', '🛍️'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: appDmPrimary * 4),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SafeArea(
                      child: Image.network(
                        'https://www.pikpng.com/pngl/b/211-2113083_transparent-background-strawberry-png-clipart.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  backgroundColor: AppConstrant.appColorGra.withOpacity(0.1),
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
                        Icons.favorite_border,
                        color: AppConstrant.appColorBlack,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: AppConstrant.appColorBlack,
                      ),
                    ),
                  ],
                  expandedHeight: size.height * 0.35,
                ),
                SliverPadding(padding: const EdgeInsets.symmetric(vertical: appDmPrimary)),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: appDmPrimary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // start
                            Text(
                              "Strawberry",
                              style: titleStyle(),
                            ),
                            SizedBox(
                              height: appDmPrimary - 10,
                            ),
                            Text(
                              "perkg",
                              style: appSubTitle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: appDmPrimary,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppConstrant.appColorBlack,
                                      ),
                                      borderRadius: BorderRadius.circular(appDmPrimary * 2)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.remove,
                                            color: AppConstrant.appColorBlack,
                                          ),
                                        ),
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        padding: const EdgeInsets.all(appDmPrimary - 10),
                                      ),
                                      Text(
                                        "2",
                                        style: titleStyle(),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add,
                                            color: AppConstrant.appColorBlack,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(appDmPrimary - 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Text("\$4.99", style: titleStyle()),
                                // end
                              ],
                            ),
                            Text(
                              "About the Product",
                              style: titleStyle(),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: appDmPrimary),
                              child: Text(
                                "Donec sollicitudin molestie malesuada. Curabitur non nulla sit amet"
                                " nisl tempus convallis quis ac lectus. Praesent sapien massa,"
                                " convallis a pellentesque nec, egestas non nisi. Vestibulum "
                                "ante ipsum primis in faucibus orci luctus et ultrices posuere "
                                "cubilia Curae; Donec velit neque,",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: appDmPrimary),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppConstrant.appColorGra.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(appDmPrimary)),
                          padding: const EdgeInsets.all(appDmPrimary),
                          child: Column(
                            children: [
                              Container(
                                child: Expanded(
                                  child: Image.network(
                                    'https://www.pikpng.com/pngl/b/211-2113083_transparent-background-strawberry-png-clipart.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Broccoli",
                                        style: appTitleStyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "\$4.99 ",
                                        style: appTitleStyle,
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                                    child: Icon(Icons.add),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: appDmPrimary,
                      crossAxisSpacing: appDmPrimary,
                    ),
                  ),
                ),
                // end section
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: appDmPrimary * 3,
                  ),
                ),
                /**/
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Container(
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
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Add To Cart"),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: appDmPrimary),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle titleStyle() => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppConstrant.appColorBlack,
      );
}
