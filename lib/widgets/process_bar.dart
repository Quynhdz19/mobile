import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class ProcessBar extends StatelessWidget {
  const ProcessBar({Key? key, required this.rate}) : super(key: key);

  final double rate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 25,
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                border: Border.all(color: Colors.black26, width: 3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth * rate,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
