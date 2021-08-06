import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/bloc/product/product_bloc.dart';
import 'package:grocery/src/modules/home/model/productItem.dart';
import 'package:grocery/src/modules/home/widgets/homeWidget.dart';
import 'package:grocery/src/repository/grocerRepo.dart';
import 'package:grocery/src/widgets/widgets.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required this.productResultModel})
      : super(key: key);
  final ProductResultModel productResultModel;

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int qtyProduct = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("product detail ${widget.productResultModel.imageUrl}");
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductBloc(context.read<GrocerRepo>(), 1),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: appDmPrimary * 4),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  ProductDetailAppBar(widget: widget, size: size),
                  ProductDescription(
                    productResultModel: widget.productResultModel,
                    qtyCallBack: (itemQty) {},
                  ),
                  SimilarProduct(),
                  // add more space for grid cart
                  AppSliverSpace(),
                  /**/
                ],
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is QtyState) {
                  qtyProduct = state.qty;
                }
                return BtnSubmitDataToCart(
                  size: size,
                  qty: qtyProduct,
                  widget: widget,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.productResultModel,
    required this.qtyCallBack,
  }) : super(key: key);
  final ProductResultModel productResultModel;
  final Function(int qty) qtyCallBack;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: appDmPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: appDmPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // start
            Text(
              "${productResultModel.title}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: appDmPrimary,
            ),
            Text(
              "${productResultModel.unit!.title}",
              style: appSubTitle,
            ),
            Container(
              margin: const EdgeInsets.only(right: appDmPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QtyAddOrRemoveToCart(
                    qtyCallBack: (qtyNum) {
                      qtyCallBack(qtyNum);
                    },
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is QtyState) {
                        print("==> qty item ${state.qty}");
                        double price = double.parse(
                              productResultModel.scale![0].itemPrice!.price!,
                            ) *
                            state.qty;
                        return Text(
                          state is QtyState ? "\$ $price" : "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppConstrant.appColorRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        );
                      }
                      return Text(
                          "\$ ${productResultModel.scale![0].itemPrice!.price}",
                          style: TextStyle(
                            color: AppConstrant.appColorRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ));
                    },
                  ),
                ],
              ),
            ),
            Text("About the Product", style: titleStyle()),
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
    );
  }
}

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
                    child: AppFadImage(
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
    );
  }
}

TextStyle titleStyle() {
  return GoogleFonts.khula(
      color: AppConstrant.appColorBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16);
}
