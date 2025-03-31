import 'package:Dagi_Moses_Portfolio/widgets/link_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';



String punchText =
    "The Punch Anniversary Demo, built with Flutter and Node.js replaces the previous crashed version with improved data management, SQL-to-MongoDB migration, automated two-week email reminders, and secure backups to Google Drive and local storage; This version highlights some key functionality, while the full system is securely deployed on Punch Nigeria’s internal servers.\nDemo username: admin,    password:admin";

class PunchDemo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, ref),
      tablet: _buildUi(kTabletMaxWidth, ref),
      mobile: _buildUi(getMobileMaxWidth(context), ref),
    );
  }

  Widget _buildUi(double width, ref) {
 

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: AspectRatio(
                    aspectRatio:
                        16 / 9, // Change to 4/5 or 3/4 for portrait images
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/punch_demo/punch_demo.png',
                        fit: BoxFit
                            .contain
                      ),
                    ),
                  ),
                ),
const SizedBox(width: 30,),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Web Application",
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
                        "Punch Anniversary Demo",
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
                       Text(
                       punchText,
                        style: const TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      const LinkButtons(gitHubUrl: 'https://github.com/Dagi-Moses/punch_demo', liveDemoUrl: 'https://punchdemo.vercel.app/',),
                    
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

