import 'package:flutter/material.dart';
import 'package:townhall/screens/phone_reg_screen.dart';

import 'desktop_reg_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (width>600)?const DesktopRegScreen():const PhoneRegistrationScreen();
  }
}
