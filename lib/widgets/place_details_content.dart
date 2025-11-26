
import 'package:flutter/material.dart';
import 'package:travel_buddy/models/travel_place.dart';
import 'package:travel_buddy/widgets/custom_icon_button.dart';
import 'package:travel_buddy/widgets/place_details_header.dart';

class PlaceDetailsContent extends StatelessWidget {
  const PlaceDetailsContent({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color.fromARGB(0, 131, 20, 20)],
                      stops: [0.7, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child:
                      place.coverImage != null
                          ? Image.network(place.coverImage!, fit: BoxFit.cover)
                          : Image.asset(
                            "assets/images/A Visit to a Hill Station Essay in English - 100, 200, 500 Words.jpg",
                            fit: BoxFit.cover,
                          ),
                ),
              ),
              Positioned(
                top: 40,
                right: 10,
                child: CustomIconButton(
                  icon: Icon(Icons.favorite),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceDetailsHeader(place: place),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                if (place.description != null)
                  Text(place.description!, style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
