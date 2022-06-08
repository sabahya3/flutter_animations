import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService navigator = NavigationService();

  final navigationController = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigationController.currentState!.pushNamed(routeName);
  }
}
