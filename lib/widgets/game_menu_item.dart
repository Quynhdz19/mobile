import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class GameMenuItem extends StatelessWidget {
  const GameMenuItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.onTapFunc})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: lightBackgroundColor),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
