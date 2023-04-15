import 'package:townhall/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import '../models/student.dart';
import 'package:townhall/utils/error_handling.dart';
import 'package:http/http.dart' as http;

var client = http.Client();

class RegisterService {
  void registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String rollno,
    required String year,
    required String branch,
    required String section,
    required String phone,
    required List<dynamic> domain,
    required String reCaptcha,
  }) async {
    try {
      //debugPrint("cp2");
      User user = User(
        name: name,
        email: email,
        year: year,
        rollno: rollno,
        branch: branch,
        section: section,
        phone: phone,
        domain: domain,
        reCaptcha: reCaptcha,
      );
      //debugPrint("cp3");
      debugPrint(user.toJson());
      http.Response res = await http.post(
        Uri.parse('https://bdcoeregistration.onrender.com/v1/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

     // debugPrint("cp4");

      debugPrint(res.body);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Congrats! You have been registered.',
            );
          });

    } catch (e) {
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }
}
