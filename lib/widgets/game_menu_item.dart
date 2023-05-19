import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class GameMenuItem extends StatelessWidget {
  const GameMenuItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.onPressed,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: lightBackgroundColor),
        child: Row(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 40)/3 - 10,
              height: (MediaQuery.of(context).size.width - 40)/3 - 10,
              decoration: BoxDecoration(
                // border: Border.all(color: primaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                image: DecorationImage(image: AssetImage(imageUrl,), fit: BoxFit.fill)

              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: lightTextColor,
                            fontFamily: GoogleFonts.poppins().toString()
                        ),
                        // Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: 140,
                        height: 30,
                        child: Text(
                          description,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontFamily: GoogleFonts.poppins().toString(),
                          ),
                          // Theme.of(context).textTheme.titleMedium,
                        ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
