import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';
import '../home.dart';

class IosAppAd extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, ref),
        tablet: _buildUi(kTabletMaxWidth, ref),
        mobile: _buildUi(getMobileMaxWidth(context), ref),
      ),
    );
  }


  Widget _buildUi(double width, ref) {
    final scrollToSection = ref.read(scrollToSectionProvider);
    final keys = ref.read(keysProvider);
    List<String> imagesList = [
'assets/geoflix/calendar.jpg',
'assets/geoflix/dashboard.jpg',
'assets/geoflix/geoflix.jpg',
'assets/geoflix/login.jpeg',
'assets/geoflix/make_attendance.jpg',
  
  // Add more image paths or URLs here
];
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: SizedBox(
                      height: 350,
                      // child: Image.asset(
                      //   "assets/geoflix.jpg",
                      //   // Set width for image on smaller screen
                      //   width: constraints.maxWidth > 720.0 ? null : 350.0,
                      // ),
                      child:CarouselSlider(
      options: CarouselOptions(
     // Set the height of the carousel
        enlargeCenterPage: true, // Increase the size of the center item
        autoPlay: true, // Enable auto-play
        autoPlayInterval: Duration(seconds: 3), // Set auto-play interval
        autoPlayAnimationDuration: Duration(milliseconds: 800), // Set animation duration
        autoPlayCurve: Curves.fastOutSlowIn, // Set animation curve
      ),
      items: imagesList.map((e) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
               e,
              width: constraints.maxWidth > 720.0 ? null : 350.0,
              
              fit: BoxFit.cover,
            );
          },
        );
      }).toList(),),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Mobile Application",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Geo Flix",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Geo Flix is a human resource attendance management application that makes use of google map and geofencing to track employee attendance",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
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
                                padding: EdgeInsets.symmetric(horizontal: 28.0),
                                child: TextButton(
                                  onPressed: ()async {
                                         const url =
                                      'https://github.com/Dagi-Moses/project'; // Replace with your URL

                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                  },
                                  child: Center(
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
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
