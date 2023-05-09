import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/learn/practice_vocab/listenAndWritePage/components/practive_word.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';
import 'package:mobile_front_end/widgets/process_bar.dart';
import 'package:mobile_front_end/widgets/sound_bar.dart';
import 'package:mobile_front_end/services/route_paths.dart' as routes;

class ListenAndWritePage extends StatefulWidget {
  ListenAndWritePage({Key? key}) : super(key: key);

  @override
  _ListenAndWritePage createState() => _ListenAndWritePage();
}
class _ListenAndWritePage extends State<ListenAndWritePage> {


  final NavigationService _navigationService = locator<NavigationService>();
  PageController _pageController = PageController();
  final TextEditingController _answerController = TextEditingController();

  List <Map <dynamic, dynamic>> practicesList = [];
  void getRractices() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await firestore.collection('practices').get();
    final List<QueryDocumentSnapshot> practices = snapshot.docs;

    practices.forEach((practice) {
      Map<dynamic, dynamic> data = practice.data() as Map<dynamic, dynamic>;
      practicesList.add(data);
    });
    setState(() {});

  }

  @override
  initState() {
    super.initState();
    getRractices();
  }

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Container(
                        child: PractiveWord(
                          words: practicesList,
                          index: index,
                        )),
                  );
                },
              ),
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 60),
                child: Container(
                  decoration: BoxDecoration(
                    color: lightBackgroundColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _answerController,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Type the word which you hear",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    index++;
                    if (index == practicesList[0]['word_list'].length -1) {
                      _navigationService.navigateTo(routes.Congratulate, arguments: {} );
                    }
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: whiteColor,
                    backgroundColor: lightPrimaryColor,
                    side: const BorderSide(color: lightPrimaryColor),
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                  ),
                  child: const Text(
                    "CHECK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 90),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    index--;
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: whiteColor,
                    backgroundColor: Colors.red,
                    side: const BorderSide(color: redColor),
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                  ),
                  child: const Text(
                    "   SKIP  ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
