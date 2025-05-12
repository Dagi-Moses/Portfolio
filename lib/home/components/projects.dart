import 'package:Dagi_Moses_Portfolio/widgets/app_image.dart';
import 'package:Dagi_Moses_Portfolio/widgets/project_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class Projects extends StatelessWidget {
  const Projects(
      {super.key,
      required this.projectDescription,
      required this.gitHubUrl,
      required this.liveDemoUrl,
      required this.assetImage,
      required this.platform,
      required this.projectName,
      required this.index});
  final String projectDescription;
  final String projectName;
  final String gitHubUrl;
  final String liveDemoUrl;
  final String assetImage;
  final AppPlatform platform;

  final int
      index; // This should be passed as a parameter or managed by the parent widget

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
          final List<Widget> children = index.isEven
              ? [
                  AppImage(
                    assetPath: assetImage,
                    fit: BoxFit.contain,
                    constraints: constraints,
                    platform: platform,
                  ),
                  const SizedBox(width: 25.0),
                  ProjectText(
                    platform: platform,
                    projectName: projectName,
                    projectDescription: projectDescription,
                    gitHubUrl: gitHubUrl,
                    liveDemoUrl: liveDemoUrl,
                    constraints: constraints,
                  ),
                ]
              : [
                  ProjectText(
                    platform: platform,
                    projectName: projectName,
                    projectDescription: projectDescription,
                    gitHubUrl: gitHubUrl,
                    liveDemoUrl: liveDemoUrl,
                    constraints: constraints,
                  ),
                  const SizedBox(width: 25.0),
                  AppImage(
                    assetPath: assetImage,
                    fit: BoxFit.contain,
                    constraints: constraints,
                    platform: platform,
                  ),
                ];
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
