import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/am_pm.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/hours.dart';
import 'package:mobile_front_end/pages/profile/reminderPage/components/minutes.dart';

class ChangeTimeBox extends StatefulWidget {
  const ChangeTimeBox({Key? key}) : super(key: key);

  @override
  State<ChangeTimeBox> createState() => _ChangeTimeBoxState();
}

class _ChangeTimeBoxState extends State<ChangeTimeBox> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // hours wheel
              Container(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    print(index);
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 13,
                    builder: (context, index) {
                      return MyHours(
                        hours: index,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                width: 10,
              ),

              // minutes wheel
              Container(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return MyMinutes(
                        mins: index,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                width: 15,
              ),

              // am or pm
              Container(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return AmPm(
                          isItAm: true,
                        );
                      } else {
                        return AmPm(
                          isItAm: false,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],

      ),
    );

  }
}
