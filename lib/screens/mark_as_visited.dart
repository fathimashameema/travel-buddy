import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_buddy/provider/add_place_provider.dart';
import 'package:travel_buddy/widgets/custom_elevated_button.dart';
import 'package:travel_buddy/widgets/custom_text_field.dart';
import 'package:travel_buddy/widgets/date_picker_widget.dart';
import 'package:travel_buddy/widgets/field_title.dart';
import 'package:travel_buddy/widgets/gradient_container.dart';
import 'package:travel_buddy/widgets/sub_heading.dart';

class MarkAsVisitedScreen extends ConsumerStatefulWidget {
  const MarkAsVisitedScreen({super.key});
  @override
  ConsumerState<MarkAsVisitedScreen> createState() =>
      _MarkAsVisitedScreenState();
}

class _MarkAsVisitedScreenState extends ConsumerState<MarkAsVisitedScreen> {
  final _titleController = TextEditingController();
  final _journalController = TextEditingController();
  DateTime? visitedDate;
  int rating = 0;
  final List<XFile> images = [];
  final ImagePicker picker = ImagePicker();
  Future<void> pickImages() async {
    final picked = await picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() => images.addAll(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addPlaceProvider);
    return Scaffold(
      body: GradientContainer(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(heading: 'How was your Journey ?!'),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldTitle(title: "Journal Title"),
                      CustomTextField(
                        controller: _titleController,
                        hint: 'How do you name your journal?',
                      ),
                      const SizedBox(height: 20),
                      FieldTitle(title: 'Travel journal'),
                      CustomTextField(
                        controller: _journalController,
                        hint: 'Tell us about your journey!',
                        maxLines: 6,
                      ),
                      const SizedBox(height: 20),
                      FieldTitle(title: 'When did you visit?'),
                      GestureDetector(
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() => visitedDate = date);
                          }
                        },
                        child: DatePickerWidget(state: state),
                      ),
                      const SizedBox(height: 20),
                      FieldTitle(title: 'Rate this place'),
                      Center(
                        child: RatingBar.builder(
                          unratedColor: const Color.fromARGB(60, 158, 158, 158),
                          initialRating: state.rating,
                          minRating: 0,
                          maxRating: 5,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          itemSize: 30,
                          updateOnDrag: true,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          itemBuilder:
                              (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (value) {
                            ref
                                .read(addPlaceProvider.notifier)
                                .setRating(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FieldTitle(title: 'Share your memories!'),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          GestureDetector(
                            onTap: pickImages,
                            child: Container(
                              width: 95,
                              height: 95,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.add_a_photo, size: 30),
                            ),
                          ),
                          ...images.map((img) {
                            return Container(
                              width: 95,
                              height: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: FileImage(File(img.path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
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
      bottomNavigationBar: CustomElevatedButton(title: "Save", onTap: () {}),
    );
  }
}
