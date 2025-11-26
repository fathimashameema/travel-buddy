import 'package:flutter_riverpod/legacy.dart';

final filterVisibilityProvider = StateProvider<bool>((ref) => false);
final selectedFiltersProvider = StateProvider<List<String>>((ref) => []);
final detailsExpandedProvider = StateProvider<bool>((ref) => false);
