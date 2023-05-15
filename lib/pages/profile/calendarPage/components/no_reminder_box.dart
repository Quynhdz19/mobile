import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/constants.dart';

class NoReminderBox extends StatelessWidget {
  const NoReminderBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            color: calendarColor,
            size: 40,
          ),
          SizedBox(height: 5),
          Text(
            'no_reminder'.tr,
            style: TextStyle(
                color: calendarColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'no_reminder_content'.tr,
            style: TextStyle(color: calendarColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
