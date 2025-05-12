import 'package:Dagi_Moses_Portfolio/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utils/constants.dart';
import '../../utils/globals.dart';
import '../../utils/screen_helper.dart';

class HeaderLogo extends ConsumerStatefulWidget {
  const HeaderLogo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderLogoState();
}

class _HeaderLogoState extends ConsumerState<HeaderLogo> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
    );
  }
}

class HeaderRow extends ConsumerStatefulWidget {
  const HeaderRow({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderRowState();
}

class _HeaderRowState extends ConsumerState<HeaderRow> {
  @override
  Widget build(BuildContext context) {
    final headerItems = ref.watch(headerItemsProvider);

    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
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

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
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
            const HeaderLogo(),
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
