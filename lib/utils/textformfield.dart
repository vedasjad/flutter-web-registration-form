import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

textFormField(
  TextEditingController controller,
    TextInputAction textInputAction,
    TextInputType keyboardType,
  String labelText,
  String? Function(String?)? validator,
    double fontSize,
) {
  return Container(
    margin: EdgeInsets.all(fontSize * 0.6),
    // padding: EdgeInsets.all(fontSize * 0.7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    // height: fontSize * 2.5,
    child: TextFormField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autofocus: true,
      textCapitalization:
      TextCapitalization.words,
      decoration: InputDecoration(
        filled: false,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: AppColors.backColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: fontSize,
          color: AppColors.backColor,
          fontWeight: FontWeight.w600,
        ),
        hintText: 'Enter $labelText',
        hintStyle: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: fontSize,
          color: AppColors.hintColor,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: const TextStyle(height: 0),
      ),
      style: GoogleFonts.getFont(
        'Ubuntu',
        fontSize: fontSize,
        color: AppColors.backColor,
        fontWeight: FontWeight.w300,
      ),
      cursorColor: AppColors.backColor,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      validator: validator,
    ),
  );
}