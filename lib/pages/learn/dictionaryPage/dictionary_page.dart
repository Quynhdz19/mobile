import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mobile_front_end/pages/learn/dictionaryPage/word_detail_page.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../controllers/common/common_function.dart';
// import 'package:http/src/response.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String _token = "125844dae98e066f0bb67163003a61b456f523ad";

  final TextEditingController _controller = TextEditingController();

  late StreamController _streamController;
  late Stream _stream;

  Timer? _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    http.Response response = await http.get(
        Uri.parse(_url + _controller.text.trim()),
        headers: {"Authorization": "Token " + _token});
    _streamController.add(json.decode(response.body));
    print('search result');
    print(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  final NavigationService _navigationService = locator<NavigationService>();
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
          "Dictionary",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    onChanged: (String text) {
                      if (_debounce?.isActive ?? false) _debounce?.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 30),
                onPressed: () {
                  _search();
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            print("snapshot");
            print(snapshot);
            print(_stream);
            if (snapshot.data == null) {
              print("snapshot");
              print(snapshot);
              return const Center(
                child: Text("Enter a search word"),
              );
            }

            if (snapshot.data == "waiting") {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return snapshot.data["definitions"][0]["type"] == null
                ? Container(
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                            width: 250,
                            height: 250,
                            child: Lottie.network(
                              "https://assets3.lottiefiles.com/private_files/lf30_cgfdhxgx.json",
                            )),
                        Text(
                          "No results are found.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Please check your word.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )),
                  )
                : ListView.builder(
                    itemCount: snapshot.data["definitions"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                          // index.runtimeType == int ?
                          ListBody(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("tap to detail page");
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //         gameLevel[index].goto));
                              //
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => WordDetailPage(
                                          word: _controller.text.trim() == null
                                              ? ""
                                              : _controller.text.trim(),
                                          type: snapshot.data["definitions"][index]["type"] == null
                                              ? ""
                                              : snapshot.data["definitions"]
                                                  [index]["type"],
                                          definition: snapshot.data["definitions"][index]["definition"] == null
                                              ? ""
                                              : snapshot.data["definitions"]
                                                  [index]["definition"],
                                          example: snapshot.data["definitions"][index]["example"] == null
                                              ? ""
                                              : snapshot.data["definitions"]
                                                  [index]["example"],
                                          image_url: snapshot.data["definitions"][index]["image_url"] == null
                                              ? "https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg"
                                              : snapshot.data["definitions"][index]["image_url"],
                                          emoji: snapshot.data["definitions"][index]["emoji"] == null ? "" : snapshot.data["definitions"][index]["emoji"])));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              // height: 100,
                              decoration: BoxDecoration(
                                  color: lightBackgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(1, 1))
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: snapshot.data["definitions"]
                                                      [index]["image_url"] !=
                                                  null
                                              ? NetworkImage(
                                                  snapshot.data["definitions"]
                                                      [index]["image_url"])
                                              : NetworkImage(
                                                  "https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${"${capitalize(_controller.text.trim())} (" + capitalize(snapshot.data["definitions"][index]["type"])})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        Text(
                                          "${capitalize(snapshot.data["definitions"][index]["definition"])}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // Text(
                                        //   "${topic["word"]} word",
                                        //   style: Theme.of(context).textTheme.bodyMedium,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
