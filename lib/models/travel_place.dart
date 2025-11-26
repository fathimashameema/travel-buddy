
class Place {
  final String id;                       // Unique identifier
  final String name;                     // Name of the place
  final String? description;             // Optional description
  final String? location;                // City / country / address
  final double? latitude;                // For map support
  final double? longitude;               // For map support
  
  final String? coverImage;              // MAIN cover image (URL or local path)
  final List<String>? galleryImages;     // Additional images

  final bool isVisited;                  // Has user visited this place?
  final DateTime? visitedDate;           // When they visited

  final String? visitReport;             // Journey notes, summary
  final double? userRating;              // 1–5 rating (optional)

  final DateTime createdAt;              // When the place was added
  final DateTime updatedAt;              // For future sync features

  const Place({
    required this.id,
    required this.name,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.coverImage,
    this.galleryImages,
    this.isVisited = false,
    this.visitedDate,
    this.visitReport,
    this.userRating,
    required this.createdAt,
    required this.updatedAt,
  });

  /// copyWith allows modification of only some fields
  Place copyWith({
    String? id,
    String? name,
    String? description,
    String? location,
    double? latitude,
    double? longitude,
    String? coverImage,
    List<String>? galleryImages,
    bool? isVisited,
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
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      coverImage: coverImage ?? this.coverImage,
      galleryImages: galleryImages ?? this.galleryImages,
      isVisited: isVisited ?? this.isVisited,
      visitedDate: visitedDate ?? this.visitedDate,
      visitReport: visitReport ?? this.visitReport,
      userRating: userRating ?? this.userRating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
