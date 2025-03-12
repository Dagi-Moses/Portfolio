import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/footer_item.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

List<FooterItem> footerItems = [
  FooterItem(
      iconPath: "assets/mappin.png",
      title: "ADDRESS",
      text1: "Akoka, Lagos",
      text2: "",
      onTap: () {},
      index: 0),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: "+234 815-586-0049",
    text2: "",
    index: 1,
    onTap: () async {
      final url = "tel:08155860049";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw "Could not launch phone dialer";
      }
    },
  ),
  FooterItem(
    index: 2,
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "dagitmoses@gmail.com",
    text2: "",
    onTap: () async {
      final emailAddress =
          "dagitmoses@gmail.com"; // Replace with your Gmail address
      final subject = "Flutter Opening"; // Replace with the email subject
      final body =
          "Hello Dagi i'd like to hire your services"; // Replace with the email body

      final url =
          "mailto:$emailAddress?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw "Could not launch Gmail";
      }
    },
  ),
  FooterItem(
    index: 3,
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+234 818-130-4896",
    text2: "",
    onTap: () async {
      final phoneNumber = "+2348181304896"; // Replace with your WhatsApp number
      final message =
          "Hello Moses i'd like to hire you services"; // Replace with the initial message you want to send

      final url = "https://wa.me/$phoneNumber?text=${message}";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw "Could not launch WhatsApp";
      }
    },
  ),
  FooterItem(
    index: 4,
    iconPath: "assets/linkedin.jpeg",
    title: "LINKEDIN",
    text1: "linkedin.com/in/dagi-moses-6aaab9252",
    text2: "",
    onTap: () async {
      const url =
          "https://linkedin.com/in/dagi-moses-6aaab9252"; // Replace with your URL

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    },
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => SizedBox(
                          height: 125.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                      color: kCaptionColor,
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                GestureDetector(
                                  onTap: footerItem.onTap,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        decoration: footerItem.index == 0
                                            ? TextDecoration.none
                                            : TextDecoration.underline,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: const TextStyle(
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${footerItem.text2}\n",
                                          style: const TextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2023 Dagi Moses. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
