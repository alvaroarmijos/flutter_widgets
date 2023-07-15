// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_SLIVER_APP_BAR = '/slivers';
  static const ROUTE_TAB_PAGE_SELECTOR = '/tab-page-selectort';
  static const ROUTE_WATER_ANIMATION = '/water-animation';

  static void navigateBack(BuildContext context) => Navigator.pop(context);

  static void navigateToMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, ROUTE_MAIN_PAGE);
  }

  static void navigateBackToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTE_MAIN_PAGE,
      (route) => false,
    );
  }

  static void navigateToSliverAppBar(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_SLIVER_APP_BAR);
  }

  static void navigateToTabPageSelector(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_TAB_PAGE_SELECTOR);
  }

  static void navigateToWaterAnimation(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_WATER_ANIMATION);
  }
}
