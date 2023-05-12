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
        width: ((MediaQuery.of(context).size.width - 40)/2),
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
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.asset(
            //     imageUrl,
            //     width: 140,
            //     height: 140,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              width: ((MediaQuery.of(context).size.width - 40)/2) - 20,
              height: ((MediaQuery.of(context).size.width - 40)/2) - 50,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(imageUrl,), fit: BoxFit.fill)
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: lightTextColor,
                        fontFamily: GoogleFonts.poppins().toString()
                    ),
                    // Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Container(
                      width: 130,
                      height: 30,
                      child: Text(
                        description,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontFamily: GoogleFonts.poppins().toString(),
                        ),
                        // Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
