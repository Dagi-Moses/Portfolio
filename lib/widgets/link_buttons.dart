import 'package:Dagi_Moses_Portfolio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String? text;
  final String url;
  final bool isPrimary;

  const LinkButton({
    Key? key,
     this.text,
    required this.url,
    this.isPrimary = true,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: isPrimary ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: isPrimary ? null : Border.all(color: kPrimaryColor),
        ),
        height: 48.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: TextButton(
          onPressed: _launchUrl,
          child: Center(
            child: Text(
              text ?? (isPrimary ?"View Code" : "Live Demo"),
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


class LinkButtons extends StatelessWidget {
  final String gitHubUrl;
  final String liveDemoUrl;
  

  const LinkButtons({
    Key? key,
    required this.gitHubUrl,
    required this.liveDemoUrl,
  
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return 

Row(
  children: [
    LinkButton(
      text: "View Code",
      url: gitHubUrl,
      isPrimary: true,
    ),
    const SizedBox(width: 10.0),
    LinkButton(
      text: "Live Demo",
      url: liveDemoUrl,
      isPrimary: false,
    ),
  ],
);
  }
}

// Usage example:



