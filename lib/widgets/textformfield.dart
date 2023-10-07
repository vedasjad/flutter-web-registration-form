import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

textFormField(
  TextEditingController controller,
  TextInputAction textInputAction,
  TextInputType keyboardType,
  String labelText,
  String? Function(String?)? validator,
  double fontSize,
  double width,
  FocusNode focusNode,
  String selectedNode,
) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: fontSize * 0.6,
      vertical: fontSize * 0.7,
    ),
    // padding: EdgeInsets.fromLTRB(
    //   fontSize * 0.4,
    //   fontSize * 0.3,
    //   fontSize * 0.4,
    //   fontSize * 0.3,
    // ),
    decoration: BoxDecoration(
      color: (width > 710)
          ?AppColors.textFieldColor
          :AppColors.textFieldColor,
      // border: Border.all(
      //   color: (selectedNode == labelText)
      //       ? (width>710)?AppColors.backColor:AppColors.whiteColor
      //       : Colors.transparent,
      //   width: 2,
      // ),
      borderRadius: BorderRadius.circular(8),
      // color: AppColors.textFieldColor,
    ),
    // height: fontSize * 2.5,
    child: TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      cursorColor: AppColors.backColor,
      decoration: InputDecoration(
        filled: false,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: (width>710)?Colors.red:Colors.red,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: AppColors.backColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
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
          fontWeight: FontWeight.w300,
        ),
        // hintText: 'Enter $labelText',
        // hintStyle: GoogleFonts.getFont(
        //   'Ubuntu',
        //   fontSize: fontSize,
        //   color: AppColors.hintColor,
        //   fontWeight: FontWeight.w400,
        // ),
        errorStyle: GoogleFonts.getFont(
          'Ubuntu',
          // fontSize: fontSize,
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: GoogleFonts.getFont(
        'Ubuntu',
        fontSize: fontSize,
        color: AppColors.backColor,
        fontWeight: FontWeight.w300,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    ),
  );
}
