import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_buddy/models/travel_place.dart';
import 'package:travel_buddy/screens/mark_as_visited.dart';
import 'package:travel_buddy/widgets/collapsed_header.dart';
import 'package:travel_buddy/widgets/custom_elevated_button.dart';
import 'package:travel_buddy/widgets/full_journal_panel.dart';
import 'package:travel_buddy/widgets/place_details_content.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    final PanelController panelController = PanelController();

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar:
          place.isVisited
              ? null
              : CustomElevatedButton(
                title: 'Mark as visited',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => MarkAsVisitedScreen()),
                  );
                },
              ),
      body:
          place.isVisited
              ? SlidingUpPanel(
                controller: panelController,
                minHeight: 60,
                maxHeight: MediaQuery.of(context).size.height * 0.95,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                parallaxEnabled: true,
                parallaxOffset: 0.3,

                collapsed: CollapsedHeader(),

                panel: FullJournalPanel(place: place),

                backdropEnabled: true,
                backdropOpacity: 0.3,
                body: PlaceDetailsContent(place: place),
              )
              : PlaceDetailsContent(place: place),
    );
  }
}
