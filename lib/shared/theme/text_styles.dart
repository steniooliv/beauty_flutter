import 'package:beauty_flutter/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final titleHome = GoogleFonts.elsieSwashCaps(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
  );
  static final titlePage = GoogleFonts.varelaRound(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
  );
  static final quoteText = GoogleFonts.tinos(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
    fontStyle: FontStyle.italic,
  );
  static final inputText = GoogleFonts.varelaRound(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.inputText,
  );
  static final buttonText = GoogleFonts.varelaRound(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
  );
}
