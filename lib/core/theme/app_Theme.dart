import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
          
          textTheme: TextTheme(
        titleMedium: GoogleFonts.almarai(
          color: AppColors.secondaryTextColor,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
color: Color(0xFF242424),
fontSize: 20,
fontFamily: 'Zen Kaku Gothic Antique',
fontWeight: FontWeight.w700,

),
        labelLarge: GoogleFonts.almarai(
          color: AppColors.primaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        labelMedium:  TextStyle(
color: Colors.grey,
fontSize: 12.80,
fontFamily: 'Zen Kaku Gothic Antique',
fontWeight: FontWeight.w400,

),
        labelSmall: GoogleFonts.almarai(
          color: AppColors.sexthTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
color: Colors.white,
fontSize: 18,
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w700,),
        //special orange text color
        bodyLarge: TextStyle(
color: Colors.white,
fontSize: 32,
fontFamily: 'SF Pro Display',
fontWeight: FontWeight.w700,

),//
        bodySmall:TextStyle(
color: Color(0xFFF5F5F5),
fontSize: 10,
fontFamily: 'Zen Kaku Gothic Antique',
fontWeight: FontWeight.w100,

),
        displaySmall:  GoogleFonts.almarai(
          color: AppColors.sexthTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.almarai(
          color: AppColors.secondaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),//grad view text
        displayLarge: GoogleFonts.almarai(
          color: AppColors.sexthTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),//details text
         
        
      ));
}
