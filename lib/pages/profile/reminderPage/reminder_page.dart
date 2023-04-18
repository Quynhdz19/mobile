import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/change_time_box.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/fixed_time_box.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/reminder.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color.fromRGBO(181, 207, 216, 1),
                        size: 25,
                      ),
                      onPressed: () {
                        // _navigationService.goBack();
                      },
                    ),
                  ),
                ),
                Spacer(),
                ChangeTimeBox(),
                Spacer(),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
