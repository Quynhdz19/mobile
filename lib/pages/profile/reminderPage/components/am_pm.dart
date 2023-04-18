import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isItAm;

  AmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isItAm == true ? 'AM' : 'PM',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}