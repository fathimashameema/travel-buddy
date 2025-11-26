
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final double borderRadius;
  final double height;

  const CustomSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search',
    this.borderRadius = 12,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(174, 255, 255, 255),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: const Color.fromARGB(119, 224, 224, 224)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const SizedBox(width: 6),
          Icon(Icons.search, color: theme.iconTheme.color),
          const SizedBox(width: 8),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: controller ?? TextEditingController(),
              builder: (context, value, _) {
                return TextField(
                  cursorColor: Colors.black,
                  controller: controller,
                  onChanged: onChanged,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.roboto(color: Colors.grey.shade400),
                    hintText: hintText,
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                );
              },
            ),
          ),

          ValueListenableBuilder(
            valueListenable: controller ?? TextEditingController(),
            builder: (context, value, _) {
              if (controller == null || controller!.text.isEmpty) {
                return SizedBox.shrink();
              }
              return IconButton(
                icon: const Icon(Icons.clear, size: 20, color: Colors.black),
                onPressed: () {
                  controller!.clear();
                  onChanged?.call('');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
