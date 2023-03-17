import 'package:flutter/material.dart';

void main() => runApp(RankingPage());

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ranking'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRankingItem('avatar_url_1', 'User 1', 1, 100),
                  _buildRankingItem('avatar_url_2', 'User 2', 2, 90),
                  _buildRankingItem('avatar_url_3', 'User 3', 3, 80),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return _buildRankingItem(
                      'avatar_url_${index + 4}', 'User ${index + 4}', index + 4, 70 - index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankingItem(String avatarUrl, String name, int index, int score) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 16.0),
          Text('$index'),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(name),
          ),
          SizedBox(width: 16.0),
          Text('$score'),
        ],
      ),
    );
  }
}