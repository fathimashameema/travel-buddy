import 'package:travel_buddy/models/location_model.dart';

class Place {
  final String id;
  final String name;
  final String? description;
  final LocationModel? location;

  final String? coverImage;
  final List<String>? galleryImages;
  final bool isFavourite;

  final bool isVisited;
  final DateTime? visitedDate;

  final String? visitReport;
  final double? userRating;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Place({
    required this.id,
    required this.name,
    this.description,
    this.location,

    this.coverImage,
    this.galleryImages,
    this.isFavourite = false,
    this.isVisited = false,
    this.visitedDate,
    this.visitReport,
    this.userRating,
    required this.createdAt,
    required this.updatedAt,
  });

  Place copyWith({
    String? id,
    String? name,
    String? description,
    LocationModel? location,

    String? coverImage,
    List<String>? galleryImages,
    bool? isVisited,
    bool? isFavourite,
    DateTime? visitedDate,
    String? visitReport,
    double? userRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,

      coverImage: coverImage ?? this.coverImage,
      galleryImages: galleryImages ?? this.galleryImages,
      isFavourite: isFavourite ?? this.isFavourite,
      isVisited: isVisited ?? this.isVisited,
      visitedDate: visitedDate ?? this.visitedDate,
      visitReport: visitReport ?? this.visitReport,
      userRating: userRating ?? this.userRating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
