import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/ranking/profile.dart';
import 'dummy_data.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({Key? key}) : super(key: key);

  List<Profile> get top_3 {
    List<Profile> top_3 = [];
    for (int i = 0; i < 3; i++) {
      top_3.add(Ranking_Profiles[i]);
    }
    return top_3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: ClipOval(
                              child: Image.network(
                            top_3[1].avatarUrl,
                            fit: BoxFit.cover,
                          )),
                        ),
                        const SizedBox(height: 5),
                        Text('${top_3[1].ranking}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(top_3[1].name),
                        Text('${top_3[1].score}'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: ClipOval(
                              child: Image.network(
                            top_3[1].avatarUrl,
                            fit: BoxFit.cover,
                          )),
                        ),
                        const SizedBox(height: 5),
                        Text('${top_3[0].ranking}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(top_3[0].name),
                        Text('${top_3[0].score}'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: ClipOval(
                              child: Image.network(
                            top_3[1].avatarUrl,
                            fit: BoxFit.cover,
                          )),
                        ),
                        const SizedBox(height: 5),
                        Text('${top_3[2].ranking}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(top_3[2].name),
                        Text('${top_3[2].score}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Hạng',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Điểm',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                  '${Ranking_Profiles[index + 3].ranking}'),
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    // backgroundColor: Colors.blue,
                                    child: ClipOval(
                                        child: Image.network(
                                      Ranking_Profiles[index].avatarUrl,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(Ranking_Profiles[index].name),
                                ],
                              ),
                              trailing:
                                  Text('${Ranking_Profiles[index + 3].score}'),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: Ranking_Profiles.length - 3),
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
