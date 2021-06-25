import 'package:flutter/material.dart';
import 'package:grocery/src/modules/test/helper/helper.dart';
import 'package:grocery/src/modules/test/widget/promoteText.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../colors.dart';
import '../exampleData.dart';
import 'discountCard.dart';
import 'fIconButton.dart';
import 'headerClip.dart';
import 'pandaHead.dart';

class FAppBar extends SliverAppBar {
  final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;

  FAppBar({
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.tabController,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  @override
  Color? get backgroundColor => scheme.surface;

  @override
  Widget? get leading {
    return FIconButton(iconData: Icons.arrow_back, onPressed: () {});
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(iconData: Icons.share_outlined, onPressed: () {}),
      FIconButton(iconData: Icons.info_outline, onPressed: () {}),
    ];
  }

  @override
  Widget? get title {
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: this.isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ដឹកជញ្ជូន",
            style: textTheme.subtitle1?.copyWith(color: scheme.onSurface),
            strutStyle: Helper.buildStrutStyle(textTheme.subtitle1),
          ),
          const SizedBox(height: 4.0),
          Text(
            data.deliverTime,
            style: textTheme.caption?.copyWith(color: scheme.primary),
            strutStyle: Helper.buildStrutStyle(textTheme.caption),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: scheme.surface,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: scheme.primary,
          labelColor: scheme.primary,
          unselectedLabelColor: scheme.onSurface,
          indicatorWeight: 3.0,
          tabs: data.categories.map((e) {
            return Tab(text: e.title);
          }).toList(),
          onTap: (int index) {
            scrollController.scrollToIndex(index);
          },
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight = MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              Stack(
                children: [
                  PromoText(title: data.bannerText),
                  const PandaHead(),
                  Column(
                    children: [
                      HeaderClip(data: data, context: context),
                      const SizedBox(height: 110),
                    ],
                  ),
                ],
              ),
              DiscountCard(
                title: data.optionalCard.title,
                subtitle: data.optionalCard.subtitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
