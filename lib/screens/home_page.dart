import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_buddy/models/dummy_data.dart';
import 'package:travel_buddy/models/travel_place.dart';
import 'package:travel_buddy/provider/simple_providers.dart';
import 'package:travel_buddy/screens/add_place_screen.dart';
import 'package:travel_buddy/screens/place_details_screen.dart';
import 'package:travel_buddy/widgets/custom_filter_chip.dart';
import 'package:travel_buddy/widgets/custom_icon_button.dart';
import 'package:travel_buddy/widgets/custom_search_field.dart';
import 'package:travel_buddy/widgets/gradient_container.dart';
import 'package:travel_buddy/widgets/grid_card.dart';
import 'package:travel_buddy/widgets/home_title.dart';

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
                  onTap: () {},
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

            /// Filter Chips Panel
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) =>
                      SizeTransition(sizeFactor: animation, child: child),
              child:
                  showFilters
                      ? Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            CustomFilterChip(label: 'Visited'),
                            CustomFilterChip(label: 'To be visit'),
                            CustomFilterChip(label: 'Nearest'),
                            CustomIconButton(
                              icon: Icon(Icons.close),
                              onTap: () {
                                ref
                                    .read(selectedFiltersProvider.notifier)
                                    .state = [];
                              },
                            ),
                          ],
                        ),
                      )
                      : const SizedBox.shrink(),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: dummyPlaces.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final place = dummyPlaces[index];
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
