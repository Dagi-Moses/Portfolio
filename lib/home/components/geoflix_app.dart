import 'package:Dagi_Moses_Portfolio/functions/functions.dart';
import 'package:Dagi_Moses_Portfolio/models/projects.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class ProjectView extends StatelessWidget {
  final int index;
  final String imagePath;
  final String title;
  final String description;
  final String viewCodeUrl;
 String ? viewAppUrl;
  final AppType appType;
  final AppTypeTitle applicationTypeTitle;

   ProjectView( {
    Key? key,
    required this.applicationTypeTitle,
   required this.appType,
    required this.index,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.viewCodeUrl,
    this.viewAppUrl,
  }) : super(key: key);

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
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 720.0;

          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              mainAxisAlignment: isLargeScreen ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
              children: 
                   index.isEven
                      ? [
                          _buildTextContent(constraints),
                          _buildImage(constraints),
                        ]
                      : [
                          _buildImage(constraints),
                          
                          _buildTextContent(constraints),
                        ]
                
            ),
          );
        },
      ),
    );
  }
  Widget _buildImage(BoxConstraints constraints) {
    return
   Expanded(
    flex: constraints.maxWidth > 720.0 ? 1 : 0,
     child: SizedBox(
     height: 350,
     child: Image.network(
     //  width: constraints.maxWidth > 720.0 ? null : 350.0,
     imagePath,
         ),
      ),
   );
                        
  }

  
      
  Widget _buildTextContent(BoxConstraints constraints) {
    return  Expanded(
      flex: constraints.maxWidth > 720.0 ? 1 : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            getAppTypeTitleAsString(applicationTypeTitle),
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            title,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: const TextStyle(
              color: kCaptionColor,
              height: 1.5,
              fontSize: 15.0,
            ),
          ),
          const SizedBox(height: 25.0),
          Row(
            children: [
              _buildButton("View Code", viewCodeUrl),
              if(viewAppUrl != null)
              const SizedBox(width: 10.0),
               if (viewAppUrl != null)
             _buildButton("View  ${getAppTypeAsString(appType)}", viewAppUrl!, isPrimary: true) ,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, String url, {bool isPrimary = false}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: isPrimary ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(8.0),
          border: isPrimary ? null : Border.all(color: kPrimaryColor),
        ),
        height: 48.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: TextButton(
          onPressed: () async {
            await launchUrlFunction(url);
          },
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isPrimary ? Colors.white : kPrimaryColor,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
