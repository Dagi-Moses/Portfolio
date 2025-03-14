import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:universal_html/html.dart' as html;

import '../../models/design_process.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "A full stack all round designer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "DEVELOP",
    imagePath: "assets/develop.png",
    subtitle:
        "A full stack all round developer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "WRITE",
    imagePath: "assets/write.png",
    subtitle:
        "A full stack all round writer thay may or may not include a guide for specific creative",
  ),
  DesignProcess(
    title: "PROMOTE",
    imagePath: "assets/promote.png",
    subtitle:
        "A full stack allround promoter thay may or may not include a guide for specific creative",
  ),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
                  children: [
                Text(
                  "BETTER DESIGN,",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  " BETTER EXPERIENCES",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                  ],
            ),
          
            Flex(
               crossAxisAlignment: CrossAxisAlignment.start,
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () async {
                    var bytes = await rootBundle
                        .load("assets/mycv.pdf"); // location of your asset file

                    final blob = html.Blob([bytes], 'application/pdf');
                    final url = html.Url.createObjectUrlFromBlob(blob);
                    html.window.open(url, "_blank");
                    html.Url.revokeObjectUrl(url);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "VIEW CV",
                      style: GoogleFonts.oswald(
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                    const SizedBox(
                  height: 10,
                  width: 45,
                ),
                GestureDetector(
                  onTap: () async {
                    var bytes = await rootBundle
                        .load("assets/mycv.pdf"); // location of your asset file

                    final blob = html.Blob([bytes], 'application/pdf');
                    final url = html.Url.createObjectUrlFromBlob(blob);

                    // Create an anchor element
                    final anchor = html.AnchorElement(href: url)
                      ..setAttribute("download",
                          "Dagi Moses Resume.pdf") // Set the filename for the downloaded file
                      ..click(); // Simulate a click on the anchor to trigger the download

                    html.Url.revokeObjectUrl(url);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ]),
          const SizedBox(
            height: 50.0,
          ),
          LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                  
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                          ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2.0
                      : 320.0,
                  // Hack to adjust child height
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 1
                      : MediaQuery.of(context).size.aspectRatio * 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            designProcesses[index].imagePath,
                            width: 40.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            designProcesses[index].title,
                            style: GoogleFonts.oswald(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        designProcesses[index].subtitle,
                        style: const TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  );
                },
                itemCount: designProcesses.length,
              );
            },
          )
        ],
      ),
    );
  }
}
