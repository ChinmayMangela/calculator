
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class BuildText extends StatelessWidget {
  const BuildText({super.key, required this.text, required this.isBoldFont, required this.textSize,});

  final String text;
  final bool isBoldFont;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        color: giveTextColor(text, context, isDarkMode),
        fontWeight: isBoldFont ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }


  Color giveTextColor(String text, BuildContext context, bool isDarkMode) {
    if(text == 'Can\'t divide by 0' || text == 'Error') {
      return Theme.of(context).colorScheme.error;
    } else {
      return isDarkMode ? Colors.white : Colors.black;
    }
  }
}
