import 'package:flutter/material.dart';
import 'package:travel_buddy/models/travel_place.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,

        image: DecorationImage(
          opacity: 0.8,
          fit: BoxFit.fill,
          image:
              place.coverImage != null
                  ? NetworkImage(place.coverImage!)
                  : AssetImage(
                    'assets/images/A Visit to a Hill Station Essay in English - 100, 200, 500 Words.jpg',
                  ),
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(172, 255, 255, 255),

          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  place.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                place.location != null
                    ? Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 15),
                        Text(place.location!.address),
                      ],
                    )
                    : SizedBox.shrink(),
              ],
            ),
            CircleAvatar(
              radius: 5,
              backgroundColor: place.isVisited ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
