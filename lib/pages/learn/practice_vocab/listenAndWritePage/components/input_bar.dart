import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

import '../../../../../widgets/sound_bar.dart';

class InputBar extends StatelessWidget {
  const InputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SoundBar(iconWidth: 70, space: 0, word: 'festival'),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: lightBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(1, 3),
              ) // changes position of shadow
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://thumbs.dreamstime.com/b/cartoon-wild-animal-jungle-illustration-83115050.jpg',
                    width: 400,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'aaa',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightBackgroundColor,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        onChanged: (String text) {},
                        style: Theme.of(context).textTheme.headlineSmall,
                        decoration: const InputDecoration(
                          contentPadding:
                          EdgeInsets.all(20),
                          hintText: "Type the word which you hear",
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                foregroundColor: whiteColor,
                backgroundColor: lightPrimaryColor,
                side: const BorderSide(color: lightPrimaryColor),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              ),
              child: const Text(
                "CHECK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
