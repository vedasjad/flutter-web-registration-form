import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townhall/models/student.dart';
import '../constants/app_colors.dart';

Widget rateDomain(String domain, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return (width > 1100)
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              domain,
              style: GoogleFonts.getFont(
                'Ubuntu',
                fontSize: height * 0.025,
                color: AppColors.backColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            RatingBar.builder(
              itemSize: height * 0.035,
              tapOnlyMode: true,
              updateOnDrag: false,
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 3,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                debugPrint('hello');
                if (domain == 'Web Development') {
                  Student.domain[0] = rating;
                  debugPrint(Student.domain[0].toString());
                } else if (domain == 'App Development') {
                  Student.domain[1] = rating;
                } else if (domain == 'Machine Learning') {
                  Student.domain[2] = rating;
                } else if (domain == 'Big Data') {
                  Student.domain[3] = rating;
                } else {
                  Student.domain[4] = rating;
                }
              },
            ),
          ],
        )
      : (width>600)?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              domain,
              style: GoogleFonts.getFont(
                'Ubuntu',
                fontSize: height * 0.03,
                color: (width>600)?AppColors.backColor:AppColors.whiteColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            RatingBar.builder(
              itemSize: height * 0.03,
              tapOnlyMode: true,
              updateOnDrag: false,
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 3,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              // unratedColor: (width>600)?AppColors.backColor:AppColors.textFieldColorPhone,
              onRatingUpdate: (rating) {
                if (domain == 'Web Development') {
                  Student.domain[0] = rating;
                  debugPrint(Student.domain[0].toString());
                } else if (domain == 'App Development') {
                  Student.domain[1] = rating;
                } else if (domain == 'Machine Learning') {
                  Student.domain[2] = rating;
                } else if (domain == 'Big Data') {
                  Student.domain[3] = rating;
                } else {
                  Student.domain[4] = rating;
                }
              },
            ),
          ],
        )
      :Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        domain,
        style: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: width * 0.05,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w300,
        ),
      ),
      RatingBar.builder(
        itemSize: width * 0.065,
        tapOnlyMode: true,
        updateOnDrag: false,
        initialRating: 0,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 3,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          debugPrint('hello');
          if (domain == 'Web Development') {
            Student.domain[0] = rating;
            debugPrint(Student.domain[0].toString());
          } else if (domain == 'App Development') {
            Student.domain[1] = rating;
          } else if (domain == 'Machine Learning') {
            Student.domain[2] = rating;
          } else if (domain == 'Big Data') {
            Student.domain[3] = rating;
          } else {
            Student.domain[4] = rating;
          }
        },
      ),
    ],
  );
}
