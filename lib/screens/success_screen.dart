import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Success_Screen extends StatefulWidget {
  const Success_Screen({super.key});

  @override
  State<Success_Screen> createState() => _Success_ScreenState();
}

class _Success_ScreenState extends State<Success_Screen> {
  var website = Uri.parse('https://bdcoe.co.in/');
  var insta = Uri.parse('https://www.instagram.com/bdcoe/');
  var linkedin = Uri.parse(
      'https://www.linkedin.com/school/big-data-centre-of-excellence/mycompany/');
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff6f4f7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: SizedBox(
              //height: height * 0.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/Comp 1.json',
                  width: (width > 600) ? width * 0.08 : width * 0.1,
                  fit: BoxFit.fitWidth,
                  repeat: false),
            ],
          ),
          Container(
            width: width * 0.6,
            height: height * 0.2,
            //decoration: BoxDecoration(color: Colors.amber),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Congratulations !! \nYou have been registered successfully',
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.getFont(
                    "Ubuntu",
                    //fontSize: (width > 900) ? width * 0.1 : width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 70),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (() async {
                  await launchUrl(website);
                }),
                child: SvgPicture.asset(
                  "images/website.svg",
                  color: CupertinoColors.activeBlue,
                  height: (width > 800) ? 46 : 28,
                  width: (width > 800) ? 46 : 28,
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: GestureDetector(
                  onTap: (() async {
                    await launchUrl(insta);
                  }),
                  child: SvgPicture.asset(
                    "images/insta.svg",
                    height: (width > 800) ? 48 : 30,
                    width: (width > 800) ? 48 : 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() async {
                  await launchUrl(linkedin);
                }),
                child: SvgPicture.asset(
                  "images/linkedin.svg",
                  height: (width > 800) ? 48 : 30,
                  width: (width > 800) ? 48 : 30,
                ),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(
              //height: height * 0.2,
            ),
          ),
          Container(
            height: height * 0.013,
            //decoration: BoxDecoration(color: Colors.amber),
            child: Text(
              "Made with ♥ using Flutter",
              style: TextStyle(
                  fontSize: height * 0.01, letterSpacing: width * 0.003),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
        ],
      ),
    );
  }
}