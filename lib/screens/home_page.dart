import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_buddy/models/dummy_data.dart';
import 'package:travel_buddy/provider/simple_providers.dart';
import 'package:travel_buddy/screens/add_place_screen.dart';
import 'package:travel_buddy/widgets/custom_filter_chip.dart';
import 'package:travel_buddy/widgets/custom_icon_button.dart';
import 'package:travel_buddy/widgets/custom_search_field.dart';
import 'package:travel_buddy/widgets/filter_buttons.dart';
import 'package:travel_buddy/widgets/gradient_container.dart';
import 'package:travel_buddy/widgets/home_title.dart';
import 'package:travel_buddy/widgets/main_body_content.dart';
import 'package:travel_buddy/widgets/sub_heading.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showFilters = ref.watch(filterVisibilityProvider);
    // final selectedFilters = ref.watch(selectedFiltersProvider);
    return Scaffold(
      body: GradientContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (ctx) => GradientContainer(
                              child: MainBodyContent(
                                places:
                                    dummyPlaces
                                        .where((place) => place.isFavourite)
                                        .toList(),
                                header: SubHeading(heading: 'Favourite Places'),
                              ),
                            ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
                CustomIconButton(
                  icon: const Icon(Icons.add),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AddPlaceScreen()),
                    );
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 55.0, top: 10, bottom: 25),
              child: HomeTitle(),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomSearchField(
                    height: 45,
                    controller: _searchController,
                    hintText: 'Search your favourite place...',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(174, 255, 255, 255),
                    minimumSize: const Size(40, 45),
                  ),
                  icon: const Icon(Icons.tune),
                  onTap: () {
                    ref.read(filterVisibilityProvider.notifier).state =
                        !showFilters;
                  },
                ),
              ],
            ),
            FilterButtons(showFilters: showFilters, ref: ref),
            const SizedBox(height: 20),
            Expanded(child: MainBodyContent(places: dummyPlaces)),
          ],
        ),
      ),
    );
  }
}
