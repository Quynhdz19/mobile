import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class LearnWidgetsBox extends StatelessWidget {
  const LearnWidgetsBox(
      {Key? key,
        required this.imageUrl,
        required this.title,
        required this.description,
        this.onPressed
      })
      : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final GestureTapCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 20,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color:primaryColor, width: 1),
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  width: MediaQuery.of(context).size.width - 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: lightTextColor,
                            fontFamily: GoogleFonts.poppins().toString()
                        ),
                        // Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontFamily: GoogleFonts.poppins().toString()
                        ),
                        // Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 150,
              // height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.fitWidth),
              ),
            ),

          ],
        ),
      ),
    );
  }
}