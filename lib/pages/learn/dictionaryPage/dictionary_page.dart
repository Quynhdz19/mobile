import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:http/src/response.dart';

class DictionaryPage extends StatefulWidget {
  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  // String _url = "https://owlbot.info/api/v4/dictionary/";
  // String _token = "d933576a3f868f76ead92326e9ab2cf04e7dabc5";
  //
  // TextEditingController _controller = TextEditingController();
  //
  // late StreamController _streamController;
  // late Stream _stream;
  //
  // // late Timer _debounce;
  //
  // searchFunction() async {
  //   if (_controller.text == null || _controller.text.length == 0) {
  //     _streamController.add(null);
  //     return;
  //   }
  //
  //   _streamController.add("waiting");
  //   Response response = await get(Uri.parse(_url + _controller.text.trim()),
  //       headers: {"Authorization": "Token " + _token});
  //   _streamController.add(json.decode(response.body));
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _streamController = StreamController();
  //   _stream = _streamController.stream;
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   var isDarkMode =
  //       MediaQuery.of(context).platformBrightness == Brightness.dark;
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       // leading: IconButton(
  //       //   onPressed: () => Get.back(),
  //       //   icon: const Icon(
  //       //     Icons.chevron_left,
  //       //     size: 30,
  //       //   ),
  //       // ),
  //       title: Text(
  //         'Dictionary',
  //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //       ),
  //       // actions: [
  //       //   IconButton(
  //       //       onPressed: () {
  //       //
  //       //       },
  //       //       icon: Icon(
  //       //           isDarkMode ? Icons.sunny : Icons.nightlight_round_outlined))
  //       // ],
  //       bottom: PreferredSize(
  //         preferredSize: Size.fromHeight(48),
  //         child: Row(
  //           children: <Widget>[
  //             Expanded(
  //                 child: Container(
  //               margin: const EdgeInsets.only(left: 12, bottom: 8),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(24)),
  //               child: TextFormField(
  //                 onChanged: (String text) {
  //                   // if (_debounce?.isActive ?? false) _debounce.cancel();
  //                   // _debounce = Timer(const Duration(milliseconds: 1000), () {
  //                   //   searchFunction();
  //                   // });
  //                 },
  //                 controller: _controller,
  //                 decoration: InputDecoration(
  //                     hintText: "Search ...",
  //                     contentPadding: const EdgeInsets.only(left: 24),
  //                     border: InputBorder.none),
  //               ),
  //             )),
  //             IconButton(
  //                 onPressed: () {
  //                   searchFunction();
  //                 },
  //                 icon: Icon(
  //                   Icons.search,
  //                   color: Colors.white,
  //                 ))
  //           ],
  //         ),
  //       ),
  //     ),
  //     body: Container(
  //       margin: const EdgeInsets.all(8),
  //       child: StreamBuilder(
  //         stream: _stream,
  //         builder: (BuildContext context, AsyncSnapshot snapshot) {
  //           if (snapshot.data == null) {
  //             return Center(
  //               child: Text("Enter a word"),
  //             );
  //           }
  //
  //           if (snapshot.data == "waiting") {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           return ListView.builder(
  //               itemCount: snapshot.data["definitions"].length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return ListBody(
  //                   children: <Widget>[
  //                     Container(
  //                       color: Colors.grey,
  //                       child: ListTile(
  //                         leading: snapshot.data["definitions"][index]
  //                                     ["image_url"] ==
  //                                 null
  //                             ? null
  //                             : CircleAvatar(
  //                                 backgroundImage: NetworkImage(snapshot
  //                                     .data["definitions"][index]["image_url"]),
  //                               ),
  //                         title: Text(_controller.text.trim() +
  //                             "(" +
  //                             snapshot.data["definitions"][index]["type"] +
  //                             ")"),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Text(
  //                           snapshot.data["definitions"][index]["definition"]),
  //                     )
  //                   ],
  //                 );
  //               });
  //         },
  //       ),
  //     ),
  //   );
  // }

  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "d933576a3f868f76ead92326e9ab2cf04e7dabc5";

  TextEditingController _controller = TextEditingController();

  late StreamController _streamController;
  late Stream _stream;

  // Timer? _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await get(Uri.parse(_url + _controller.text.trim()),
        headers: {"Authorization": "Token" + _token});
    _streamController.add(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flictionary"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
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
                      // if (_debounce?.isActive ?? false) _debounce?.cancel();
                      // _debounce = Timer(const Duration(milliseconds: 1000), () {
                      //   _search();
                      // });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
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
            if (snapshot.data == null) {
              return Center(
                child: Text("Enter a search word"),
              );
            }

            if (snapshot.data == "waiting") {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data["definitions"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListBody(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[300],
                      child: ListTile(
                        leading: snapshot.data["definitions"][index]
                                    ["image_url"] ==
                                null
                            ? null
                            : CircleAvatar(
                                backgroundImage: NetworkImage(snapshot
                                    .data["definitions"][index]["image_url"]),
                              ),
                        title: Text(_controller.text.trim() +
                            "(" +
                            snapshot.data["definitions"][index]["type"] +
                            ")"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          snapshot.data["definitions"][index]["definition"]),
                    )
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
