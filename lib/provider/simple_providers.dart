import 'package:flutter_riverpod/legacy.dart';
import 'package:travel_buddy/models/location_model.dart';

final filterVisibilityProvider = StateProvider<bool>((ref) => false);
final selectedFiltersProvider = StateProvider<List<String>>((ref) => []);
final detailsExpandedProvider = StateProvider<bool>((ref) => false);
final isLoadingProvider = StateProvider<bool>((ref) => false);
final setLocationData = StateProvider<LocationModel?>((ref) => null);
