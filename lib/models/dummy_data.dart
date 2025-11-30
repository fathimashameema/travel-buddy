import 'package:travel_buddy/models/location_model.dart';
import 'package:travel_buddy/models/travel_place.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

final List<Place> dummyPlaces = [
  Place(
    id: uuid.v4(),
    name: "Taj Mahal",
    description:
        "The Taj Mahal was designated as a UNESCO World Heritage Site in 1983 for being the jewel of Islamic art in India and one of the universally admired masterpieces of the world's heritage. It is regarded as one of the best examples of Mughal architecture and a symbol of Indian history. The Taj Mahal is a major tourist attraction and attracts more than five million visitors a year.",
    location: LocationModel(
      address: "Agra, India",
      latitude: 24.4,
      longitude: 234.3,
    ),

    coverImage: null,
    galleryImages: null,
    isFavourite: true,
    isVisited: true,
    visitedDate: DateTime(2024, 2, 14),
    visitReport:
        "The monument is breathtaking during sunrise. Crowded but worth it!",
    userRating: 4.8,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Place(
    id: uuid.v4(),
    name: "Eiffel Tower",
    description: "An iconic iron tower in Paris.",
    location: LocationModel(
      address: "Paris, France",
      latitude: 24.4,
      longitude: 234.3,
    ),

    coverImage: null,
    galleryImages: null,
    isFavourite: false,

    isVisited: false,
    visitedDate: null,
    visitReport: null,
    userRating: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Place(
    id: uuid.v4(),
    name: "Bali Beach",
    description: "Beautiful relaxing beach with blue waters and soft waves.",
    location: LocationModel(
      address: "Bali, Indonesia",
      latitude: 24.4,
      longitude: 234.3,
    ),

    coverImage: null,
    galleryImages: null,
    isFavourite: true,

    isVisited: true,
    visitedDate: DateTime(2023, 11, 8),
    visitReport: "Amazing sunset! Must try the beachside cafes.",
    userRating: 4.5,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Place(
    id: uuid.v4(),
    name: "Mount Fuji",
    description: "Japan’s highest mountain and a popular hiking destination.",
    location: LocationModel(
      address: "Honshu, Japan",
      latitude: 24.4,
      longitude: 234.3,
    ),

    coverImage: null,
    galleryImages: null,
    isFavourite: true,

    isVisited: false,
    visitedDate: null,
    visitReport: null,
    userRating: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),

  Place(
    id: uuid.v4(),
    name: "Niagara Falls",
    description: "Massive waterfalls between the USA and Canada border.",
    location: LocationModel(
      address: 'niagra',
      latitude: 24.4,
      longitude: 234.3,
    ),

    coverImage: null,
    galleryImages: null,
    isFavourite: false,

    isVisited: true,
    visitedDate: DateTime(2022, 7, 21),
    visitReport:
        "Very refreshing and powerful water flow! Boat tour is a must.",
    userRating: 4.9,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
