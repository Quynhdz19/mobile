import "package:flutter/material.dart";
import "package:mobile_front_end/pages/learn/grammar/data.dart";
import 'package:mobile_front_end/pages/learn/grammar/widgets/grammar_category_item.dart';
import "../models/grammar_category.dart";
import "package:mobile_front_end/services/locator.dart";
import "package:mobile_front_end/services/navigation_service.dart";

class GrammarPage extends StatefulWidget {
  @override
  _GrammarPageState createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  int _selectedIndex = 0;

  void _handleButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<GrammarCategory> get _array {
    switch (_selectedIndex) {
      case 0:
        return GRAMMAR_CATEGORIES_BEGINNER;
      case 1:
        return GRAMMAR_CATEGORIES_INTERMEDIATE;
      case 2:
        return GRAMMAR_CATEGORIES_ADVANCED;
      default:
        return [];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _navigationService.goBack();
          },
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


      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: _selectedIndex == 0 ? Colors.white : Colors.transparent,
                              foregroundColor: Colors.black,
                              side: BorderSide.none,
                              elevation: 0,
                            ),
                            onPressed: () => _handleButtonTap(0),
                            child: Text('Beginner',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: _selectedIndex == 1 ? Colors.white : Colors.transparent,
                            foregroundColor: Colors.black,
                            side: BorderSide.none,
                            elevation: 0,
                          ),
                          onPressed: () => _handleButtonTap(1),
                          child: Text('Intermediate',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        )
                    ),
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: _selectedIndex == 2 ? Colors.white : Colors.transparent,
                            foregroundColor: Colors.black,
                            side: BorderSide.none,
                            elevation: 0,
                          ),
                          onPressed: () => _handleButtonTap(2),
                          child: Text('Advanced',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),


          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 10,
                crossAxisSpacing: 0,
                childAspectRatio: 5/8,
              ),
              itemCount: _array.length,
              itemBuilder: (BuildContext context, int index) {
                return GrammarCategoryItem(image: _array[index].image, title:  _array[index].title,
                  example: _array[index].example, content: _array[index].content,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
