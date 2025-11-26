import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_buddy/screens/mark_as_visited.dart';
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
  final _lat = TextEditingController();
  final _lng = TextEditingController();
  final _report = TextEditingController();

  Future<void> pickCoverImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ref.read(addPlaceProvider.notifier).setCoverImage(File(picked.path));
    }
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

    return Scaffold(
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
                      FieldTitle(title: 'cover image'),
                      GestureDetector(
                        onTap: pickCoverImage,
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black87),
                            borderRadius: BorderRadius.circular(16),
                          ),
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
                      ),

                      const SizedBox(height: 20),
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
                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _lat,
                              hint: "Latitude",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: _lng,
                              hint: "Longitude",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

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
