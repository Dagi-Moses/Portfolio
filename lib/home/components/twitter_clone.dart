import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class WebsiteAd extends StatelessWidget {
  // We can use same idea as ios_app_ad.dart and swap children order, let's copy code
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    List<String> imagesList = [
        'assets/twitter/dashboard.png',
        'assets/twitter/login.png',
        'assets/twitter/profile.png',
        'assets/twitter/profile2.png',
        'assets/twitter/signup.png',
        'assets/twitter/twitterclone.png',
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "TWITTER CLONE\n",
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
                          "Twitter clone is a full stack fully functional imitiation of the popular Twitter application. It was done as a personal project and includes features like: posting, liking and commenting tweets, one to one chatting, searching for users and tweet, 'follow' notification, profile update etc.",
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
                                  onPressed: () async {
                                    const url =
                                        'https://github.com/Dagi-Moses/twitter-clone'; // Replace with your URL

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
                        ),
                        SizedBox(
                          height: 70.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                     child: SizedBox(
                      height: 350,
                      child: Image.asset(
                        'assets/twitterclone.png',
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                      // child: CarouselSlider(
                      //   options: CarouselOptions(
                      //     //  height: 200, // Set the height of the carousel
                      //     enlargeCenterPage:
                      //         true, // Increase the size of the center item
                      //     autoPlay: true, // Enable auto-play
                      //     autoPlayInterval:
                      //         Duration(seconds: 3), // Set auto-play interval
                      //     autoPlayAnimationDuration: Duration(
                      //         milliseconds: 800), // Set animation duration
                      //     autoPlayCurve:
                      //         Curves.fastOutSlowIn, // Set animation curve
                      //   ),
                      //   items: imagesList.map((e) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return Image.network(
                      //           width:
                      //               constraints.maxWidth > 720.0 ? null : 350.0,
                      //           e, // Replace with Image.network(imageUrl) for loading from URLs
                      //           fit: BoxFit.cover,
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
