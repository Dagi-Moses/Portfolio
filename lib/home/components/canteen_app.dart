import 'package:Dagi_Moses_Portfolio/widgets/link_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';




class CanteenApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }
String punchText =
      "Node-Tech Canteen is a simple and efficient canteen management system built with Flutter and a Node.js server. It allows users to browse the menu, place orders, and track them. With Google Maps integration and  a multi-language support makes the platform accessible to a wider audience. The system includes basic user authentication, order history, and an admin panel for managing menu items and processing orders. Currently, ordering is only available in Lagos, where the virtual shop is located";
  Widget _buildUi(double width) {
   
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: constraints.maxWidth > 720
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MOBILE APPLICATION",
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
                        "Node-Tech Canteen",
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
                        const LinkButtons(
                        gitHubUrl: 'https://github.com/Dagi-Moses/canteen',
                        liveDemoUrl:
                            'https://appetize.io/embed/b_c6ca3zeolhcqkxxox3i2tu6foy',
                      ),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                   child: SizedBox(
                    height: 350,
                    child: Image.asset(
                      'assets/canteen/canteen.png',
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                    ),
                 
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
