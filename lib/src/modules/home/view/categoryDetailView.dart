import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';

class CategoryDetailView extends StatefulWidget {
  final String categoryTitle;

  const CategoryDetailView({Key? key, required this.categoryTitle}) : super(key: key);

  @override
  _CategoryDetailViewState createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> categories = ["All", "Leaf Vegetables", "Fruit Vegetable"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Icons.filter_list_alt,
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
          SizedBox(
            width: appDmPrimary,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(appDmPrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginWidget().titleLogin(
              "${widget.categoryTitle}",
            ),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelStyle: TextStyle(
                color: AppConstrant.appColorBlack,
              ),
              unselectedLabelColor: AppConstrant.appColorLightBlack,
              labelColor: AppConstrant.appColorLightBlack2,
              tabs: categories
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList(),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: appDmPrimary - 5,
                      mainAxisSpacing: appDmPrimary - 5,
                    ),
                    itemBuilder: (context, index) {
                      return Container();
                    }))
          ],
        ),
      ),
    );
  }
}
