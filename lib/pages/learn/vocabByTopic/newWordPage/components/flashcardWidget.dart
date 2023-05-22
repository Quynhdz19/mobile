import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/controllers/common/sound_function.dart';
import 'package:mobile_front_end/models/learn/flashcard.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FlashCardWidget extends StatelessWidget {
  const FlashCardWidget({Key? key, required this.flash_card}) : super(key: key);

  final Flashcard flash_card;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      // height: 0,
      child: FlipCard(
        front: Card(
          elevation: 4,
          child: Container(
              // height: 300,
              decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: lightOrangeColor, width: 1),
            image: DecorationImage(
              image: NetworkImage(flash_card.imageUrl),
              fit: BoxFit.contain,
            ),
          )),
        ),
        back: Center(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text(
                  flash_card.vocab,
                  style: GoogleFonts.markaziText(
                    fontSize: 40,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(flash_card.pronoun, style: TextStyle(fontSize: 24)),
                const SizedBox(height: 10),
                Text(
                  flash_card.type,
                  style: GoogleFonts.markaziText(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(flash_card.meaning,
                    style: GoogleFonts.markaziText(fontSize: 24)),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        speakNormal(flash_card.vocab);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(76, 98, 118, 0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(1, 1),
                            )
                          ]
                        ),
                        child: Image.asset(
                          'assets/icons/normal_sound_icon.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // const SizedBox(width: 20,),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
