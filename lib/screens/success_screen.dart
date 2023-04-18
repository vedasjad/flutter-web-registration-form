import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:townhall/constants/app_colors.dart';
import 'package:townhall/widgets/contact_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/Comp 1.json',
                width: (width > 900) ? width * 0.15 : width * 0.3,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          SizedBox(
              width: width * 0.6,
              height: height * 0.2,
              //decoration: BoxDecoration(color: Colors.amber),
              child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Congratulations !! \nYou have been registered successfully.',
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.getFont(
                        "Ubuntu",
                        // fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  ),
              ),
          const ContactWidget(),
        ],
      ),
    );
  }
}
