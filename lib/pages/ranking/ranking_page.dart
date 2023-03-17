import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

void main() => runApp(RankingPage());

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPage();
}

class _RankingPage extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              new Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      margin: EdgeInsets.only(top: 120, left: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: const Align(
                                alignment: Alignment(0,2),
                                child: const Text(
                                  '2',
                                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                ),),),
                          SizedBox(height: 15),
                          Text("Thu"),
                          Text('234'),
                        ],
                      )
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        margin: EdgeInsets.only(top: 60,),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue,
                              child: const Align(
                                alignment: Alignment(0,1.6),
                                child: const Text(
                                  '1',
                                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                ),),),
                            SizedBox(height: 15),
                            Text("Duong"),
                            Text('123'),
                          ],
                        )
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        margin: EdgeInsets.only(top: 120, right: 30),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue,
                              child: const Align(
                                alignment: Alignment(0,2),
                                child: const Text(
                                  '3',
                                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                ),),),
                            SizedBox(height: 15),
                            Text("Huy"),
                            Text('12'),
                          ],
                        )
                    )
                  ],
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
      ),
    );


  }
}