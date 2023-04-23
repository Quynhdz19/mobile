import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ReminderBox extends StatelessWidget {
  const ReminderBox({required this.title, Key? key}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Container(
              width: 250,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: calendarColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "9:00 AM",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 20,), color: calendarColor, )
        ],
      ),
    );
  }
}
