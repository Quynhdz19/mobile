import 'package:flutter/material.dart';

class NormalUserItem extends StatelessWidget {

  final String avatar;
  final int ranking;
  final String name;
  final int score;
  String fullname;

  NormalUserItem({required this.avatar,
    required this.ranking,
    required this.name,
    required this.score,
    required this.fullname
  });

  bool isMe = false;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    if (fullname == name) {
      isMe = true;
    }
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
          child: Text(ranking.toString(), style: TextStyle(color: isMe ?  Colors.yellow[800] : (isDarkMode ? Colors.white : Colors.black)),),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
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
          SizedBox(width: 10,),
          Text(name, style: TextStyle(fontSize: 16, color: isMe ? Colors.blue : (isDarkMode ? Colors.white : Colors.black)),)
        ],
      ),
      trailing: Text(score.toString(), style: TextStyle(fontSize: 16, color: isMe ? Colors.blue : (isDarkMode ? Colors.white : Colors.black87)),),
    );
  }
}
