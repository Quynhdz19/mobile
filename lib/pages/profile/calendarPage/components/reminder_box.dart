import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ReminderBox extends StatelessWidget {
  const ReminderBox({required this.title, required this.time, required this.editReminder, Key? key}) : super(key: key);

  final String title;
  final String time;
  final VoidCallback editReminder;

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
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: calendarColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
          ),
          IconButton(onPressed: () => editReminder(), icon: Icon(Icons.edit, size: 20,), color: calendarColor, )
        ],
      ),
    );
  }
}
