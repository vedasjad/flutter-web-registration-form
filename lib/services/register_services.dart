import 'dart:convert';
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

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://bdcoeregistration.onrender.com/v1/register');

      var res = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(user.toJson()),
      );

      http.Response loginResponseModel = res;

    httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials',
            );
          });

    } catch (e) {
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }
}
