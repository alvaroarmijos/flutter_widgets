import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/custom_sliders/page.dart';
import 'package:lalo_dart_general_examples/features/loading_variants/page.dart';
import 'package:lalo_dart_general_examples/features/play_animated_button/page.dart';
import 'package:lalo_dart_general_examples/features/ripple_animation/page.dart';
import 'package:lalo_dart_general_examples/features/shimmer/page.dart';
import 'package:lalo_dart_general_examples/features/tab_page_selector/page.dart';
import 'package:lalo_dart_general_examples/features/tricky_login/page.dart';
import 'package:lalo_dart_general_examples/features/water_animation/page.dart';

import '../features/home/page.dart';
import '../features/sliver_app_bar/page.dart';
import 'app_navigator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: _routeFactory,
      ),
      onWillPop: () async {
        return !(await navigatorKey.currentState?.maybePop() ?? true);
      },
    );
  }

  static Route<dynamic> _routeFactory(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigator.ROUTE_MAIN_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case AppNavigator.ROUTE_SLIVER_APP_BAR:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SliverAppBarPage(),
        );
      case AppNavigator.ROUTE_TAB_PAGE_SELECTOR:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const TabPageSelectorPage(),
        );
      case AppNavigator.ROUTE_WATER_ANIMATION:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const WaterAnimationPage(),
        );
      case AppNavigator.ROUTE_TRICKY_LOGIN:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const TrickyLoginPage(),
        );
      case AppNavigator.ROUTE_RIPPLE_ANIMATION:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RippleAnimationPage(),
        );
      case AppNavigator.ROUTE_CUSTOM_SLIDERS:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CustomSlidersPage(),
        );
      case AppNavigator.ROUTE_LOADING_VARIANTS:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoadingVariantsPage(),
        );
      case AppNavigator.ROUTE_SHIMMER:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ShimmerPage(),
        );
      case AppNavigator.ROUTE_PLAY_ANIMATED:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PlayAnimatedButtonPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name} on App',
              ),
            ),
          ),
        );
    }
  }
}
