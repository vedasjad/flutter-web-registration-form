import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townhall/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import '../models/student.dart';
import 'package:http/http.dart' as http;
import '../screens/success_screen.dart';

class RegisterService {
  Future registerUser({
    required BuildContext context,
    required User user,
  }) async {
    try {
      //debugPrint("cp2");

      //debugPrint("cp3");
      debugPrint(user.toJson());

      http.Response res = await http.post(
        Uri.parse('https://bdcoeregistration.onrender.com/v1/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      debugPrint(res.statusCode.toString());
      debugPrint(jsonDecode(res.body).toString());

      (res.statusCode == 201)
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const Success_Screen(),
              ),
              (Route<dynamic> route) => false,
            )
          : (jsonDecode(res.body).toString() == "Email already exists")
              ? showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      insetPadding: EdgeInsets.all(10),
                      content: Text(
                        "This email has already been registered!!",
                        style: GoogleFonts.getFont(
                          'Ubuntu',
                        ),
                      ),
                    );
                  })
              : showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      insetPadding: EdgeInsets.all(10),
                      content: Text(
                        "Oops! An Error Occurred",
                        style: GoogleFonts.getFont(
                          'Ubuntu',
                        ),
                      ),
                    );
                  });
    } catch (e) {
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }
}
