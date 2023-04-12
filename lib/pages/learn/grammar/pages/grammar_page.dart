import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:mobile_front_end/pages/learn/grammar/data.dart";
import "package:mobile_front_end/pages/learn/grammar/pages/content_page.dart";
import "package:mobile_front_end/pages/learn/grammar/pages/tense_category_page.dart";
import "package:mobile_front_end/pages/learn/grammar/pages/types_of_word_page.dart";
import 'package:mobile_front_end/pages/learn/grammar/widgets/grammar_category_item.dart';
import "package:mobile_front_end/services/locator.dart";
import "package:mobile_front_end/services/navigation_service.dart";
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class GrammarPage extends StatelessWidget {
  GrammarPage({Key? key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {  Navigator.pop(context);},
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          'Grammar Points',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             tenseCategoryPage()));
                  _navigationService.navigateTo(routes.GrammarTenseCategoriesPage);
                }
                else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              typesOfWordPage()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ContentPage(content: GRAMMAR_CATEGORIES[index].content,
                              title: GRAMMAR_CATEGORIES[index].title,)));
                }
              },
              child: GrammarCategoryItem(id: GRAMMAR_CATEGORIES[index].id,
                  title: GRAMMAR_CATEGORIES[index].title),
            );
          },
          itemCount: GRAMMAR_CATEGORIES.length,
        )

    );
  }
}
