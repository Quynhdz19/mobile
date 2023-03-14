import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/home/newWordPage/new_word_page.dart';
import 'package:mobile_front_end/utils/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

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
              ),
              child: TextFormField(
                onChanged: (String text) {},
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: "Search here",
                  contentPadding:
                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewWordPage()));
            },
          ),
        ],
      ),
    );
  }
}
