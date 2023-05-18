import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class WordWidget extends StatelessWidget {
  const WordWidget(
      {Key? key,
      required this.imageUrl,
      this.onPressed,
      required this.vocab,
      required this.type,
      required this.pronoun,
      required this.meaning})
      : super(key: key);

  final String imageUrl;
  final String vocab;
  final String type;
  final String pronoun;
  final String meaning;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: onPressed, icon: Icon(Icons.clear))
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
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
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                imageUrl,
                                width: 400,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              vocab,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(51, 129, 193, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              type,
                              style: TextStyle(
                                fontSize: 18,
                                color: greyColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              pronoun,
                              style: TextStyle(
                                fontSize: 18,
                                color: greenColor,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              meaning,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 20,
        height: 100,
        decoration: BoxDecoration(
            color: lightOrangeColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        vocab,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            fontFamily: GoogleFonts.poppins().toString()),
                        // Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: lightTextColor,
                            fontFamily: GoogleFonts.poppins().toString()),
                        // Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 5,),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        meaning,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: lightTextColor,
                            fontFamily: GoogleFonts.poppins().toString()),
                        // Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
