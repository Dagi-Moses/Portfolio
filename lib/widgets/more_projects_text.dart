import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreProjectsText extends StatelessWidget {
  const MoreProjectsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Please Ask For More Projects",
        style: GoogleFonts.oswald(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 30.0,
          height: 1.3,
        ),
      ),
    );
  }
}
