import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  Option({Key? key, required this.choice,
    required this.press, required this.color})
      : super(key: key);

  final VoidCallback press;
  final Color color;
  final String choice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(12),
        // color: getTheRightColor() == greyColor
        //           ? Colors.transparent
        //           : getTheRightColor(),

        decoration: BoxDecoration(
          color: color == Colors.black54
              ? Colors.transparent
              : color.withOpacity(0.2),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: (MediaQuery.of(context).size.width - 40),
          // height: 30,
          child: Text(
            choice,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}