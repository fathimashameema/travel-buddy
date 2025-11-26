import 'dart:io';
import 'package:flutter_riverpod/legacy.dart';

class AddPlaceState {
  final String name;
  final String description;
  final String location;
  final String latitude;
  final String longitude;
  final bool isVisited;
  final DateTime? visitedDate;
  final String visitReport;
  final double rating;
  final File? coverImage;

  const AddPlaceState({
    this.name = "",
    this.description = "",
    this.location = "",
    this.latitude = "",
    this.longitude = "",
    this.isVisited = false,
    this.visitedDate,
    this.visitReport = "",
    this.rating = 0,
    this.coverImage,
  });

  AddPlaceState copyWith({
    String? name,
    String? description,
    String? location,
    String? latitude,
    String? longitude,
    bool? isVisited,
    DateTime? visitedDate,
    String? visitReport,
    double? rating,
    File? coverImage,
  }) {
    return AddPlaceState(
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isVisited: isVisited ?? this.isVisited,
      visitedDate: visitedDate ?? this.visitedDate,
      visitReport: visitReport ?? this.visitReport,
      rating: rating ?? this.rating,
      coverImage: coverImage ?? this.coverImage,
    );
  }
}

class AddPlaceNotifier extends StateNotifier<AddPlaceState> {
  AddPlaceNotifier() : super(const AddPlaceState());

  void setName(String value) =>
      state = state.copyWith(name: value);

  void setDescription(String value) =>
      state = state.copyWith(description: value);

  void setLocation(String value) =>
      state = state.copyWith(location: value);

  void setLatitude(String value) =>
      state = state.copyWith(latitude: value);

  void setLongitude(String value) =>
      state = state.copyWith(longitude: value);

  void toggleVisited(bool value) =>
      state = state.copyWith(isVisited: value, visitedDate: value ? state.visitedDate : null);

  void setVisitedDate(DateTime value) =>
      state = state.copyWith(visitedDate: value);

  void setVisitReport(String value) =>
      state = state.copyWith(visitReport: value);

  void setRating(double value) =>
      state = state.copyWith(rating: value);

  void setCoverImage(File file) =>
      state = state.copyWith(coverImage: file);

  void reset() => state = const AddPlaceState();
}

final addPlaceProvider = StateNotifierProvider<AddPlaceNotifier, AddPlaceState>(
  (ref) => AddPlaceNotifier(),
);
