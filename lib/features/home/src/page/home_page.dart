import 'package:flutter/material.dart';

import '../../../../app/app_navigator.dart';
import '../../../../common/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lalo Dart"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          NavigatorWidget(
            title: "TabBar View",
            newItem: true,
            onTap: () => AppNavigator.navigateToTabBarViewPage(context),
          ),
          NavigatorWidget(
            title: "Rive Animations",
            onTap: () => AppNavigator.navigateToRiveAnimationsPage(context),
          ),
          NavigatorWidget(
            title: "Menu UI Animation",
            onTap: () => AppNavigator.navigateToMenuUiAnimationPage(context),
          ),
          NavigatorWidget(
            title: "Sliver App bar",
            onTap: () => AppNavigator.navigateToSliverAppBar(context),
          ),
          NavigatorWidget(
            title: "TabPageSelector",
            onTap: () => AppNavigator.navigateToTabPageSelector(context),
          ),
          NavigatorWidget(
            title: "Water Animation",
            onTap: () => AppNavigator.navigateToWaterAnimation(context),
          ),
          NavigatorWidget(
            title: "Tricky Login",
            onTap: () => AppNavigator.navigateToTrickyLogin(context),
          ),
          NavigatorWidget(
            title: "Ripple Animation",
            onTap: () => AppNavigator.navigateToRippleAnimation(context),
          ),
          NavigatorWidget(
            title: "Custom Sliders",
            onTap: () => AppNavigator.navigateToCustomSliders(context),
          ),
          NavigatorWidget(
            title: "Loading Variants",
            onTap: () => AppNavigator.navigateToLoadingVariants(context),
          ),
          NavigatorWidget(
            title: "Shimmer Page",
            onTap: () => AppNavigator.navigateToShimmerPage(context),
          ),
          NavigatorWidget(
            title: "Play animated button",
            onTap: () => AppNavigator.navigateToPlayAnimatedPage(context),
          ),
          NavigatorWidget(
            title: "Custom Modal",
            onTap: () => AppNavigator.navigateToCustomModalPage(context),
          ),
          NavigatorWidget(
            title: "Button Styles",
            onTap: () => AppNavigator.navigateToButtonStylesPage(context),
          ),
        ],
      ),
    );
  }
}
