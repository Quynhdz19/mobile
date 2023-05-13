import 'package:flutter/material.dart';

class TopUserItem extends StatelessWidget {
 // const TopUserItem({Key? key}) : super(key: key);

  final String avatar;
  final int ranking;
  final String name;
  final int score;
  String fullname;

  TopUserItem({required this.avatar,
    required this.ranking,
    required this.name,
    required this.score, required this.fullname});

  bool isMe = false;
  @override
  Widget build(BuildContext context) {
    if (fullname == name) {
      isMe = true;
    }
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(avatar),
                backgroundColor: Colors.transparent,
                // thiết lập đường viền và màu
                foregroundColor: Colors.blue, // màu của đường viền
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isMe ? Colors.blue : Colors.white, // màu của đường viền
                      width: isMe ? 4 : 2, // độ rộng của đường viền
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(avatar),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 30,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: isMe ? Colors.green : Colors.yellow[800] ,
                  child: Text(ranking.toString(), style: TextStyle(color: Colors.black),),

                ),
              ),
              SizedBox(height: 90,),
            ],
          ),
          Text(name, style: TextStyle(color: isMe ? Colors.lightBlue : Colors.white, fontSize: 20),),
          Text(score.toString(), style: TextStyle(color: isMe ?  Colors.yellow[800] :  Colors.white, fontSize: 16),),
        ],
      ),
    );
  }
}
