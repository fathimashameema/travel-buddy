import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_buddy/models/travel_place.dart';

class PlaceDetailsHeader extends StatelessWidget {
  const PlaceDetailsHeader({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Text(
                  place.name,
                  style: GoogleFonts.ubuntu(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (place.location != null)
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.black45),
                  SizedBox(width: 10),
                  Text(
                    place.location!.address,
                    style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (place.userRating != null)
              Row(
                children: [
                  Icon(Icons.star_border, color: Colors.black45),
                  Text(
                    place.userRating!.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Colors.green,
                    size: 16,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'See in Map',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
