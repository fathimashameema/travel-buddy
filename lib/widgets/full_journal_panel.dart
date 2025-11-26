import 'package:flutter/material.dart';
import 'package:travel_buddy/models/travel_place.dart';

class FullJournalPanel extends StatelessWidget {
  const FullJournalPanel({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    final journal = place.visitReport;
    final gallery = place.galleryImages ?? [];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 104, 209, 125),
            Color.fromARGB(255, 104, 209, 151),
            Color.fromARGB(255, 174, 240, 195),
            Color.fromARGB(255, 193, 244, 214),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "Travel Journal",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            if (journal != null && journal.trim().isNotEmpty)
              Text(journal, style: const TextStyle(fontSize: 17))
            else
              const Text(
                "No journal added.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

            const SizedBox(height: 30),

            /// Gallery Section
            if (gallery.isNotEmpty)
              const Text(
                "Gallery",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 10),

            if (gallery.isNotEmpty)
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gallery.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 130,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(gallery[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
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
