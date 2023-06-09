import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_front_end/utils/constants.dart';

class TopicBox extends StatelessWidget {

  const TopicBox({Key? key, required this.widthBox, required this.topic, this.onTab, required category}) : super(key: key);


  final topic;
  final double widthBox;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: widthBox,
        height: 100,
        decoration: BoxDecoration(
            color: lightBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1))
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
                    image: AssetImage(topic["image"]),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  topic["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                      fontFamily: GoogleFonts.poppins().toString()
                  ),
                  // Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  topic["description"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: lightTextColor,
                      fontFamily: GoogleFonts.poppins().toString()
                  ),
                  // Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${topic["word"]} word",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
