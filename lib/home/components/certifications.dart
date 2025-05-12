import 'package:Dagi_Moses_Portfolio/models/certification.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

final List<Certification> certificationList = [
  Certification(
    title: "Getting started with NodeJS",
    issuer: "Simplilearn",
    date: "May 2025",
    link: "https://shorturl.at/JPJPE",
  ),
  Certification(
    title: "CompTIA Network+ (N10-008) Cert Preparation",
    issuer: "Cybrary",
    date: "May 2025",
    link: "",
  ),
];

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Certifications",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 40.0),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: certificationList.map(
                    (cert) {
                      return SizedBox(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cert.title,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "${cert.issuer} ",
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "${cert.date} ",
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            if (cert.link.isNotEmpty)
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => _launchURL(cert.link),
                                  child: Text(
                                    cert.link,
                                    style: const TextStyle(
                                      color: Colors.greenAccent,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height:
                                  ScreenHelper.isMobile(context) ? 15 : 40.0,
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle error (optional)
      debugPrint('Could not launch $url');
    }
  }
}
