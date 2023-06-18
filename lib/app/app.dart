import 'package:flutter/material.dart';

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
