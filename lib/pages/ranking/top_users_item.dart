import 'package:flutter/material.dart';

class TopUserItem extends StatelessWidget {
 // const TopUserItem({Key? key}) : super(key: key);

  final String avatar;
  final int ranking;
  final String name;
  final int score;

  TopUserItem({required this.avatar,
    required this.ranking,
    required this.name,
    required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Text('H'),
              ),
              Positioned(
                top: 70,
                left: 30,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.yellow[800],
                  child: Text(ranking.toString(), style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(height: 90,),
            ],
          ),
          Text(name, style: TextStyle(color: Colors.white, fontSize: 16),),
          Text(score.toString(), style: TextStyle(color: Colors.white, fontSize: 16),),
        ],
      ),
    );
  }
}
