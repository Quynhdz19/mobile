import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mobile_front_end/models/games/Quiz.dart';
import 'package:mobile_front_end/models/games/memory_card.dart';
import 'package:mobile_front_end/models/user.dart';

class AllUser extends StatelessWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Get all users'),
        ),
        body: StreamBuilder(
          stream: readCards(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;

              List<MemoryCard> listCards = getMemoryGameData() as List<MemoryCard>;

              print("List cards");
              print(listCards);
              return ListView(
                children: (users as List<MemoryCard>).map(buildCard).toList(),
              );
            } else if (snapshot.hasError) {
              return Text('Something went wrong');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(
          child: Text("A"),
        ),
        title: Text(user.fullname),
        subtitle: Text(user.email),
      );

  Widget buildCard(MemoryCard card) => ListTile(
    leading: CircleAvatar(
      child: Image.network(card.url),
    ),
    title: Text(card.id.toString()),
    subtitle: Text(card.word),
  );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Stream<List<MemoryCard>> readCards() => FirebaseFirestore.instance
      .collection('matching-game')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => MemoryCard.fromJson(doc.data())).toList());

  Future<Stream<List<MemoryCard>>> getMemoryGameData() async {
    final ref = FirebaseFirestore.instance.collection('matching-game');

    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => MemoryCard.fromJson(doc.data())).toList());

  }
}
