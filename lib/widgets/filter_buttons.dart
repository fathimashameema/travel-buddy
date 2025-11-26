import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_buddy/provider/simple_providers.dart';
import 'package:travel_buddy/widgets/custom_filter_chip.dart';
import 'package:travel_buddy/widgets/custom_icon_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
    required this.showFilters,
    required this.ref,
  });

  final bool showFilters;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder:
          (child, animation) =>
              SizeTransition(sizeFactor: animation, child: child),
      child:
          showFilters
              ? Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
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
    );
  }
}
