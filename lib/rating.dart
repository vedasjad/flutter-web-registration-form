import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

Widget rateDomain(String domain, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return (width>1100)?Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        domain,
        style: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: height * 0.03,
          color: AppColors.backColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      RatingBar.builder(
        itemSize: height * 0.05,
        initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 3,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          debugPrint(rating as String?);
        },
      ),
    ],
  ):Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        domain,
        style: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: height * 0.03,
          color: AppColors.backColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      RatingBar.builder(
        itemSize: height * 0.05,
        initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 3,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          debugPrint(rating as String?);
        },
      ),
    ],
  );
}
