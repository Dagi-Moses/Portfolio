import 'package:Dagi_Moses_Portfolio/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewRepoText extends StatelessWidget {
  const ViewRepoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "OR",
            style: TextStyle(color: Colors.white, height: 1.8, fontSize: 16),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        const url =
                            'https://github.com/Dagi-Moses'; // Replace with your URL

                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    text: "View my Git Hub Repository",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: kPrimaryColor,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      height: 1.8,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
