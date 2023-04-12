import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTime extends StatefulWidget {
  final int time;
  final Function completeFunc;

  const CountDownTime(
      {Key? key, required this.time, required this.completeFunc})
      : super(key: key);

  @override
  State<CountDownTime> createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountDownTime> {
  static const countDownDuration = Duration(seconds: 10);
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  bool isRunning = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() {
        duration = countDownDuration;
      });
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildTime(),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
