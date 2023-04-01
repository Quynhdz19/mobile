import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;


class NotificationBox extends StatelessWidget {
  const NotificationBox({Key? key, this.notifiedNumber = 0}) : super(key: key);

  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: notifiedNumber > 0
          ? badge.Badge(
            badgeColor: Colors.red,
            position: const badge.BadgePosition(top: -7, end: 2),
            badgeContent: const Text(''),
            padding: const EdgeInsets.all(3),
            child: const Icon(Icons.notifications)
          )
          : const Icon(Icons.notifications),
      );
  }
}
