import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_scroll_to/flutter_scroll_to.dart';
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
import 'components/twitter_clone.dart';

final scrollControllerProvider =
    StateProvider<ScrollController>((ref) => ScrollController());

final keysProvider = Provider<List<GlobalKey>>((ref) => [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      // Add more keys for other widgets
    ]);

final scrollToSectionProvider =
    StateProvider<Future<void> Function(GlobalKey)>((ref) {
  final _scrollController = ref.read(scrollControllerProvider);
  return (GlobalKey key) async {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero).dy;
     _scrollController.jumpTo(offset,
       );
       ;
  };
});

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ref.read(scrollControllerProvider);
     @override
  void initState() {
    super.initState();

    final scrollToSection = ref.read(scrollToSectionProvider);
    final keys = ref.read(keysProvider);
   setState(() {
    headerItems = [
      HeaderItem(
          title: "MY INTRO",
          onTap: () {
            scrollToSection(keys[1]);
          }),
      HeaderItem(
          title: "SERVICES",
          onTap: () {
            scrollToSection(keys[2]);
          }),
      HeaderItem(
          title: "PORTFOLIO",
          onTap: () {
            scrollToSection(keys[3]);
          }),
      HeaderItem(
        title: "EDUCATION",
        onTap: () {
          scrollToSection(keys[6]);
        },
      ),
      HeaderItem(title: "SKILLS", onTap: () {
        scrollToSection(keys[7]);
      }),
      HeaderItem(title: "TESTIMONIALS", onTap: () {
        scrollToSection(keys[8]);
      }),
      HeaderItem(
        title: "HIRE ME",
        onTap: () {
          scrollToSection(keys[9]);
        },
        isButton: true,
      ),
    ];
 
      
    });
  }

   // final keys = ref.watch(keysProvider);

    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
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
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems![index].onTap,
                            child: Text(
                              headerItems![index].title,
                              style: TextStyle(
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
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems!.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                key: ref.read(keysProvider)[0],
                child: Header(),
              ),
              Container(key: ref.read(keysProvider)[1], child: Carousel()),
              SizedBox(
                height: 20.0,
              ),
              Container(key: ref.read(keysProvider)[2], child: CvSection()),
              Container(key: ref.read(keysProvider)[3], child: IosAppAd()),
              SizedBox(
                height: 70.0,
              ),
              Container(key: ref.read(keysProvider)[4], child: WebsiteAd()),
              SizedBox(
                height: 20.0,
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
                    Text(
                      "OR",
                      style: TextStyle(
                          color: Colors.white, height: 1.8, fontSize: 16),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  const url =
                                      'https://github.com/Dagi-Moses'; // Replace with your URL

                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              text: "click here to view my Git Hub Repository,",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: kPrimaryColor, 
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                height: 1.8,
                              )),
                        ],
                      ),
                    ),
                    Text(
                      "This is the portfolio section. There is alot of work here",
                      style: TextStyle(color: Colors.white, height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                key: ref.read(keysProvider)[5],
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: PortfolioStats(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  key: ref.read(keysProvider)[6], child: EducationSection()),
              SizedBox(
                height:ScreenHelper.isMobile(context)? 0: 50.0,
              ),
              Container(key: ref.read(keysProvider)[7], child: SkillSection()),
              SizedBox(
                height: 50.0,
              ),
              // Sponsors(),
              // SizedBox(
              //   height: 50.0,
              // ),
              Container(
                  key: ref.read(keysProvider)[8], child: TestimonialWidget()),
              Container(key: ref.read(keysProvider)[9], child: Footer()),
            ],
          ),
        ),
      ),
    );
  }
}
