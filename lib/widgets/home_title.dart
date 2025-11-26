import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "It's a Big World\n",
            style: GoogleFonts.ubuntu(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Out There,\nGo Explore',
            style: GoogleFonts.brunoAce(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
