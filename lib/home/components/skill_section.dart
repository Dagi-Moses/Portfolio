import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/skill.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Flutter",
    percentage: 100,
  ),
  Skill(
    skill: "Node Js",
    percentage: 100,
  ),
  Skill(
    skill: "Mongo DB",
    percentage: 100,
  ),
  Skill(
    skill: "Firebase",
    percentage: 100,
  ),
  Skill(
    skill: "React Native",
    percentage: 80,
  ),
  Skill(
    skill: "React.js",
    percentage: 80,
  ),
  Skill(
    skill: "XML",
    percentage: 50,
  ),
  Skill(
    skill: "Java",
    percentage: 50,
  ),
  Skill(
    skill: "IT Networking",
    percentage: 100,
  ),
];

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

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
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/mypic.jpg",
                    width: 300.0,
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: ScreenHelper.isMobile(context) ? 15 : 0,
                      ),
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: Text(skill.skill),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: const Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
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
