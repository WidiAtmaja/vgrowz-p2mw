import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 5, 26, 29);
  static const Color secondary = Color.fromARGB(255, 15, 38, 35);
  static const Color tertiary = Color.fromARGB(255, 10, 51, 46);
  static const Color bgcard = Color.fromARGB(255, 8, 33, 35);
  static const Color drawer = Color.fromARGB(255, 17, 112, 101);
  static const Color button = Color.fromARGB(255, 4, 87, 77);
  static const Color drawerIcon = Color.fromARGB(255, 23, 163, 107);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
}

class IconColors {
  static const Color primary = Color.fromARGB(255, 12, 197, 166);
}

class TextColor {
  static const Color primary = Color.fromARGB(255, 78, 222, 174);
  static const Color secondary = Color.fromARGB(255, 49, 139, 153);
}

class TextStyles {
  static final TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 12, 197, 166),
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: TextColor.secondary,
  );

  static final TextStyle status = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 250, 255, 255),
  );

  static final TextStyle lembab = GoogleFonts.poppins(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 89, 224, 224),
  );

  static final TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );
}
