import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';

Container addAndRemove() {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: appDmPrimary,
    ),
    decoration: BoxDecoration(
        border: Border.all(
          color: AppConstrant.appColorGra,
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
              color: AppConstrant.appColorLightBlack,
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(appDmPrimary - 10),
        ),
        Text(
          "2",
          style: titleStyle(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
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
  );
}

BoxDecoration shadowContaianerdecore() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 2,
        spreadRadius: 4,
      )
    ],
    borderRadius: BorderRadius.only(
        topRight: const Radius.circular(
          appDmPrimary,
        ),
        topLeft: const Radius.circular(
          appDmPrimary,
        )),
  );
}

BoxDecoration containerBKDecore() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.06),
    borderRadius: BorderRadius.circular(appDmPrimary),
  );
}

// search

FadeInImage appImgNetFadeIn({required String url}) {
  return FadeInImage.assetNetwork(
    placeholder: "asset/images/comfortPlaceholder.png",
    image: "$url",
    fit: BoxFit.fill,
  );
}

class FadeImage extends StatelessWidget {
  const FadeImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: "asset/images/comfortPlaceholder.png",
      image: imageUrl,
      fadeInCurve: Curves.easeInCirc,
      fadeOutCurve: Curves.easeOutCirc,
      width: 65,
      height: 65,
    );
  }
}

class FadeImageCart extends StatelessWidget {
  const FadeImageCart({Key? key, required this.imageUrl, required this.height})
      : super(key: key);
  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    // return Image.(
    //   "asset/images/apple.png",
    //   fit: BoxFit.fill,
    //   height: height,
    // );
    return FadeInImage.assetNetwork(
      placeholder: "asset/images/comfortPlaceholder.png",
      image: imageUrl,
      fadeInCurve: Curves.easeInCirc,
      fadeOutCurve: Curves.easeOutCirc,
      height: 120,
      fit: BoxFit.fill,
    );
  }
}

class AddAndRemove extends StatelessWidget {
  const AddAndRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: appDmPrimary,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppConstrant.appColorGra,
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
                color: AppConstrant.appColorLightBlack,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(appDmPrimary - 10),
          ),
          Text(
            "2",
            style: titleStyle(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
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
    );
  }
}
