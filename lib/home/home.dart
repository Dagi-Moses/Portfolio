import 'package:Dagi_Moses_Portfolio/models/projects.dart';
import 'package:Dagi_Moses_Portfolio/providers/scrollProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/header_item.dart';
import '../utils/constants.dart';
import '../utils/globals.dart';
import '../utils/screen_helper.dart';
import 'components/carousel.dart';
import 'components/cv_section.dart';
import 'components/education_section.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/geoflix_app.dart';
import 'components/portfolio_stats.dart';
import 'components/skill_section.dart';
import 'components/testimonial_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isMobile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollToSection =
          Provider.of<ScrollControllerProvider>(context, listen: false);
      final keys = scrollToSection.keys;

      setState(() {
        headerItems = [
          HeaderItem(
              title: "MY INTRO",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[1]);
              }),
          HeaderItem(
              title: "SERVICES",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[2]);
              }),
          HeaderItem(
              title: "PORTFOLIO",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[3]);
              }),
          HeaderItem(
              title: "EDUCATION",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[4]);
              }),
          HeaderItem(
              title: "SKILLS",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[5]);
              }),
          HeaderItem(
              title: "TESTIMONIALS",
              onTap: () {
                if (isMobile) {
                  Navigator.pop(context);
                }
                scrollToSection.scrollToSection(keys[6]);
              }),
          HeaderItem(
            title: "HIRE ME",
            onTap: () async {
              scrollToSection.scrollToSection(keys[7]);
            },
            isButton: true,
          ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    isMobile = screenSize.width < 720;
    final scrollProvider = Provider.of<ScrollControllerProvider>(context);
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        width: screenSize.width / 2.2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems![index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems![index].onTap,
                            child: Text(
                              headerItems![index].title,
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
                        onTap: headerItems![index].onTap,
                        title: Text(
                          headerItems![index].title,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems!.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollProvider.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: scrollProvider.keys[0],
              child: Header(),
            ),
            Container(key: scrollProvider.keys[1], child: Carousel()),
            const SizedBox(
              height: 20.0,
            ),
            Container(key: scrollProvider.keys[2], child: CvSection()),
        Container(
              key: scrollProvider.keys[3],
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('projects')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // Check if snapshot has no data or an error occurred
                  // if (!snapshot.hasData || snapshot.hasError) {
                  //   return const SizedBox(); // Return an empty SizedBox if no data or there's an error
                  // }
                  if (snapshot.hasError) {
                    print('Error fetching projects: ${snapshot.error}');
                    return const Center(
                      child: Text('An error occurred while fetching projects.'),
                    );
                  }

                  if (!snapshot.hasData) {
                     return const Center(
                      child: Text('No projects available.'),
                    );
                  }

                  // Ensure that snapshot data is not null before accessing it
                final project = snapshot.data?.docs.map((doc) {
                        print('Document data: ${doc.data()}'); // Debug log
                        return Project.fromDocument(doc as DocumentSnapshot);
                      }).toList() ??
                      [];

                  // Return a message if the project list is empty
                  if (project.isEmpty) {
                    return const Center(
                      child: Text('No projects available.'),
                    );
                  }

                  // Build the ListView if data is available
                  return ListView.builder(
                    shrinkWrap:
                        true, // Allows ListView to fit within the scroll view
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevents separate scrolling
                    itemCount: project.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ProjectView(
                          index: index,
                          imagePath: project[index].imageUrls.isNotEmpty
                              ? project[index].imageUrls.first
                              : '', // Use an empty string if no image URLs are available
                          title: project[index].title,
                          description: project[index].description,
                          viewCodeUrl: project[index].repoUrl,
                          viewAppUrl: project[index].hostedAppUrl,
                          appType: project[index].appType,
                          applicationTypeTitle:
                              project[index].applicationTypeTitle,
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(
              height: 70.0,
            ),
            Center(
              child: Text(
                "Please Ask For More Projects",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
            ),

            Center(
              child: Column(
                children: [
                  const Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.white, height: 1.8, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      const url =
                          'https://github.com/Dagi-Moses'; // Replace with your URL

                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child:
                        const Text("click here to view my Git Hub Repository,",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              height: 1.8,
                            )),
                  ),
                  const Text(
                    "This is the portfolio section. There is alot of work here",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: PortfolioStats(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(key: scrollProvider.keys[4], child: EducationSection()),
            SizedBox(
              height: ScreenHelper.isMobile(context) ? 0 : 50.0,
            ),
            Container(key: scrollProvider.keys[5], child: SkillSection()),
            const SizedBox(
              height: 50.0,
            ),
            // Sponsors(),
            // SizedBox(
            //   height: 50.0,
            // ),
            Container(key: scrollProvider.keys[6], child: TestimonialWidget()),
            Container(key: scrollProvider.keys[7], child: Footer()),
          ],
        ),
      ),
    );
  }
}
