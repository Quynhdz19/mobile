import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class InputBar extends StatelessWidget {
  const InputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Center(
                child: TextFormField(
                  onChanged: (String text) {},
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.all(20),
                    hintText: "Type the word which you hear",
                    border: InputBorder.none,
                  ),
                ),
              ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "CHECK",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: whiteColor,
              backgroundColor: lightPrimaryColor,
              side: BorderSide(color: lightPrimaryColor),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
            ),
          ),
        ),
      ],
    );
  }
}
