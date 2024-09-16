import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:mobile_front_end/pages/learn/grammar/data.dart";
import 'package:mobile_front_end/pages/learn/grammar/widgets/grammar_category_item.dart';
import "../models/grammar_category.dart";
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

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

      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('assets/images/grammar/grammar_cover.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 10),
              Text('Grammar Courses', style: Theme.of(context).textTheme.displayMedium,),
              Container(
                width: double.infinity,
                height: 90,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    //padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: _selectedIndex == 0 ? Colors.orange : Colors.transparent,
                              foregroundColor: Colors.black,
                              side: BorderSide.none,
                              elevation: 0,
                            ),
                            onPressed: () => _handleButtonTap(0),
                            child: Text('beginner'.tr,
                                style: TextStyle(
                                    color: _selectedIndex == 0 ? Colors.white : Colors.black, fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: _selectedIndex == 1 ? Colors.orange : Colors.transparent,
                                foregroundColor: Colors.black,
                                side: BorderSide.none,
                                elevation: 0,
                              ),
                              onPressed: () => _handleButtonTap(1),
                              child: Text('intermediate'.tr,
                                style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                            )
                        ),
                        Expanded(
                            flex: 5,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                backgroundColor: _selectedIndex == 2 ? Colors.orange : Colors.transparent,
                                foregroundColor: Colors.black,
                                side: BorderSide.none,
                                elevation: 0,
                              ),
                              onPressed: () => _handleButtonTap(2),
                              child: Text('advanced'.tr,
                                style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              // Expanded(
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 300,
              //       mainAxisSpacing: 10,
              //       crossAxisSpacing: 0,
              //       childAspectRatio: 5/8,
              //     ),
              //     itemCount: _array.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GrammarCategoryItem(image: _array[index].image, title:  _array[index].title,
              //         example: _array[index].example, content: _array[index].content,);
              //     },
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: _array.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                              child: GrammarCategoryItem(image: _array[index].image, title:  _array[index].title,
                                example: _array[index].example, content: _array[index].content,)
                          );
                        },

                    ),

                ),
              ),

            ],
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Align(
              alignment: Alignment(-1.0, -0.85),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      _navigationService
                          .navigateTo(routes.LearningPage, arguments: {});
                    },
                  ),
                ),
              ),
            ),
          ),

        ]
      ),
    );
  }
}
