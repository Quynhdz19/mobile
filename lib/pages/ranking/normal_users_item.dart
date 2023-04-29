import 'package:flutter/material.dart';

class NormalUserItem extends StatelessWidget {

  final String avatar;
  final int ranking;
  final String name;
  final int score;

  NormalUserItem({required this.avatar,
    required this.ranking,
    required this.name,
    required this.score});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.transparent,
          child: Text(ranking.toString(), style: TextStyle(color: Colors.black),),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Text('H'),
          ),
          SizedBox(width: 10,),
          Text(name, style: TextStyle(fontSize: 16, color: Colors.black),)
        ],
      ),
      trailing: Text(score.toString(), style: TextStyle(fontSize: 16),),
    );
  }
}
