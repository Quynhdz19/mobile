import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/models/user.dart';

class AllUser extends StatelessWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get all users'),
      ),
      body: StreamBuilder(
        stream: readUsers(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: (users as List<User>).map(buildUser).toList(),
            );
          } else if(snapshot.hasError) {
            return Text('Something went wrong');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }

  Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(child: Text("A"),),
    title: Text(user.fullname),
    subtitle: Text(user.email),
  );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
