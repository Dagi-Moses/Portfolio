import 'package:Dagi_Moses_Portfolio/widgets/link_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class CanteenDelivery extends StatelessWidget {
  CanteenDelivery({super.key}); 

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  String punchText =
      "Node-Tech Canteen Delivery is a driver app for handling canteen orders. Built with Flutter and a Node.js server, it lets drivers accept and deliver orders with ease. It includes order notifications, Google Maps integration for navigation, and multi-language support. The app based on an existing system, was integrated to work with the Node-Tech Canteen system and enhance users experience.\nDemo login: user@gmail.com,    password:user11";


  Widget _buildUi(double width) {
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
                        "Node-Tech Canteen Delivery",
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

                      const LinkButtons(gitHubUrl:  'https://github.com/Dagi-Moses/canteen_delivery', liveDemoUrl: "https://appetize.io/embed/b_pfqx6pbnawvevjxwljvuxsrxsu"),
                      
                   
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
                      'assets/canteen_delivery/canteen_delivery.png',
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
