import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:mobile_front_end/pages/learn/grammar/data.dart";
import 'package:mobile_front_end/pages/learn/grammar/widgets/grammar_category_item.dart';
import "package:mobile_front_end/pages/learn/grammar/widgets/tense_category_item.dart";
import "package:mobile_front_end/pages/learn/grammar/widgets/type_of_word_item.dart";

class typesOfWordPage extends StatelessWidget {
  const typesOfWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
            ),
          ),
          title: Text(
            'Types Of Word',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TypeOfWordItem(id: TYPES_OF_WORD_CATEGORIES[index].id,
                title: TYPES_OF_WORD_CATEGORIES[index].title,
            content: TYPES_OF_WORD_CATEGORIES[index].content,);
          },
          itemCount: TYPES_OF_WORD_CATEGORIES.length,
        )

    );
  }
}
