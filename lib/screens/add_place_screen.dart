import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:travel_buddy/models/location_model.dart';
import 'package:travel_buddy/provider/simple_providers.dart';
import 'package:travel_buddy/screens/mark_as_visited.dart';
import 'package:travel_buddy/widgets/container_field.dart';
import 'package:travel_buddy/widgets/custom_elevated_button.dart';
import 'package:travel_buddy/widgets/custom_text_field.dart';
import 'package:travel_buddy/widgets/field_title.dart';
import 'package:travel_buddy/widgets/gradient_container.dart';
import 'package:travel_buddy/widgets/sub_heading.dart';
import '../provider/add_place_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _picker = ImagePicker();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _location = TextEditingController();

  final _report = TextEditingController();

  String? locationImage(LocationModel? pickedLocation) {
    if (pickedLocation == null) {
      return null;
    }
    final latituade = pickedLocation.latitude;
    final longitude = pickedLocation.longitude;
    return "https://staticmap.openstreetmap.fr/staticmap.php?"
        "center=$latituade,$longitude&zoom=16&size=600x300&markers=$latituade,$longitude,red-pushpin";
  }

  Future<void> pickCoverImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ref.read(addPlaceProvider.notifier).setCoverImage(File(picked.path));
    }
  }

  Future<String?> getAddress(double lat, double lng) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lng&format=json',
    );

    final response = await http.get(
      url,
      headers: {"User-Agent": "travel-buddy-app"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["display_name"];
    }
    return null;
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    ref.read(isLoadingProvider.notifier).state = true;

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    // final url = Uri.parse(
    //   'https://geocode.googleapis.com/v4beta/geocode/location/$lat,$lng?key=AIzaSyAOx02A5Auf4cBhlCLFv8HY_T_u5raSDqQ',
    // );
    // final response = await http.get(url);
    // final resData = json.decode(response.body);
    // log(response.body);
    // final address = resData['results'][0]['formattedAddress'];
    if (lat == null || lng == null) {
      return;
    }
    ref.read(isLoadingProvider.notifier).state = false;
    final address = await getAddress(lat, lng);
    if (address == null) {
      return;
    }
    _location.text = address;

    ref.read(setLocationData.notifier).state = LocationModel(
      address: address,
      latitude: lat,
      longitude: lng,
    );
    log(address);
  }

  @override
  void dispose() {
    _name.dispose();
    _report.dispose();
    _description.dispose();
    _location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addPlaceProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final pickedLocation = ref.watch(setLocationData);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CustomElevatedButton(
        title: 'Save',
        onTap: () {
          if (state.isVisited) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => MarkAsVisitedScreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: GradientContainer(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(heading: "Add New Place"),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      FieldTitle(title: 'Place name'),

                      CustomTextField(
                        controller: _name,
                        hint: "What is this place?",
                      ),
                      const SizedBox(height: 15),
                      FieldTitle(title: 'Description'),

                      CustomTextField(
                        controller: _description,
                        hint: "About this place...",
                        maxLines: 4,
                      ),
                      const SizedBox(height: 15),
                      FieldTitle(title: 'Location'),
                      CustomTextField(controller: _location, hint: "Location"),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ContainerField(
                              onTap: _getCurrentLocation,
                              child:
                                  isLoading
                                      ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                          strokeWidth: 2,
                                        ),
                                      )
                                      : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.locationDot,
                                            size: 18,
                                          ),
                                          Text('current Location'),
                                        ],
                                      ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ContainerField(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.mapLocationDot,
                                    size: 18,
                                  ),
                                  Text('Find in Map'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      if (locationImage(pickedLocation) != null)
                        Image.network(locationImage(pickedLocation)!),
                      FieldTitle(title: 'cover image'),
                      ContainerField(
                        height: 180,
                        onTap: pickCoverImage,
                        child:
                            state.coverImage == null
                                ? const Center(
                                  child: Text("Tap to add cover image 📸"),
                                )
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.file(
                                    state.coverImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Have you visited this place?",
                            style: TextStyle(fontSize: 16),
                          ),

                          CupertinoSwitch(
                            activeTrackColor: Colors.lightBlueAccent,
                            thumbIcon: WidgetStatePropertyAll(
                              Icon(Icons.favorite),
                            ),
                            value: state.isVisited,
                            onChanged: (value) {
                              ref
                                  .read(addPlaceProvider.notifier)
                                  .toggleVisited(value);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
