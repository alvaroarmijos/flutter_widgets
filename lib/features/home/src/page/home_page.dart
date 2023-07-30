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
        children: [
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
        ],
      ),
    );
  }
}
