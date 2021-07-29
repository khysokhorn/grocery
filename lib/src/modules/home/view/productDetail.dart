import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/widgets/widgets.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required this.productResultModel})
      : super(key: key);
  final ProductResultModel productResultModel;

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("product detail ${widget.productResultModel.imageUrl}");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: appDmPrimary * 4),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                ProductDetailAppBar(widget: widget, size: size),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: appDmPrimary,
                  ),
                ),
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
                              "${widget.productResultModel.title}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: appDmPrimary,
                            ),
                            Text(
                              "${widget.productResultModel.unit.title}",
                              style: appSubTitle,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: appDmPrimary),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  addAndRemove(),
                                  Text(
                                    "\$${widget.productResultModel.scale[0].itemPrice.price}",
                                    style: TextStyle(
                                      color: AppConstrant.appColorRed,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
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
                                style: TextStyle(color: AppConstrant.appColorGra),
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
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                child: appImgNetFadeIn(
                                  url:
                                      "https://www.pikpng.com/pngl/b/211-2113083_transparent-background-strawberry-png-clipart.png",
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("Strawberry"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  ),
                ),

                // end section
                // add more space for grid cart
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: appDmPrimary * 5,
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
            child: appImgNetFadeIn(
              url: "${widget.productResultModel.imageUrl}",
            ),
          ),
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
