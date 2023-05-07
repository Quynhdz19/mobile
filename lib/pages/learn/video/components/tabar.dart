import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_front_end/utils/constants.dart';

class TaBar extends StatelessWidget {
  const TaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextFormField(
                onChanged: (String text) {},
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: 'search_here'.tr,
                  contentPadding:
                  EdgeInsets.fromLTRB(20.0, 13.0, 22.0, 13.0),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
