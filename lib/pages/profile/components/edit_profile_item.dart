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
    return Container(
      decoration: BoxDecoration(
          color: isEdited ? const Color(0xFFE3F2FD) : const Color(0xFFD6D6D6),
          borderRadius: BorderRadius.circular(10),

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
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: lightTextColor,
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
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: lightTextColor,
                    ),
                  ),
                  isEdited == true
                      ? const Icon(
                          Icons.edit,
                          size: 24,
                          color: lightTextColor,
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
