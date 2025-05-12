import 'package:Dagi_Moses_Portfolio/utils/constants.dart';
import 'package:Dagi_Moses_Portfolio/widgets/link_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';

class ProjectText extends StatelessWidget {
  const ProjectText({
    super.key,
    required this.platform,
    required this.projectName,
    required this.projectDescription,
    required this.gitHubUrl,
    required this.liveDemoUrl,
    required this.constraints,
  });

  final AppPlatform platform;
  final String projectName;
  final String projectDescription;
  final String gitHubUrl;
  final String liveDemoUrl;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: constraints.maxWidth > 720.0 ? 1 : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            platform.label,
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            projectName,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Html(
            data: projectDescription,
            style: {
              "body": Style(
                color: kCaptionColor,
                lineHeight: const LineHeight(1.5),
                fontSize: FontSize(15.0),
                textAlign: TextAlign.justify,
              ),
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          LinkButtons(gitHubUrl: gitHubUrl, liveDemoUrl: liveDemoUrl),
          const SizedBox(
            height: 70.0,
          )
        ],
      ),
    );
  }
}
