import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/pages/profile/calendarPage/components/calendar_widget.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../common_component/LeftSideBar.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftSideBar(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('calendar'.tr,style: TextStyle(fontSize: 18)),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: <Widget> [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/calendarbg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(244,248,252,0.3),
                        child: IconButton(
                          icon: const Icon(
                            Icons.chevron_left,
                            color: calendarColor,
                            size: 25,
                          ),
                          onPressed: () {
                            _navigationService.goBack();
                          },
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/calendar_title.png"),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  CalendarWidget(),
                  Spacer(),

                ],
              ),
            ),
          ],
        ),
    );
  }
}
