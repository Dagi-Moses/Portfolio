import 'package:Dagi_Moses_Portfolio/utils/constants.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String assetPath;
  final AppPlatform platform;
  final BoxFit fit;
  final BoxConstraints constraints;

  const AppImage({
    Key? key,
    required this.assetPath,
    required this.platform,
    this.fit = BoxFit.contain,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWide = constraints.maxWidth > 720.0;
    return Expanded(
        flex: isWide ? 1 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: platform == AppPlatform.mobile ? 350 : null,
            child: Image.asset(
              assetPath,
              fit: fit,
              width: platform == AppPlatform.mobile ? 350 : null,
            ),
          ),
        ));
  }
}
