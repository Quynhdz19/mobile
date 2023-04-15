import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_front_end/utils/constants.dart';
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
        title: const Text("Dictionary"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
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
                      contentPadding: EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
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

            return snapshot == null
                ? Container(
                    child: Text("No results are found.}"),
                  )
                : ListView.builder(
                    itemCount: snapshot.data["definitions"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return index.runtimeType == int
                          ? ListBody(
                              children: <Widget>[
                                // Container(
                                //     // color: Colors.white70,
                                //     // decoration: BoxDecoration(
                                //     //   borderRadius: BorderRadius.circular(30.0),
                                //     // ),
                                //     child: Row(
                                //   children: [
                                //     Container(
                                //       alignment: Alignment.center,
                                //       child: Container(
                                //         width: 100,
                                //         height: 100,
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //                 BorderRadius.circular(30.0),
                                //             image: DecorationImage(
                                //                 image: NetworkImage(
                                //                   "https://img.freepik.com/free-vector/images-concept-illustration_114360-218.jpg?w=996&t=st=1681532294~exp=1681532894~hmac=e4eb5b7a5ef692e4b5dc6c6e69283dac339e3d8f24da3461ea414a5c5e4df356",
                                //                 ),
                                //                 fit: BoxFit.cover)),
                                //       ),
                                //     ),
                                //     Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: [
                                //         Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //             child: Text(
                                //               "${"${_controller.text.trim()} (" + snapshot.data["definitions"][index]["type"]})",
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .headline3,
                                //             )),
                                //         Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: Text(
                                //               snapshot.data["definitions"]
                                //                   [index]["definition"],
                                //             maxLines: 2,
                                //             overflow: TextOverflow.ellipsis,),
                                //         )
                                //       ],
                                //     ),
                                //   ],
                                // )
                                //
                                //     // ListTile(
                                //     //   leading: snapshot.data["definitions"][index]
                                //     //               ["image_url"] ==
                                //     //           null
                                //     //       ? CircleAvatar(
                                //     //           backgroundImage: NetworkImage(
                                //     //               "https://img.freepik.com/free-vector/research-development-icons_1212-146.jpg?w=1480&t=st=1681531878~exp=1681532478~hmac=479d1d8b030ab65e64859b5a88693624acf6ad03a36dd47df4ebae167722f65c"))
                                //     //       : CircleAvatar(
                                //     //           backgroundImage: NetworkImage(
                                //     //               snapshot.data["definitions"]
                                //     //                   [index]["image_url"]),
                                //     //         ),
                                //     //   title: Text(
                                //     //       "${"${_controller.text.trim()}(" + snapshot.data["definitions"][index]["type"]})"),
                                //     // ),
                                //     ),

                                Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  height: 100,
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
                                              image: NetworkImage(
                                                "https://img.freepik.com/free-vector/research-development-icons_1212-146.jpg?w=1480&t=st=1681531878~exp=1681532478~hmac=479d1d8b030ab65e64859b5a88693624acf6ad03a36dd47df4ebae167722f65c"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(
                                            "${"${_controller.text.trim()} (" + snapshot.data["definitions"][index]["type"]})",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                          Text(
                                            "${snapshot.data["definitions"][index]["definition"]}",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Text(
                                          //   "${topic["word"]} word",
                                          //   style: Theme.of(context).textTheme.bodyMedium,
                                          // )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: Text(
                                  "No results are found. Please type the exact word."),
                            );
                    },
                  );
          },
        ),
      ),
    );
  }
}
