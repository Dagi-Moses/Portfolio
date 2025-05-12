import 'package:Dagi_Moses_Portfolio/home/components/certifications.dart';
import 'package:Dagi_Moses_Portfolio/home/components/projects.dart';

import 'package:Dagi_Moses_Portfolio/utils/projects.dart';
import 'package:Dagi_Moses_Portfolio/widgets/more_projects_text.dart';
import 'package:Dagi_Moses_Portfolio/widgets/view_repo_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';
import '../utils/globals.dart';
import '../utils/screen_helper.dart';
import 'components/carousel.dart';
import 'components/cv_section.dart';
import 'components/education_section.dart';
import 'components/footer.dart';
import 'components/header.dart';

import 'components/portfolio_stats.dart';
import 'components/skill_section.dart';
import 'components/testimonial_widget.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    final scrollController = ref.read(scrollControllerProvider);
    final keys = ref.read(keysProvider); // 👈 CACHE this once!
    final headerItems = ref.watch(headerItemsProvider);

    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        onTap: headerItems[index].onTap,
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            Container(key: keys[0], child: Carousel()),
            const SizedBox(
              height: 20.0,
            ),
            Container(key: keys[1], child: CvSection()),
            ListView.builder(
              key: keys[2],
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              //  padding: const EdgeInsets.symmetric(horizontal: 35),
              itemCount: ProjectText.projectNames.length,
              itemBuilder: (context, index) {
                final isLast = index == ProjectText.projectNames.length - 1;

                return Column(
                  children: [
                    Projects(
                      projectDescription:
                          ProjectText.projectDescriptions[index],
                      gitHubUrl: ProjectText.projectGitHubUrls[index],
                      liveDemoUrl: ProjectText.projectLiveDemoUrls[index],
                      assetImage: ProjectText.assetImages[index],
                      platform: ProjectText.platforms[index],
                      projectName: ProjectText.projectNames[index],
                      index: index,
                    ),
                    if (!isLast)
                      const SizedBox(
                          height:
                              70.0), // 👈 spacing between, but not after last
                  ],
                );
              },
            ),
            SizedBox(
              height: ScreenHelper.isMobile(context) ? 0 : 50.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const MoreProjectsText(),
            //const ViewRepoText(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Container(key: keys[3], child: const PortfolioStats()),
            ),
            const SizedBox(
              height: 50.0,
            ),

            Container(key: keys[5], child: const EducationSection()),
            const SizedBox(
              height: 50.0,
            ),
            Container(key: keys[4], child: const Certifications()),
            SizedBox(
              height: ScreenHelper.isMobile(context) ? 0 : 50.0,
            ),
            Container(key: keys[6], child: const SkillSection()),
            const SizedBox(
              height: 50.0,
            ),
            Container(key: keys[7], child: const TestimonialWidget()),
            Container(key: keys[8], child: const Footer()),
          ],
        ),
      ),
    );
  }
}
