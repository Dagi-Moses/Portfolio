import 'package:Dagi_Moses_Portfolio/auth/authProvider.dart';
import 'package:Dagi_Moses_Portfolio/providers/scrollProvider.dart';
import 'package:Dagi_Moses_Portfolio/screens/login.dart';
import 'package:Dagi_Moses_Portfolio/widgets/dialogs/confirmLogout.dart';
import 'package:Dagi_Moses_Portfolio/widgets/dropDownNav.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/header_item.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';
import '../../utils/screen_helper.dart';


List<HeaderItem> ?headerItems   = [
      HeaderItem(
          title: "MY INTRO",
          onTap: () {
           
          }),
      HeaderItem(
          title: "SERVICES",
          onTap: () {
          
          }),
      HeaderItem(
          title: "PORTFOLIO",
          onTap: () {
            
          }),
      HeaderItem(
        title: "EDUCATION",
        onTap: () {},
      ),
      HeaderItem(title: "SKILLS", onTap: () {}),
      HeaderItem(title: "TESTIMONIALS", onTap: () {}),
      HeaderItem(
        title: "HIRE ME",
        onTap: () {},
        isButton: true,
      ),
    ];

class HeaderLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {
  
  @override
  Widget build(BuildContext context) {
         final auth = Provider.of<AuthProvider>(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showTopLeftDialog(context, () {
              logOut(context, auth.signOut(context));
            },
          ); 
          // Navigator.push(context, MaterialPageRoute(builder: (_){

          //   return  LoginScreen();
          // }));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "M",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ".",
                style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {

 @override
  void initState() {
    super.initState();
    final scrollProvider =
        Provider.of<ScrollControllerProvider>(context, listen: false);
        final keys = scrollProvider.keys;
   setState(() {
    headerItems = [
      HeaderItem(
          title: "MY INTRO",
          onTap: () {
           scrollProvider.scrollToSection(keys[1]);
          }),
      HeaderItem(
          title: "SERVICES",
          onTap: () {
            scrollProvider.scrollToSection(keys[2]);
          }),
      HeaderItem(
          title: "PORTFOLIO",
          onTap: () {
            scrollProvider.scrollToSection(keys[3]);
          }),
      HeaderItem(
        title: "EDUCATION",
        onTap: () {
         scrollProvider.scrollToSection(keys[4]);
        },
      ),
      HeaderItem(title: "SKILLS", onTap: () {
         scrollProvider.scrollToSection(keys[5]);
      }),
      HeaderItem(title: "TESTIMONIALS", onTap: () {
        scrollProvider.scrollToSection(keys[6]);
      }),
      HeaderItem(
        title: "HIRE ME",
        onTap: () {
          scrollProvider.scrollToSection(keys[7]);
        },
        isButton: true,
      ),
    ];
 
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems!
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      // We will make this in a bit
      mobile: buildMobileHeader(),
      tablet: buildHeader(),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState!.openEndDrawer();
              },
              child: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
