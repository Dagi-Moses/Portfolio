import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/carousel_item_model.dart';
import '../../utils/constants.dart';


List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(

    text: Column(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox( height: 20,),
        Text(
          "SOFTWARE DEVELOPER",
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Text(
          "DAGI MOSES",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        const SizedBox(
          height: 13.0,
        ),
        const Text(
          "Full Stack Flutter and Node.js Stack Developer based in Lagos,",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 18.0,
            height: 1.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Wrap(
          children: [
            const Text(
              "Need a custom Application/Website? ",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 18.0,
                height: 1.5,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "Got a project? Let's talk.",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
       
      ],
    ),
   image: SizedBox(
     // width: 120, // Set your desired width
      height: 550, // Set your desired height
      child: Image.asset(
        "assets/mypic.jpg",
       
      ),
    ),

  ),
);
