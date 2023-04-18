import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(
                    Uri.parse('tel:1234567890'));
              },
              child: Image.asset(
                "images/call.png",
                color: Colors.white,
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(
                    Uri.parse(
                        'https://www.bdcoe.co.in'),
                    mode: LaunchMode
                        .externalApplication);
              },
              child: Image.asset(
                "images/website.png",
                color: Colors.white,
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(
                    Uri.parse(
                        'https://www.instagram.com/bdcoe/'),
                    mode: LaunchMode
                        .externalApplication);
              },
              child: Image.asset(
                "images/insta.png",
                color: Colors.white,
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(
                    'mailto: bdcoe@akgec.ac.in'));
              },
              child: Image.asset(
                "images/mail.png",
                color: Colors.white,
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
