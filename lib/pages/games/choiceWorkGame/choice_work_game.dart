import 'package:flutter/material.dart';

class ChoiceWorkGame extends StatelessWidget {
  const ChoiceWorkGame({Key? key, required this.topic}) : super(key: key);

  final String topic;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            topic,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("While I am", style: Theme.of(context).textTheme.headline2,),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://en.pimg.jp/030/460/189/1/30460189.jpg")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/games/two-way.png")),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 20,),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-vector/two-children-fighting-with-each-other-boy-girl-arguing-vector-cartoon-characters_651415-210.jpg?w=2000")),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 10,),
                Text("or", style: Theme.of(context).textTheme.headline2,),
                const SizedBox(width: 10,),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://img.freepik.com/premium-vector/meditating-man-isolated-keep-calm-cartoon-style_165429-924.jpg?w=2000")),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 10,),

              ],
            )
          ],
        ));
  }
}
