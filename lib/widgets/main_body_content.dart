import 'package:flutter/material.dart';
import 'package:travel_buddy/models/travel_place.dart';
import 'package:travel_buddy/screens/place_details_screen.dart';
import 'package:travel_buddy/widgets/grid_card.dart';

class MainBodyContent extends StatelessWidget {
  const MainBodyContent({
    super.key,
    required this.places,
    this.padding,
    this.header,
  });
  final List<Place> places;
  final EdgeInsetsGeometry? padding;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Column(
          children: [
            header ?? SizedBox.shrink(),
            Expanded(
              child: GridView.builder(
                itemCount: places.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final place = places[index];
                  return GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => PlaceDetailsScreen(place: place),
                          ),
                        ),
                    child: GridCard(place: place),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
