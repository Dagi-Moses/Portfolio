import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/education.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    degree: "Bsc, Computer Science",
    institution: "Nnamdi Azikiwe University, Awka.",
    linkName: "tm.dagi@stu.unizik.edu.ng",
    period: "2018 - 2023",
  ),
];

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: educationList
                      .map(
                        (education) => SizedBox(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                education.degree,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                education.institution,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                education.linkName,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height:
                                    ScreenHelper.isMobile(context) ? 15 : 40.0,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
