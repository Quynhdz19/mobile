
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDarkMode ? Colors.blueAccent : Colors.white;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        // padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: endIcon
              ? Colors.blueAccent.withOpacity(0.3)
              : redColor.withOpacity(0.2),
        ),
        child: Icon(
          icon,
          color: endIcon ? iconColor : redColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,

        // TextStyle(
        //     fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
      ),
      trailing: endIcon
          ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueAccent.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.chevron_right,
          size: 25,
          color: Colors.blueAccent,
        ),
      )
          : null,
    );
  }
}