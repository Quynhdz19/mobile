import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';


class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPage();
}

class _RankingPage extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              new Expanded(
                flex: 2,
                child: new Container(

                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          alignment: Alignment.topCenter,
                          child: Text('hihi'), //varaible above
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          alignment: Alignment.bottomCenter,
                          child: Text('hihi'), //variable above
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Expanded(
                flex: 3,
                child: new Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hạng', style: TextStyle(fontSize: 22), textAlign: TextAlign.left, ),
                          Text('Điểm', style: TextStyle(fontSize: 22), textAlign: TextAlign.right,)
                        ],
                      ),
                      Divider(thickness: 2,),
                      SizedBox(
                        height: 300,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text('${index+4}'),
                                title: Row(
                                  children: [
                                    CircleAvatar(backgroundColor: Colors.black,),
                                    SizedBox(width: 10,),
                                    Text('Name'),
                                  ],
                                ),
                                trailing: Text('345'),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 20),
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  }
}