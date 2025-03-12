import 'package:Dagi_Moses_Portfolio/functions/functions.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';


class Canteen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

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
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Mobile Application",
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
                        "Canteen App",
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
                      const Text(
                        "My Canteen Application is a mobile application created with flutter and firebase, that offers the automation of canteen services including, ordering and payment",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                        
                      Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                              ),
                              height: 48.0,
                              padding: const EdgeInsets.symmetric(horizontal: 28.0),
                              child: TextButton(
                                onPressed: () async {
                                  launchUrlFunction(
                                      'https://github.com/Dagi-Moses/canteen');
                                  
                                },
                                child: const Center(
                                  child: Text(
                                    "View Code",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                           const SizedBox(
                            width: 10.0,
                          ),
                             MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 48.0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28.0,
                              ),
                              child: TextButton(
                                onPressed: () {
                                   launchUrlFunction(
                                      'https://github.com/Dagi-Moses/canteen');
                                },
                                child: const Center(
                                  child: Text(
                                    "View App",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                         
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: SizedBox(
                    height: 350,
                    child: Image.asset(
                      'assets/canteen.png',
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
