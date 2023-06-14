import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class EditProfileItem extends StatelessWidget {
  const EditProfileItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.value,
      required this.isEdited})
      : super(key: key);
  final Icon icon;
  final String title;
  final String value;
  final bool isEdited;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          color: isDarkMode ? darkBackgroundColor : (isEdited ? lightBackgroundColor : greyColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isEdited ? primaryColor : greyColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode ? darkTextColor2 : lightTextColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: isDarkMode ? darkTextColor2 : lightTextColor,
                    ),
                  ),
                  isEdited == true
                      ?  Icon(
                          Icons.edit,
                          size: 24,
                          color: isDarkMode ? darkTextColor2 : lightTextColor,
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
