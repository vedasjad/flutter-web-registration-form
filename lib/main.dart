import 'package:flutter/material.dart';
import 'package:townhall/splash_screen.dart';
// import 'package:g_recaptcha_v3/g_recaptcha_v3_web.dart';
// import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await GRecaptchaV3.ready('6Lfzy4glAAAAALddg_vG5fyhahVFsWxesIaCfphJ');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TownHall',
      home: SplashScreen(),
    );
  }
}