// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_SLIVER_APP_BAR = '/slivers';
  static const ROUTE_TAB_PAGE_SELECTOR = '/tab-page-selectort';
  static const ROUTE_WATER_ANIMATION = '/water-animation';
  static const ROUTE_TRICKY_LOGIN = '/tricky-login';
  static const ROUTE_RIPPLE_ANIMATION = '/ripple-animation';
  static const ROUTE_CUSTOM_SLIDERS = '/custom-sliders';
  static const ROUTE_LOADING_VARIANTS = '/loading-variants';
  static const ROUTE_SHIMMER = '/shimmer';
  static const ROUTE_PLAY_ANIMATED = '/play-animated';
  static const ROUTE_CUSTOM_MODAL = '/custom-modal';
  static const ROUTE_BUTTON_STYLES = '/button-styles';

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

  static void navigateToTrickyLogin(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_TRICKY_LOGIN);
  }

  static void navigateToRippleAnimation(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_RIPPLE_ANIMATION);
  }

  static void navigateToCustomSliders(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_CUSTOM_SLIDERS);
  }

  static void navigateToLoadingVariants(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_LOADING_VARIANTS);
  }

  static void navigateToShimmerPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_SHIMMER);
  }

  static void navigateToPlayAnimatedPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_PLAY_ANIMATED);
  }

  static void navigateToCustomModalPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_CUSTOM_MODAL);
  }

  static void navigateToButtonStylesPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_BUTTON_STYLES);
  }
}
