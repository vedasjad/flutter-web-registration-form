import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:townhall/config/config.dart';
import '../models/student.dart';

class RecaptchaService {

  RecaptchaService._();

  static Future<void> initiate() async =>
      await GRecaptchaV3.ready(Config.siteKey);


  static Future<void> getToken() async {
    Student.reCaptcha = await GRecaptchaV3.execute('submit') ?? '';
  }

}
