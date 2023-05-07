import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {required Map<dynamic, dynamic>? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}