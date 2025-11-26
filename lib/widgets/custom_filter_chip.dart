
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_buddy/provider/simple_providers.dart';

class CustomFilterChip extends ConsumerWidget {
  const CustomFilterChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(selectedFiltersProvider);
    final isSelected = selectedFilters.contains(label);

    return GestureDetector(
      onTap: () {
        final notifier = ref.read(selectedFiltersProvider.notifier);

        if (isSelected) {
          notifier.state = [...selectedFilters]..remove(label);
        } else {
          notifier.state = [...selectedFilters, label];
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 76, 157, 187)
                  : const Color.fromARGB(174, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.close, size: 14, color: Colors.white),
              ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
