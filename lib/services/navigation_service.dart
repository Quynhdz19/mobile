import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {required List<Object?> arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}