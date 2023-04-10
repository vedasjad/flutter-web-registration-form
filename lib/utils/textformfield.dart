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
    double width,
) {
  return Container(
    margin: EdgeInsets.all(fontSize * 0.6),
    // padding: EdgeInsets.all(fontSize * 0.7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: (width > 600)? AppColors.textFieldColor : AppColors.textFieldColorPhone,
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
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: (width>600)?AppColors.backColor:AppColors.whiteColor,
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
          color: (width>600)?AppColors.backColor:AppColors.whiteColor,
          fontWeight: FontWeight.w400,
        ),
        hintText: 'Enter $labelText',
        hintStyle: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: fontSize,
          color: AppColors.hintColor,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(height: 0),
      ),
      style: GoogleFonts.getFont(
        'Ubuntu',
        fontSize: fontSize,
        color: (width>600)?AppColors.backColor:AppColors.whiteColor,
        fontWeight: FontWeight.w300,
      ),
      cursorColor: (width>600)?AppColors.backColor:AppColors.whiteColor,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      validator: validator,
    ),
  );
}