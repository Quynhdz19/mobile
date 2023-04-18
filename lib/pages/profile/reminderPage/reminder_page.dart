import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/change_time_box.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/fixed_time_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget> [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/reminder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color.fromRGBO(181, 207, 216, 1),
                          size: 25,
                        ),
                        onPressed: () {
                          _navigationService.goBack();
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  ChangeTimeBox(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.repeat,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Change",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
