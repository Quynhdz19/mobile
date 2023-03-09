import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({Key? key, this.notifiedNumber = 0}) : super(key: key);

  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: notifiedNumber > 0
          ? Badge(
            badgeColor: Colors.red,
            position: BadgePosition(top: -7, end: 2),
            badgeContent: Text(''),
            padding: EdgeInsets.all(3),
            child: Icon(Icons.notifications)
          )
          : Icon(Icons.notifications),
      );
  }
}
